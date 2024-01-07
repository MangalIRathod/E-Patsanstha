package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "new_rd")
public class RecurringDepositeNew {
	@Id
	int id;
	String accno;
	String name;
	String rdamt;
	String roi;
	String startdate;
	String enddate;
	String totamt;
	String cheque_no;
	String status;
	String prevbalance;
	String receiptnumber;
	String rd_no;
	String total_rd_amt;
	
	@Lob
	byte[] rddata;
	
	
	public byte[] getRddata() {
		return rddata;
	}
	public void setRddata(byte[] rddata) {
		this.rddata = rddata;
	}
	public String getRd_no() {
		return rd_no;
	}
	public void setRd_no(String rd_no) {
		this.rd_no = rd_no;
	}
	public String getTotal_rd_amt() {
		return total_rd_amt;
	}
	public void setTotal_rd_amt(String total_rd_amt) {
		this.total_rd_amt = total_rd_amt;
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
	public String getAccno() {
		return accno;
	}
	public void setAccno(String accno) {
		this.accno = accno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRdamt() {
		return rdamt;
	}
	public void setRdamt(String rdamt) {
		this.rdamt = rdamt;
	}
	public String getRoi() {
		return roi;
	}
	public void setRoi(String roi) {
		this.roi = roi;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getTotamt() {
		return totamt;
	}
	public void setTotamt(String totamt) {
		this.totamt = totamt;
	}
	public String getCheque_no() {
		return cheque_no;
	}
	public void setCheque_no(String cheque_no) {
		this.cheque_no = cheque_no;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPrevbalance() {
		return prevbalance;
	}
	public void setPrevbalance(String prevbalance) {
		this.prevbalance = prevbalance;
	}
	
	

}
