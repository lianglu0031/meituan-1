package com.meituan.portal.pojo;

public class CartDishes {
	private long did;
	private String dname;
	private double price;
	private Integer num;
	public long getDid() {
		return did;
	}
	public void setDid(long did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
}
