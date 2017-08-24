/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.mybatis;

public enum Connector {

	/* < */
	LESSTHAN(), 
	
	/* > */
	MORETHAN(),  
	
	/* like '%xxx%'  */
	LIKE(),  
	
	/* like '%x'  */
	LEFTLIKE(),
	
	/* like 'x%'  */
	RIGHTLIKE(),
	
	/* = */
	EQUAL(),
	
	/* in */
	IN(),
	
	/* not in */
	NOTIN(),
	
	/* is null */
	ISNULL(),
	
	/* is not null */
	ISNOTNULL(),
	
	/* >= */
	MORETHANOREQUAL(),
	
	/* <= */
	LESSTHANOREQUAL();
	
}
