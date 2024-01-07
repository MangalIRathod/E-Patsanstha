package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table( name = "add_member")
public class Add_Member {
	
	 
	 String fullname;
	@Id
	 String accountnumber;
	 String department;
	 String designation;
	 String dob;
	 String doj;
	 String dor;
	 String mobile;
	 String email;
	 String address;
	 String shares;
	 String monthlydeposit;
	 String insurance;
	 String bankaccount;
	 String bankname;
	 String branchcode;
	 String branchname;
	 String nominee;
	 String nomineerelation;
	 String reg_fee;
	 int gcount;
	 //String image1;
	 //@Lob
	 //	byte[] image1;
	 
	
	
	public int getGcount() {
		return gcount;
	}
	public void setGcount(int gcount) {
		this.gcount = gcount;
	}
	public String getReg_fee() {
		return reg_fee;
	}
	public void setReg_fee(String reg_fee) {
		this.reg_fee = reg_fee;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public String getDor() {
		return dor;
	}
	public void setDor(String dor) {
		this.dor = dor;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getShares() {
		return shares;
	}
	public void setShares(String shares) {
		this.shares = shares;
	}
	public String getMonthlydeposit() {
		return monthlydeposit;
	}
	public void setMonthlydeposit(String monthlydeposit) {
		this.monthlydeposit = monthlydeposit;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	
	public String getBankaccount() {
		return bankaccount;
	}
	public void setBankaccount(String bankaccount) {
		this.bankaccount = bankaccount;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getBranchcode() {
		return branchcode;
	}
	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	public String getNominee() {
		return nominee;
	}
	public void setNominee(String nominee) {
		this.nominee = nominee;
	}
	public String getNomineerelation() {
		return nomineerelation;
	}
	public void setNomineerelation(String nomineerelation) {
		this.nomineerelation = nomineerelation;
	}
	
	
	 
	 
	 

}
