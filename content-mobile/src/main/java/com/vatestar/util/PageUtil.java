package com.vatestar.util;

import java.util.List;

public class PageUtil {
	private Integer previous;//上一页
	private Integer next;//下一页
	private Integer current=1;//当前页(第几页)
	private Integer first=1;//第一页
	private Integer last;//最后一页
	private Integer startRows;//起始行数
	private Integer endRows;//结束行数
	private Integer startPage;//起始页
	private Integer endPage;//结束页
	private Integer numSize=10;//依次显示几页
	private Integer rowSize=10;//一次显示几行
	private Integer rowCount;//总行数
	private Integer pageCount;//总页数
	private List<?> list;//当前页数据
	public PageUtil(){
	}
	
	/**
	 * 根据参数自动匹配pageUtil下的除List外所有参数
	 * @param current
	 * @param rowCount
	 * @param rowSize
	 */
	public PageUtil(Integer current, Integer rowCount, Integer rowSize){
		current = current == null ? this.current : current;
		rowSize = rowSize == null ? this.rowSize : rowSize;
		this.rowSize = rowSize;
		this.rowCount = rowCount;
		this.first = 1;
		
		if(this.rowCount<=this.rowSize){
			this.pageCount=1;
		}else if(this.rowCount%this.rowSize==0){
			this.pageCount=this.rowCount/this.rowSize;
		}else{
			this.pageCount=this.rowCount/this.rowSize+1;
		}
		System.out.println("pageCount="+this.pageCount+"************");
		System.out.println("rowSize="+this.rowSize);
		System.out.println("rowCount="+this.rowCount);
		//this.pageCount = this.rowCount<this.rowSize?1:;
		if(current>this.pageCount){
			this.current = this.pageCount;
		}else if(current<this.first){
			this.current = this.first;
		}else{
			this.current = current;
		}
		this.startRows = (this.current-1)*this.rowSize+1;
		if(this.current*this.rowSize>rowCount){  
			this.endRows = rowCount;
		}else{
			this.endRows = this.current*this.rowSize;
		}
		this.previous = this.current>1?this.current-1:1;
		this.next = this.current<this.pageCount?this.current+1:this.pageCount;
		this.last = this.pageCount;
		if(this.numSize>=this.pageCount){ //如果总页数小于导航页码长度
			this.startPage = this.first;
			this.endPage = this.pageCount;
		}else if(this.current-numSize/2<0 && this.current+numSize/2>=this.pageCount){
			this.startPage = this.first;
			this.endPage = this.pageCount;
		}else if(this.current-numSize/2<0 && this.current+numSize/2<this.pageCount){
			if(this.current+numSize/2<this.numSize){
				this.startPage = this.first;
				this.endPage = this.numSize;
			}else{
				this.startPage = this.first;
				this.endPage = this.current+numSize/2;
			}
		}else if(this.current-numSize/2>0 && this.current+numSize/2>=this.pageCount){
			if(this.current-numSize/2>this.pageCount-numSize){
				this.startPage = this.pageCount-numSize;
				this.endPage = this.pageCount;
			}else{
				this.startPage = this.current-numSize/2;
				this.endPage = this.pageCount;
			}
		}else if(this.current-numSize/2>0 && this.current+numSize/2<this.pageCount){
			this.startPage = this.current-numSize/2;
			this.endPage = this.current+numSize/2;
		}else if(this.current-numSize/2==0){
			if(this.current+numSize/2>=this.pageCount){
				this.startPage=this.first;
				this.endPage=this.pageCount;
			}else{
				this.startPage=this.first;
				this.endPage=this.numSize;
			}
		}
	}

	public Integer getPrevious() {
		return previous;
	}

	public void setPrevious(Integer previous) {
		this.previous = previous;
	}

	public Integer getNext() {
		return next;
	}

	public void setNext(Integer next) {
		this.next = next;
	}

	public Integer getCurrent() {
		return current;
	}

	public void setCurrent(Integer current) {
		this.current = current;
	}

	public Integer getFirst() {
		return first;
	}

	public void setFirst(Integer first) {
		this.first = first;
	}

	public Integer getLast() {
		return last;
	}

	public void setLast(Integer last) {
		this.last = last;
	}

	public Integer getStartPage() {
		return startPage;
	}

	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}

	public Integer getEndPage() {
		return endPage;
	}

	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}

	public Integer getNumSize() {
		return numSize;
	}

	public void setNumSize(Integer numSize) {
		this.numSize = numSize;
	}

	public Integer getRowSize() {
		return rowSize;
	}

	public void setRowSize(Integer rowSize) {
		this.rowSize = rowSize;
	}

	public Integer getRowCount() {
		return rowCount;
	}

	public void setRowCount(Integer rowCount) {
		this.rowCount = rowCount;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public Integer getstartRows() {
		return startRows;
	}

	public void setstartRows(Integer startRows) {
		this.startRows = startRows;
	}

	public Integer getendRows() {
		return endRows;
	}

	public void setendRows(Integer endRows) {
		this.endRows = endRows;
	}
	
	public static void main(String[] args) {
		PageUtil pu=new PageUtil(1,9050,15);
		System.out.println(pu.endPage);
	}
	
}
