package com.codeft.Entity.Trans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "trans_insurance")
public class TransInsurance {

	@Id
	int id;
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
	public String getInsdebt() {
		return insdebt;
	}
	public void setInsdebt(String insdebt) {
		this.insdebt = insdebt;
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
	String accountnumber;
	String fullname;
	String insdebt;
	String date;
	String totalinsuranceamount;
	
	
	
}
