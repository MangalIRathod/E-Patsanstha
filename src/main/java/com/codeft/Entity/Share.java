package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "share")
public class Share {

	@Id
	String accountnumber;
	String fullname;
	String shareallot;
	String date;
	String totalamountofsahre;
	
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
	public String getShareallot() {
		return shareallot;
	}
	public void setShareallot(String shareallot) {
		this.shareallot = shareallot;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTotalamountofsahre() {
		return totalamountofsahre;
	}
	public void setTotalamountofsahre(String totalamountofsahre) {
		this.totalamountofsahre = totalamountofsahre;
	}
	
}
