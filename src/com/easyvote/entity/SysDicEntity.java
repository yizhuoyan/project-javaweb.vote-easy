package com.easyvote.entity;

import java.util.Arrays;

public class SysDicEntity {
	protected String id;
	protected String dicName;
	protected String itemName;
	protected String[] itemValue;
	protected int itemOrder;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDicName() {
		return dicName;
	}
	public void setDicName(String dicName) {
		this.dicName = dicName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String[] getItemValue() {
		if(itemValue==null) {
			itemValue=new String[2];
		}
		return itemValue;
	}
	public String getItemValue(int i) {
		String[] values=this.itemValue;
		if(i<values.length) {
			return values[i];
		}
		return null;
	}
	public void setItemValue(String[] itemValue) {
		this.itemValue = itemValue;
	}
	public int getItemOrder() {
		return itemOrder;
	}
	public void setItemOrder(int itemOrder) {
		this.itemOrder = itemOrder;
	}
	@Override
	public String toString() {
		return "SysDicEntity [id=" + id + ", dicName=" + dicName + ", itemName=" + itemName + ", itemValue="
				+ Arrays.toString(itemValue) + ", itemOrder=" + itemOrder + "]";
	}
	
}
