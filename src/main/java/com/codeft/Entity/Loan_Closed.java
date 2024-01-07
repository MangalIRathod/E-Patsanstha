package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table( name = "closed_loan")
public class Loan_Closed {

	@Id
	String accountnumber;
	String fullname;
	String date;
	String balanceloan;
	String intrestamount;
	String remtenure;
	String chequenumber;
	String recieptnumber;
	String paidamount;
	@Lob
	byte[] document;
	
	
	
	public byte[] getDocument() {
		return document;
	}
	public void setDocument(byte[] document) {
		this.document = document;
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
	public String getBalanceloan() {
		return balanceloan;
	}
	public void setBalanceloan(String balanceloan) {
		this.balanceloan = balanceloan;
	}
	public String getIntrestamount() {
		return intrestamount;
	}
	public void setIntrestamount(String intrestamount) {
		this.intrestamount = intrestamount;
	}
	public String getRemtenure() {
		return remtenure;
	}
	public void setRemtenure(String remtenure) {
		this.remtenure = remtenure;
	}
	
	public String getChequenumber() {
		return chequenumber;
	}
	public void setChequenumber(String chequenumber) {
		this.chequenumber = chequenumber;
	}
	public String getRecieptnumber() {
		return recieptnumber;
	}
	public void setRecieptnumber(String recieptnumber) {
		this.recieptnumber = recieptnumber;
	}
	public String getPaidamount() {
		return paidamount;
	}
	public void setPaidamount(String paidamount) {
		this.paidamount = paidamount;
	}
	
	
	
}
