package com.vatestar.server.common;

import java.util.HashMap;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.LoggerFactory;

/**
 * DAOFactory 是DAO的工厂类 用来生产DAO对象， 用单例模式实现
 * 
 * @author zhengchao
 * @createDate 2015-3-13 增加数据库读写分离双连接能力 调用方可通过getDAO获取master的DAO，getSlaveDAO获取Slave的DAO。 分离从master库得到的DAO和从slaver库得到的DAO
 */
public class DAOFactory {

	private static DAOFactory daoFactory;

	// 定义一个SqlSessionFactory,这个要从外部输入。
	// 如:从外部生成一个sqlSessionFactory.然后调用下面的
	private static SqlSessionFactory sqlSessionFactory = null;
	private static SqlSessionFactory slaveSqlSessionFactory = null;

	// 私有构造函数
	private DAOFactory() {
		// 这里直接从spring容器产生一个sqlSessionFactory.业务层就不用产生了。
		// 1. 则spring的配置文件必须为applicationContext.xml，而且必须配置sqlsessionfactory
		// 2. spring的配置文件必须在程序启动的时候加载，否则会报错。切记这两点!!!!
	}

	// 只写入master数据的sqlSessionFactory,由外部传入
	public static void setSqlSessionFactory(org.apache.ibatis.session.defaults.DefaultSqlSessionFactory sessionFactory) {
		sqlSessionFactory = sessionFactory;
		if (sqlSessionFactory != null)
			LoggerFactory.getLogger(DAOFactory.class).info("master数据库sqlSessionFactory通过spring注入了...");
	}

	// 只写入slave数据库的sqlSessionFactory,由外部传入
	public static void setSlaveSqlSessionFactory(
			org.apache.ibatis.session.defaults.DefaultSqlSessionFactory sessionFactory) {
		slaveSqlSessionFactory = sessionFactory;
		if (slaveSqlSessionFactory != null)
			LoggerFactory.getLogger(DAOFactory.class).info("slave数据库sqlSessionFactory通过spring注入了...");
	}

	// 用ThreadLocal是为了提高生产DAO的性能。并且每个线程只有自己的一个DAO。
	private ThreadLocal<HashMap<String, Object>> threadLocal = new ThreadLocal<HashMap<String, Object>>();

	// 提高对外的访问静态方法接口
	public static DAOFactory getInstance() {
		if (null == daoFactory) {
			daoFactory = new DAOFactory();
		}
		return daoFactory;
	}

	// DAO通用生成函数,负责生成master数据库的DAO
	@SuppressWarnings("unchecked")
	public <T extends BaseDAO> T getDAO(Class<T> t) {

		if (null == sqlSessionFactory) {
			throw new RuntimeException("没有初始化sqlSessionFactory，请先初始化");
		}
		HashMap<String, Object> daomaps = threadLocal.get();
		if (daomaps == null) {
			daomaps = new HashMap<String, Object>();
		}

		String key = t.getName();
		T cacheInstance = (T) daomaps.get(key);

		if (cacheInstance == null) {
			try {
				cacheInstance = t.newInstance();
				// 这里给DAO赋值SqlSession
				SqlSessionTemplate sqlSession = new SqlSessionTemplate(sqlSessionFactory);
				cacheInstance.setSqlSession(sqlSession);

				// 给dao初始化SqlSessionBatch,用来执行批量操作
				SqlSessionTemplate sqlSessionBatch = new SqlSessionTemplate(sqlSessionFactory, ExecutorType.BATCH);
				cacheInstance.setSqlSessionBatch(sqlSessionBatch);

			} catch (InstantiationException e) {
				throw new RuntimeException("InstantiationException", e);
			} catch (IllegalAccessException e) {
				throw new RuntimeException("IllegalAccessException", e);
			}
			daomaps.put(key, cacheInstance);
			threadLocal.set(daomaps);
		}

		return cacheInstance;

	}

	public <T extends BaseDAO> T getDAO(Class<T> t, boolean useMaster) {
		if (useMaster) {
			return getDAO(t);
		} else {
			return getSlaveDAO(t);
		}
	}

	// DAO通用生成函数,负责生成Slave数据库的DAO
	@SuppressWarnings("unchecked")
	public <T extends BaseDAO> T getSlaveDAO(Class<T> t) {

		if (null == slaveSqlSessionFactory) {
			throw new RuntimeException("没有初始化slaveSqlSessionFactory，请先初始化");
		}
		HashMap<String, Object> daomaps = threadLocal.get();
		if (daomaps == null) {
			daomaps = new HashMap<String, Object>();
		}

		String key = t.getName() + "slave";
		T cacheInstance = (T) daomaps.get(key);

		if (cacheInstance == null) {
			try {
				cacheInstance = t.newInstance();
				// 这里给DAO赋值SqlSession
				SqlSessionTemplate sqlSession = new SqlSessionTemplate(slaveSqlSessionFactory);
				cacheInstance.setSqlSession(sqlSession);

				// 给dao初始化SqlSessionBatch,用来执行批量操作
				SqlSessionTemplate sqlSessionBatch = new SqlSessionTemplate(slaveSqlSessionFactory, ExecutorType.BATCH);
				cacheInstance.setSqlSessionBatch(sqlSessionBatch);

			} catch (InstantiationException e) {
				throw new RuntimeException("InstantiationException", e);
			} catch (IllegalAccessException e) {
				throw new RuntimeException("IllegalAccessException", e);
			}
			daomaps.put(key, cacheInstance);
			threadLocal.set(daomaps);
		}

		return cacheInstance;

	}
}
