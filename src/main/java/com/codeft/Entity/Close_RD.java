package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name = "closed_rd")
public class Close_RD {

	@Id
	int id;
	String accountnumber;
	String fullname;
	String rdamount;
	String startdate;
	String enddate;
	String totamt;	
	String roi;
	String chequenumber;
	String receiptnumber;
	String status;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getRdamount() {
		return rdamount;
	}
	public void setRdamount(String rdamount) {
		this.rdamount = rdamount;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getTotamt() {
		return totamt;
	}
	public void setTotamt(String totamt) {
		this.totamt = totamt;
	}
	public String getRoi() {
		return roi;
	}
	public void setRoi(String roi) {
		this.roi = roi;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
