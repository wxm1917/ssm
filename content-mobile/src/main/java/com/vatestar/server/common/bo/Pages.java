package com.vatestar.server.common.bo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

import com.vatestar.server.common.bo.PageBean;
import com.vatestar.server.common.bo.Pages;



public class Pages {

	protected int first = 1;

	protected int last = 1;

	protected int previous = 1;

	protected int next = 1;

	protected int current = 1;

	protected int pageCount = 1;

	protected int rowCount = 10;

	protected int start = 1;

	protected int end = 1;

	protected int count = 0;

	protected Collection<PageBean> pageNumList = new ArrayList<PageBean>(); // 存放页码列表供前端显示

	protected int pageListCount = 6; // 页面显示的页码总数

	protected int previousBlock = 1; // 前一个页码列表起始页码

	protected int nextBlock = 1; // 后一个页码列表起始页码

	protected int offset = 0;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageListCount() {
		return pageListCount;
	}

	public void setPageListCount(int pageListCount) {
		this.pageListCount = pageListCount;
	}

	public Collection<PageBean> getPageNumList() {
		return pageNumList;
	}

	public void setPageNumList(Collection<PageBean> pageNumList) {
		this.pageNumList = pageNumList;
	}

	public int getPrevious() {
		return previous;
	}

	public void setPrevious(int previous) {
		this.previous = previous;
	}

	public int getPreviousBlock() {
		return previousBlock;
	}

	public void setPreviousBlock(int previousBlock) {
		this.previousBlock = previousBlock;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public void calculate(int count) {

		this.setCount(count);
		int rowCount = this.getRowCount();
		int pageListCount = this.getPageListCount();
		if (((count % rowCount) == 0) && (count != 0)) {
			this.setPageCount(count / rowCount);
		} else {
			this.setPageCount(count / rowCount + 1);
		}
		int pageCount = this.getPageCount();
		int current = this.getCurrent();

		this.setFirst(1);
		this.setLast(pageCount);
		if (current < pageCount) {
			this.setNext(current + 1);
		} else {
			this.setNext(pageCount);
			current = pageCount;
			this.setCurrent(pageCount);
		}
		if (current > 1) {
			this.setPrevious(current - 1);
		} else {
			this.setPrevious(1);
		}
		int start = (this.getCurrent() - 1) * this.getRowCount() + 1;
		int end = 0;
		if (this.getCurrent() == this.getNext()) {
			end = this.getCount();
		} else {
			end = (this.getNext() - 1) * this.getRowCount();
		}
		this.setStart(start);
		if (end == 0) {
			end = 1;
		}
		this.setEnd(end);

		PageBean[] pages;
		ArrayList<PageBean> alist = new ArrayList<PageBean>(pageListCount);
		if (pageCount <= pageListCount) {
			for (int i = 1; i <= pageCount; i++) {
				PageBean pbean = new PageBean();
				pbean.setPageID(String.valueOf(i));
				alist.add(pbean);
			}
		} else {
			if (current == 1) { // 如果用户点的是起始页
				for (int i = 1; i <= pageListCount && i <= pageCount; i++) {
					PageBean pbean = new PageBean();
					pbean.setPageID(String.valueOf(i));
					alist.add(pbean);
				}
			} else {
				if (current == pageCount) { // 如果用户点的最后一页
					int loopForward = pageCount - pageListCount + 1;
					for (int i = loopForward; i <= pageCount; i++) {
						PageBean pbean = new PageBean();
						pbean.setPageID(String.valueOf(i));
						alist.add(pbean);
					}
				} else {
					int loopForward = 0;
					int loopBackward = 0;
					if (pageListCount % 2 == 0) {
						loopForward = pageListCount / 2 - 1;
						loopBackward = pageListCount / 2;
					} else {
						loopForward = pageListCount / 2;
						loopBackward = loopForward;
					}
					int num = current - loopForward;
					for (int i = current; num < current; i++) {
						PageBean pbean = new PageBean();
						num = i - loopForward;
						if (num > 0) {
							pbean.setPageID(String.valueOf(num));
							alist.add(pbean);
						}
					}
					num = current + loopBackward;
					for (int i = current + 1; i <= pageCount && i <= num; i++) {
						PageBean pbean = new PageBean();
						pbean.setPageID(String.valueOf(i));
						alist.add(pbean);
					}
				}
			}
		}
		if (pageCount > pageListCount && alist.size() > 0
		        && alist.size() < pageListCount) {
			String id = ((PageBean) alist.get(0)).getPageID();
			int pageID = Integer.parseInt(id);
			int sub = pageListCount - alist.size();
			int loop = 0;
			if (pageID == 1) {
				loop = alist.size();
				for (int i = loop; i < loop + sub; i++) {
					PageBean pbean = new PageBean();
					int temp = i;
					pbean.setPageID(String.valueOf(++temp));
					alist.add(i, pbean);
				}
			} else {
				int temp = pageID - sub;
				for (int i = 0; i < sub; i++) {
					PageBean pbean = new PageBean();

					pbean.setPageID(String.valueOf(temp++));
					alist.add(i, pbean);
				}
			}
		}
		pages = (PageBean[]) alist.toArray(new PageBean[0]);
		if (pages != null) {
			this.pageNumList.addAll(Arrays.asList(pages));
		}
		this.offset = this.getStart() - 1 >= 0 ? this.getStart() - 1 : 0;
	}

	/**
	 * @return the offset
	 */
	public int getOffset() {
		return offset;
	}

	/**
	 * @param offset
	 * the offset to set
	 */
	public void setOffset(int offset) {
		this.offset = offset;
	}

	public static void main(String[] a) {
		Pages p = new Pages();
		p.calculate(55);
	}
}