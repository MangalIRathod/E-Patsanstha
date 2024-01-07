package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "rd")
public class RecurringDeposit {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String accountnumber;
	String fullname;
	double rdamount;
	String rddate;
	//String maturingdate;
	String totalamount;
	//String chequenumber;
	//String receiptnumber;
	String status;
	//String rd_no;

	//@Transient
	//double RDAmountTillDate;

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
	public double getRdamount() {
		return rdamount;
	}
	public void setRdamount(double rdamount) {
		this.rdamount = rdamount;
	}	
	public String getRddate() {
		return rddate;
	}
	public void setRddate(String rddate) {
		this.rddate = rddate;
	}
	
	public String getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(String totalamount) {
		this.totalamount = totalamount;
	}	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}



}
