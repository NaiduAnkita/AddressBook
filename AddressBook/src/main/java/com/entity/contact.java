package com.entity;

import java.time.LocalDate;

public class contact {
     private int id;
     private String name;
     private String email;
     private String phno;
     private String relation;
     private int userId;
     private LocalDate dob;
     private String addtype;
     private String street;
     private String city;
     private String state;
     private String pin;
     private boolean fav;
	public contact() {
		super();
	}
	public contact(String name, String email, String phno, String relation, int userId, LocalDate dob, String addtype,
			String street, String city, String state, String pin, boolean fav) {
		super();
		this.name = name;
		this.email = email;
		this.phno = phno;
		this.relation = relation;
		this.userId = userId;
		this.dob = dob;
		this.addtype = addtype;
		this.street = street;
		this.city = city;
		this.state = state;
		this.pin = pin;
		this.fav=fav;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public LocalDate getDob() {
		return dob;
	}
	public void setDob(LocalDate dob) {
		this.dob = dob;
	}
	public String getAddtype() {
		return addtype;
	}
	public void setAddtype(String addtype) {
		this.addtype = addtype;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public boolean getFav() {
		return fav;
	}
	public void setFav(boolean fav) {
		this.fav=fav;
	}
}

