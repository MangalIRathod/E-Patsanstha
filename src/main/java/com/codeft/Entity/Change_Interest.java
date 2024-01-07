package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "change_interest")
public class Change_Interest {
	
	@Id
	int id;
	String interesttype;
	String roi;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInteresttype() {
		return interesttype;
	}
	public void setInteresttype(String interesttype) {
		this.interesttype = interesttype;
	}
	public String getRoi() {
		return roi;
	}
	public void setRoi(String roi) {
		this.roi = roi;
	}
	
	

}
