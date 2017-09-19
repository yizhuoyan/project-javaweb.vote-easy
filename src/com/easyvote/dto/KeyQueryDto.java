/**
 * 
 */
package com.easyvote.dto;

/**
 * @author ben
 *
 */
public class KeyQueryDto {
	
	/**
	 * 查询关键字
	 */
	protected String key;
	
	protected Integer pageNo;
	
	protected Integer pageSize;
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
