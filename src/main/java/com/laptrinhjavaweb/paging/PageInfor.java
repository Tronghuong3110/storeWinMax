package com.laptrinhjavaweb.paging;

public class PageInfor {
	private Integer limit;
	private Integer currentPage;
	private Integer totalItem;
	private Integer totalPage;
	
	public PageInfor(Integer limit, Integer currentPage, Integer totalItem) {
		this.limit = limit;
		this.currentPage = currentPage;
		this.totalItem = totalItem;
		this.totalPage = totalPage();
	}
	
	private Integer totalPage() {
		return ((int)Math.ceil(this.totalItem / this.limit) + 1);
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalItem() {
		return totalItem;
	}

	public void setTotalItem(Integer totalItem) {
		this.totalItem = totalItem;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
