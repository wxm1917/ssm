/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.bo;

import java.util.List;

import com.vatestar.server.common.bo.DomainObject;
import com.vatestar.server.common.bo.Pages;


public class PageListObject extends Pages {

	private List<? extends DomainObject> datas;

	/**
	 * @return the datas
	 */
	public List<? extends DomainObject> getDatas() {
		return datas;
	}

	/**
	 * @param datas
	 * the datas to set
	 */
	public void setDatas(List<? extends DomainObject> datas) {
		this.datas = datas;
	}

}
