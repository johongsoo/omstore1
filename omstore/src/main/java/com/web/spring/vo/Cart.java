package com.web.spring.vo;

import java.math.BigDecimal;

public class Cart {
    private int cartid;
    private String userid;
    private String product_img;
    private String product_name;
    private BigDecimal product_price;
    private int quantity;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int cartid, String userid, String product_img, String product_name, BigDecimal product_price,
			int quantity) {
		super();
		this.cartid = cartid;
		this.userid = userid;
		this.product_img = product_img;
		this.product_name = product_name;
		this.product_price = product_price;
		this.quantity = quantity;
	}
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public BigDecimal getProduct_price() {
		return product_price;
	}
	public void setProduct_price(BigDecimal product_price) {
		this.product_price = product_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
