package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "insuranceform")
public class Insurance {

	@Id
	String accountnumber;
	String fullname;
	String date;
	String insdebt;	
	String totalinsuranceamount;
	
	
	
	public String getInsdebt() {
		return insdebt;
	}
	public void setInsdebt(String insdebt) {
		this.insdebt = insdebt;
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
	public String getTotalinsuranceamount() {
		return totalinsuranceamount;
	}
	public void setTotalinsuranceamount(String totalinsuranceamount) {
		this.totalinsuranceamount = totalinsuranceamount;
	}
	
}
