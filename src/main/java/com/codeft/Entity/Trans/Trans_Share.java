package com.codeft.Entity.Trans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "trans_share")
public class Trans_Share {

	@Id
	int id;
	String accountnumber;
	String fullname;
	String shareallot;
	String date;
	String totalamountofshare;
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
	
	public String getTotalamountofshare() {
		return totalamountofshare;
	}
	public void setTotalamountofshare(String totalamountofshare) {
		this.totalamountofshare = totalamountofshare;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
