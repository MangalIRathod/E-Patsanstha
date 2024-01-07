package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dividend_interest")
public class Dividend_Interest {

	@Id
	int id;
	String share_interest;
	String monthly_deposit_interest;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getShare_interest() {
		return share_interest;
	}
	public void setShare_interest(String share_interest) {
		this.share_interest = share_interest;
	}
	public String getMonthly_deposit_interest() {
		return monthly_deposit_interest;
	}
	public void setMonthly_deposit_interest(String monthly_deposit_interest) {
		this.monthly_deposit_interest = monthly_deposit_interest;
	}
	
	
	
}
