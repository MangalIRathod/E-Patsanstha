package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "emergency_loan")
public class EmergencyLoan {

	@Id
	String accountnumber;
	String fullname;
	String roi;
	String tenure;
	String e_emi;
	String e_principalamount;
	String loanamount;
	String eloanbalance;
	String e_intrestamount;
	String guranteername1;
	String guarnteername2;
	String chequenumber;
	String date;
	String odate;
	String status;

	@Lob
	byte[] document;

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

	public String getChequenumber() {
		return chequenumber;
	}

	public void setChequenumber(String chequenumber) {
		this.chequenumber = chequenumber;
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

	public String getE_emi() {
		return e_emi;
	}

	public void setE_emi(String e_emi) {
		this.e_emi = e_emi;
	}

	public String getE_principalamount() {
		return e_principalamount;
	}

	public void setE_principalamount(String e_principalamount) {
		this.e_principalamount = e_principalamount;
	}

	public String getE_intrestamount() {
		return e_intrestamount;
	}

	public void setE_intrestamount(String e_intrestamount) {
		this.e_intrestamount = e_intrestamount;
	}

	public String getGuranteername1() {
		return guranteername1;
	}

	public void setGuranteername1(String guranteername1) {
		this.guranteername1 = guranteername1;
	}

	public String getGuarnteername2() {
		return guarnteername2;
	}

	public void setGuarnteername2(String guarnteername2) {
		this.guarnteername2 = guarnteername2;
	}

	public String getLoanamount() {
		return loanamount;
	}

	public void setLoanamount(String loanamount) {
		this.loanamount = loanamount;
	}

	public String getEloanbalance() {
		return eloanbalance;
	}

	public void setEloanbalance(String eloanbalance) {
		this.eloanbalance = eloanbalance;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public byte[] getDocument() {
		return document;
	}

	public void setDocument(byte[] document) {
		this.document = document;
	}

}
