package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name="monthly_emi_change")
public class Monthly_Emi_Change {
	
	@Id
	String accountnumber;
	String fullname;
	String shares;
	String monthlydeposit;
	String insurance;
	String regularloan;
	String regularloaninterest;
	String emergencyloan;
	String emergencyloaninterest;
	//String rd;
	String date1;
	
	public String getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getShares() {
		return shares;
	}
	public void setShares(String shares) {
		this.shares = shares;
	}
	public String getMonthlydeposit() {
		return monthlydeposit;
	}
	public void setMonthlydeposit(String monthlydeposit) {
		this.monthlydeposit = monthlydeposit;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getRegularloan() {
		return regularloan;
	}
	public void setRegularloan(String regularloan) {
		this.regularloan = regularloan;
	}
	public String getEmergencyloan() {
		return emergencyloan;
	}
	public void setEmergencyloan(String emergencyloan) {
		this.emergencyloan = emergencyloan;
	}
	/*
	public String getRd() {
		return rd;
	}
	public void setRd(String rd) {
		this.rd = rd;
	}
	*/
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getRegularloaninterest() {
		return regularloaninterest;
	}
	public void setRegularloaninterest(String regularloaninterest) {
		this.regularloaninterest = regularloaninterest;
	}
	public String getEmergencyloaninterest() {
		return emergencyloaninterest;
	}
	public void setEmergencyloaninterest(String emergencyloaninterest) {
		this.emergencyloaninterest = emergencyloaninterest;
	}
	
	
	
}
