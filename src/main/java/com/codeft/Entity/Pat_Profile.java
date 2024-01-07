package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "add_patsanstha")
public class Pat_Profile {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	
	int patsansthaid;
	 String patname;
	 String registrationnumber;
	 String address;
	 String city;
	 String state;
	 String pincode;
	 String yearofestablishment;
	 String contact;
	 String email;
	 String gst;
	 String pan;
	 String website;
	// String image1;
	 @Lob
	//byte[] image1;
	 
	 
	public int getPatsansthaid() {
		return patsansthaid;
	}
	public void setPatsansthaid(int patsansthaid) {
		this.patsansthaid = patsansthaid;
	}
	public String getPatname() {
		return patname;
	}
	public void setPatname(String patname) {
		this.patname = patname;
	}
	public String getRegistrationnumber() {
		return registrationnumber;
	}
	public void setRegistrationnumber(String registrationnumber) {
		this.registrationnumber = registrationnumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getYearofestablishment() {
		return yearofestablishment;
	}
	public void setYearofestablishment(String yearofestablishment) {
		this.yearofestablishment = yearofestablishment;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGst() {
		return gst;
	}
	public void setGst(String gst) {
		this.gst = gst;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	/*
	public byte[] getImage1() {
		return image1;
	}
	public void setImage1(byte[] image1) {
		this.image1 = image1;
	}
	*/
	 
	 
	 
}
