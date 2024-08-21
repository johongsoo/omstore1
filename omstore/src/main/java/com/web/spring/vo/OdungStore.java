package com.web.spring.vo;

import java.util.Date;




public class OdungStore {

	private int productsid;
	private String name;
	private String price;
	private String category;
	private String status;
	private int inventory;
	private Date registration;
	private Date correction;
	private String image;
	private int views;
	public OdungStore() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OdungStore(int productsid, String name, String price, String category, String status, int inventory,
			Date registration, Date correction, String image, int views) {
		super();
		this.productsid = productsid;
		this.name = name;
		this.price = price;
		this.category = category;
		this.status = status;
		this.inventory = inventory;
		this.registration = registration;
		this.correction = correction;
		this.image = image;
		this.views = views;
	}
	public int getProductsid() {
		return productsid;
	}
	public void setProductsid(int productsid) {
		this.productsid = productsid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public Date getRegistration() {
		return registration;
	}
	public void setRegistration(Date registration) {
		this.registration = registration;
	}
	public Date getCorrection() {
		return correction;
	}
	public void setCorrection(Date correction) {
		this.correction = correction;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}

	

}
