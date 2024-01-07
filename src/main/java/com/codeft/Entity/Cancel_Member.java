package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cancel_membership")
public class Cancel_Member {

	@Id
	String accountnumber;
	String fullname;
	String date;
	String reason;
	String shares;
	String fd;
	String insurance;
	String percentamount;
	String rd;
	String totalregularloan;
	String intrestregularloan;
	String totalemerloan;
	String intrestonemerloan;
	String monthlydeposit;
	String totalamount;
	String payableamount;
	String cheque;
	String chequedate;
	String payaccountname;
	
	
	public String getPayableamount() {
		return payableamount;
	}
	public void setPayableamount(String payableamount) {
		this.payableamount = payableamount;
	}
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getShares() {
		return shares;
	}
	public void setShares(String shares) {
		this.shares = shares;
	}
	public String getFd() {
		return fd;
	}
	public void setFd(String fd) {
		this.fd = fd;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getPercentamount() {
		return percentamount;
	}
	public void setPercentamount(String percentamount) {
		this.percentamount = percentamount;
	}
	public String getRd() {
		return rd;
	}
	public void setRd(String rd) {
		this.rd = rd;
	}
	public String getTotalregularloan() {
		return totalregularloan;
	}
	public void setTotalregularloan(String totalregularloan) {
		this.totalregularloan = totalregularloan;
	}
	public String getIntrestregularloan() {
		return intrestregularloan;
	}
	public void setIntrestregularloan(String intrestregularloan) {
		this.intrestregularloan = intrestregularloan;
	}
	public String getTotalemerloan() {
		return totalemerloan;
	}
	public void setTotalemerloan(String totalemerloan) {
		this.totalemerloan = totalemerloan;
	}
	public String getIntrestonemerloan() {
		return intrestonemerloan;
	}
	public void setIntrestonemerloan(String intrestonemerloan) {
		this.intrestonemerloan = intrestonemerloan;
	}
	public String getMonthlydeposit() {
		return monthlydeposit;
	}
	public void setMonthlydeposit(String monthlydeposit) {
		this.monthlydeposit = monthlydeposit;
	}
	public String getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(String totalamount) {
		this.totalamount = totalamount;
	}
	public String getCheque() {
		return cheque;
	}
	public void setCheque(String cheque) {
		this.cheque = cheque;
	}
	public String getChequedate() {
		return chequedate;
	}
	public void setChequedate(String chequedate) {
		this.chequedate = chequedate;
	}
	public String getPayaccountname() {
		return payaccountname;
	}
	public void setPayaccountname(String payaccountname) {
		this.payaccountname = payaccountname;
	}
	
	
	
	
}
