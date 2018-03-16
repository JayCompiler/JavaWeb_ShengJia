package com.shengjia.commons;

import java.util.ArrayList;

public class Page {
	@SuppressWarnings("rawtypes")
	private ArrayList record;// 存放分页记录
	private int currentPage;// 当前页码
	private int totalPage;// 总页数
	private int pageSize;// 每页记录的条数
	private int totalRecords;// 总记录数
	private int startIndex;// 每页记录开始的索引
	private int prePageNum;// 上一页
	private int nextPageNum;// 下一页

	public Page(int currentPage, int totalRecords, int pageSize) {
		this.currentPage = currentPage;
		this.totalRecords = totalRecords;
		// 计算总页数
		this.totalPage = totalRecords % pageSize == 0 ? totalRecords / pageSize : totalRecords / pageSize + 1;
		// 计算每页开始的索引
		this.startIndex = (currentPage - 1) * pageSize;
		this.pageSize = pageSize;
	}

	@SuppressWarnings("rawtypes")
	public ArrayList getRecord() {
		return record;
	}

	@SuppressWarnings("rawtypes")
	public void setRecord(ArrayList record) {
		this.record = record;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPrePageNum() {
		prePageNum = currentPage - 1;
		if (prePageNum < 1) {
			prePageNum = 1;
		}
		return prePageNum;
	}

	public void setPrePageNum(int prePageNum) {
		this.prePageNum = prePageNum;
	}

	public int getNextPageNum() {
		nextPageNum = currentPage + 1;
		if (nextPageNum > totalPage) {
			nextPageNum = totalPage;
		}
		return nextPageNum;
	}

	public void setNextPageNum(int nextPageNum) {
		this.nextPageNum = nextPageNum;
	}
}
