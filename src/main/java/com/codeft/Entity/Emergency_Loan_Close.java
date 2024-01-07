package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name="emergency_closed_loan")
public class Emergency_Loan_Close {
	
	@Id
	String accountnumber;
	String fullname;
	String date1;
	String balanceloan;
	String interestamount;
	String remainingtenure;
	String chequenumber;
	String receiptnumber;
	String paidamount;
	
	
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
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getBalanceloan() {
		return balanceloan;
	}
	public void setBalanceloan(String balanceloan) {
		this.balanceloan = balanceloan;
	}
	public String getInterestamount() {
		return interestamount;
	}
	public void setInterestamount(String interestamount) {
		this.interestamount = interestamount;
	}
	public String getRemainingtenure() {
		return remainingtenure;
	}
	public void setRemainingtenure(String remainingtenure) {
		this.remainingtenure = remainingtenure;
	}
	
	public String getChequenumber() {
		return chequenumber;
	}
	public void setChequenumber(String chequenumber) {
		this.chequenumber = chequenumber;
	}
	public String getReceiptnumber() {
		return receiptnumber;
	}
	public void setReceiptnumber(String receiptnumber) {
		this.receiptnumber = receiptnumber;
	}
	public String getPaidamount() {
		return paidamount;
	}
	public void setPaidamount(String paidamount) {
		this.paidamount = paidamount;
	}
	

}
