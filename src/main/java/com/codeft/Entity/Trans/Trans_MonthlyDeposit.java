package com.codeft.Entity.Trans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "trans_monthlydeposit")
public class Trans_MonthlyDeposit {
	
	@Id
	int id;
	String accountnumber;
	String fullname;
	String m_debit;
	String m_deposit;
	String cdate;
	
	
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
