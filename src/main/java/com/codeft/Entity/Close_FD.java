package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="closed_fd")
public class Close_FD {

	@Id
	int id;
	String accountnumber;
	String fullname;
	String fdamount;
	String fdstartdate;
	String fdmaturedate;
	String fdclosedate;
	String interestamount;	
	String fdtillamount;
	String chequenumber;
	String receiptnumber;
	
	
	
	
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
	public String getFdamount() {
		return fdamount;
	}
	public void setFdamount(String fdamount) {
		this.fdamount = fdamount;
	}
	public String getFdstartdate() {
		return fdstartdate;
	}
	public void setFdstartdate(String fdstartdate) {
		this.fdstartdate = fdstartdate;
	}
	public String getFdmaturedate() {
		return fdmaturedate;
	}
	public void setFdmaturedate(String fdmaturedate) {
		this.fdmaturedate = fdmaturedate;
	}
	public String getFdclosedate() {
		return fdclosedate;
	}
	public void setFdclosedate(String fdclosedate) {
		this.fdclosedate = fdclosedate;
	}
	public String getInterestamount() {
		return interestamount;
	}
	public void setInterestamount(String interestamount) {
		this.interestamount = interestamount;
	}
	public String getFdtillamount() {
		return fdtillamount;
	}
	public void setFdtillamount(String fdtillamount) {
		this.fdtillamount = fdtillamount;
	}
	
	
	
	
}
