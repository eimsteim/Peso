package ren.maojiang.peso.common;



import ren.maojiang.peso.util.StringUtil;

import java.util.ArrayList;
import java.util.List;

public class Pagination<T> {
	private int pageIndex = -1;
	private int pageSize = 10;//每页条数
	private int total = 0;
	private int pageCount = 0;
	private int offset = 0;

	private String sort = "id";	//排序字段
	private String order ="asc"; //排序方式


	private List<T> rows = new ArrayList<T>();

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
		//this.offset = this.pageSize * pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
		if (pageIndex < 0) {
			pageIndex = offset/pageSize ;
		}
		this.offset = pageSize * pageIndex;

		this.pageCount = this.total/pageSize+1;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = StringUtil.upperCharToUnderLine(sort);
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
		//this.pageIndex = offset/this.pageSize ;
	}
}
