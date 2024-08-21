package com.web.spring.vo;

public class Product_table {
	
	private int id;
	private String name;
	private String brand;
	private String price;
	private String img_url;
	private String link;
	public Product_table() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product_table(int id, String name, String brand, String price, String img_url, String link) {
		super();
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.price = price;
		this.img_url = img_url;
		this.link = link;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
}
