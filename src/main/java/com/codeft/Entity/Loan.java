package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;


@Entity
@Table(name = "new_loan")
public class Loan {

	@Id
	String accountnumber;
	String fullname;
	String grosssalary;
	String netsalary;
	String loanamount;
	String roi;
	String tenure;
	String emi;
	String principalamount;
	String intrestamount;
	String insurance;
	String share;
	String guranteer;
	String guranteer2;
	String chequenumber;
	//String document;
	@Lob
	byte[] document;
	//String typeofloan;
	String loanbalance;
	String date;
	String odate;
	String status;
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
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
	public String getGrosssalary() {
		return grosssalary;
	}
	public void setGrosssalary(String grosssalary) {
		this.grosssalary = grosssalary;
	}
	public String getNetsalary() {
		return netsalary;
	}
	public void setNetsalary(String netsalary) {
		this.netsalary = netsalary;
	}
	public String getLoanamount() {
		return loanamount;
	}
	public void setLoanamount(String loanamount) {
		this.loanamount = loanamount;
	}
	public String getRoi() {
		return roi;
	}
	public void setRoi(String roi) {
		this.roi = roi;
	}
	public String getTenure() {
		return tenure;
	}
	public void setTenure(String tenure) {
		this.tenure = tenure;
	}
	public String getEmi() {
		return emi;
	}
	public void setEmi(String emi) {
		this.emi = emi;
	}
	public String getPrincipalamount() {
		return principalamount;
	}
	public void setPrincipalamount(String principalamount) {
		this.principalamount = principalamount;
	}
	public String getIntrestamount() {
		return intrestamount;
	}
	public void setIntrestamount(String intrestamount) {
		this.intrestamount = intrestamount;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getShare() {
		return share;
	}
	public void setShare(String share) {
		this.share = share;
	}
	public String getGuranteer() {
		return guranteer;
	}
	public void setGuranteer(String guranteer) {
		this.guranteer = guranteer;
	}
	public String getGuranteer2() {
		return guranteer2;
	}
	public void setGuranteer2(String guranteer2) {
		this.guranteer2 = guranteer2;
	}
	
	
	
	public byte[] getDocument() {
		return document;
	}
	public void setDocument(byte[] document) {
		this.document = document;
	}
	
	public String getLoanbalance() {
		return loanbalance;
	}
	public void setLoanbalance(String loanbalance) {
		this.loanbalance = loanbalance;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	public String getChequenumber() {
		return chequenumber;
	}
	public void setChequenumber(String chequenumber) {
		this.chequenumber = chequenumber;
	}

	
	
	
	
	
}
