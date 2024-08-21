package com.web.spring.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class Users {
	// users.userid
    private String userid;
	private String name;
	private String pwd;
	private String email;
	private String birthdate;
	private String phone;
	private String address;
	private String address1;
	private String address2;
	private String rating;
	private int point;
	


	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Users(String userid, String name, String pwd, String email, String birthdate, String phone, String address,
			String address1, String address2, String rating, int point) {
		super();
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.birthdate = birthdate;
		this.phone = phone;
		this.address = address;
		this.address1 = address1;
		this.address2 = address2;
		this.rating = rating;
		this.point = point;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getBirthdate() {
		return birthdate;
	}



	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getAddress1() {
		return address1;
	}



	public void setAddress1(String address1) {
		this.address1 = address1;
	}



	public String getAddress2() {
		return address2;
	}



	public void setAddress2(String address2) {
		this.address2 = address2;
	}



	public String getRating() {
		return rating;
	}



	public void setRating(String rating) {
		this.rating = rating;
	}



	public int getPoint() {
		return point;
	}



	public void setPoint(int point) {
		this.point = point;
	}



	public Object getEmailVerificationCode() {
		// TODO Auto-generated method stub
		return null;
	}
    @Override
    public String toString() {
        return "Users{" +
               "userid='" + userid + '\'' +
               ", name='" + name + '\'' +
               ", pwd='" + pwd + '\'' +
               ", email='" + email + '\'' +
               ", birthdate='" + birthdate + '\'' +
               ", phone='" + phone + '\'' +
               ", address='" + address + '\'' +
               ", address1='" + address1 + '\'' +
               ", address2='" + address2 + '\'' +
               ", rating='" + rating + '\'' +
               ", point=" + point +
               '}';
    }

	
}
