package com.vatestar.server.common;

import org.mybatis.spring.SqlSessionTemplate;

/**
 * BaseDAO是DAO的的基础抽象类，应用层定义的DAO实现类都需要继承这个类，同时可以实现应用层定义的DAO接口
 * 
 * @author zhengchao
 * @createDate 2015-3-31
 */
public abstract class BaseDAO {

	// sqlSession 是mybatis用来处理和数据库操作的，
	// 这个要从外部传入，不在此实例化
	protected SqlSessionTemplate sqlSession;

	// 为了让mybatis执行批量操作，需要定义一个batch模式的sqlsession
	protected SqlSessionTemplate sqlSessionBatch;

	// 只提供写入
	final void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 只提供写入
	final void setSqlSessionBatch(SqlSessionTemplate sqlSessionBatch) {
		this.sqlSessionBatch = sqlSessionBatch;
	}

	// 提供一个获取 查询记录总数的方法
	protected int getRecordTotal(String sql) {
		return Integer.valueOf(this.sqlSession.selectOne(sql) + "");
	}
}
