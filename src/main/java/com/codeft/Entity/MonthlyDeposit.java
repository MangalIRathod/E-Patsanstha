package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "monthlydeposit")

public class MonthlyDeposit {

	@Id
	String accountnumber;
	String fullname;
	String m_debit;
	String m_deposit;
	String cdate;
	
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
	public String getM_debit() {
		return m_debit;
	}
	public void setM_debit(String m_debit) {
		this.m_debit = m_debit;
	}
	
	public String getM_deposit() {
		return m_deposit;
	}
	public void setM_deposit(String m_deposit) {
		this.m_deposit = m_deposit;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
		
	
}
