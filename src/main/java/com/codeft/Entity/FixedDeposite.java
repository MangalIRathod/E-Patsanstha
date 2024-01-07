package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "fixeddeposite")
public class FixedDeposite {
	
	
	@Id
	int id;	
	String accountnumber;
	String fdcertificatenumber;
	String fullname;
	String fdamount;
	String fddate;
	String maturingdate;
	String roi;
	String totalamount;

@Transient
double FDAmountTillDate;

public double getFDAmountTillDate() {
return FDAmountTillDate;
}
public void setFDAmountTillDate(double fDAmountTillDate) {
FDAmountTillDate = fDAmountTillDate;
}
	
	//String document;
	@Lob
	byte[] document;	
	String chequenumber;
	String receiptnumber;
	String status;
	String fdinterest;
	String remainingamount;
	
	
	
	public String getFdinterest() {
		return fdinterest;
	}
	public void setFdinterest(String fdinterest) {
		this.fdinterest = fdinterest;
	}
	public String getRemainingamount() {
		return remainingamount;
	}
	public void setRemainingamount(String remainingamount) {
		this.remainingamount = remainingamount;
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
	public String getFdcertificatenumber() {
		return fdcertificatenumber;
	}
	public void setFdcertificatenumber(String fdcertificatenumber) {
		this.fdcertificatenumber = fdcertificatenumber;
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
	public String getFddate() {
		return fddate;
	}
	public void setFddate(String fddate) {
		this.fddate = fddate;
	}
	public String getMaturingdate() {
		return maturingdate;
	}
	public void setMaturingdate(String maturingdate) {
		this.maturingdate = maturingdate;
	}
	public String getRoi() {
		return roi;
	}
	public void setRoi(String roi) {
		this.roi = roi;
	}
	public String getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(String totalamount) {
		this.totalamount = totalamount;
	}
	public byte[] getDocument() {
		return document;
	}
	public void setDocument(byte[] document) {
		this.document = document;
	}
	
}
