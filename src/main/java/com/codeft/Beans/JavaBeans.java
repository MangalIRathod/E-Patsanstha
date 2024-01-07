package com.codeft.Beans;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import com.codeft.Entity.Cancel_Member;
import com.codeft.Entity.Dead_Member;
import com.codeft.Entity.Deduction_Compare;
import com.codeft.Entity.Emergency_Loan_Close;
import com.codeft.Entity.FixedDeposite;
import com.codeft.Entity.Loan_Closed;
import com.codeft.Entity.Trans.EmeregencyLoanTrans;
import com.codeft.Entity.Trans.Loan_Trans;
import com.codeft.Entity.RecurringDeposit;
import com.codeft.Entity.RecurringDepositeNew;
import com.codeft.Entity.Third_Party_Payment;
import com.codeft.Entity.UserAnnualReport;
import com.codeft.Entity.Trans.Trans_Share;
import com.codeft.Entity.Trans.TransInsurance;
import com.codeft.Entity.Trans.Trans_MonthlyDeposit;


public class JavaBeans {
	
	//public Vector<String> EMIList;

	public String EMIList;
	
	public String details;
	
	private List<RecurringDeposit> recurring_depo;
	
	private List<FixedDeposite> fixed_depo;
	
	public String cmonth;
	
	private List<Deduction_Compare> deduction_compare;
	
	private List<Trans_Share> share_details;
	
	private List<FixedDeposite> fd_details;
	
	private List<RecurringDeposit> rd_details;
	
	private List<TransInsurance> insurance_details;
	
	private List<Trans_MonthlyDeposit> monthly_deposit_details;
	
	private List<Cancel_Member> cancel_member_details;
	
	private List<Dead_Member> dead_member_details;
	
	private List<Loan_Trans> new_loan_details;
	
	private List<Loan_Closed> new_loan_close_details;
	
	private List<Emergency_Loan_Close> emergency_loan_close_details;
	
	private List<EmeregencyLoanTrans> emergency_loan_details;
	
	private List<RecurringDepositeNew> new_recurring_deposit_details;
	
	public String share_date;
	
	public String fd_date;
	
	public String rd_date;
	
	public String insurance_date;
	
	public String monthly_deposit_date;
	
	public String new_loan_date;
	
	public String emergency_loan_date;
	
	public String cancel_member_date;
	
	public String dead_member_date;
	
	public String ar_sdate;
	
	public String ar_edate;
	
	public String balansheet_date;
	
	public String user_acc_no;
	
	public String user_password;
	
	public static Vector<LinkedHashMap<String, String>> TerijPatrakData;

	private List<Third_Party_Payment> daily_report_print_details;

	public String daily_report_date;
	
	public static List<UserAnnualReport> UseranReprt;

	public static List<UserAnnualReport> getUseranReprt() {
		return UseranReprt;
	}

	public static void setUseranReprt(List<UserAnnualReport> useranReprt) {
		UseranReprt = useranReprt;
	}

	public String getDaily_report_date() {
	return daily_report_date;
	}

	public void setDaily_report_date(String daily_report_date) {
	this.daily_report_date = daily_report_date;
	}

	public List<Third_Party_Payment> getDaily_report_print_details() {
	return daily_report_print_details;
	}

	public void setDaily_report_print_details(List<Third_Party_Payment> daily_report_print_details) {
	this.daily_report_print_details = daily_report_print_details;
	}

	public static Vector<LinkedHashMap<String, String>> getTerijPatrakData() {
		return TerijPatrakData;
	}

	public static void setTerijPatrakData(Vector<LinkedHashMap<String, String>> terijPatrakData) {
		TerijPatrakData = terijPatrakData;
	}

	public static HashMap<String, Set<String>> FailExecuteAccountNumber = new HashMap<String, Set<String>>() {{
		   put("virendra", new HashSet<>(Arrays.asList("Start", "initialization")));
		 
		}};

		 public static HashMap<String, Set<String>> getFailExecuteAccountNumber() {
		return FailExecuteAccountNumber;
		}

		public static void setFailExecuteAccountNumber(HashMap<String, Set<String>> failExecuteAccountNumber) {
		FailExecuteAccountNumber = failExecuteAccountNumber;
		}

	
	public String getUser_acc_no() {
		return user_acc_no;
	}

	public void setUser_acc_no(String user_acc_no) {
		this.user_acc_no = user_acc_no;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public List<Cancel_Member> getCancel_member_details() {
		return cancel_member_details;
	}

	public void setCancel_member_details(List<Cancel_Member> cancel_member_details) {
		this.cancel_member_details = cancel_member_details;
	}

	public List<Dead_Member> getDead_member_details() {
		return dead_member_details;
	}

	public void setDead_member_details(List<Dead_Member> dead_member_details) {
		this.dead_member_details = dead_member_details;
	}

	public String getCancel_member_date() {
		return cancel_member_date;
	}

	public void setCancel_member_date(String cancel_member_date) {
		this.cancel_member_date = cancel_member_date;
	}

	public String getDead_member_date() {
		return dead_member_date;
	}

	public void setDead_member_date(String dead_member_date) {
		this.dead_member_date = dead_member_date;
	}

	public List<Emergency_Loan_Close> getEmergency_loan_close_details() {
		return emergency_loan_close_details;
	}

	public void setEmergency_loan_close_details(List<Emergency_Loan_Close> emergency_loan_close_details) {
		this.emergency_loan_close_details = emergency_loan_close_details;
	}

	public List<Loan_Closed> getNew_loan_close_details() {
		return new_loan_close_details;
	}

	public void setNew_loan_close_details(List<Loan_Closed> new_loan_close_details) {
		this.new_loan_close_details = new_loan_close_details;
	}

	
	
	

	public List<RecurringDepositeNew> getNew_recurring_deposit_details() {
		return new_recurring_deposit_details;
	}

	public void setNew_recurring_deposit_details(List<RecurringDepositeNew> new_recurring_deposit_details) {
		this.new_recurring_deposit_details = new_recurring_deposit_details;
	}

	

	public String getBalansheet_date() {
		return balansheet_date;
	}

	public void setBalansheet_date(String balansheet_date) {
		this.balansheet_date = balansheet_date;
	}

	public String getAr_sdate() {
		return ar_sdate;
	}

	public void setAr_sdate(String ar_sdate) {
		this.ar_sdate = ar_sdate;
	}

	public String getAr_edate() {
		return ar_edate;
	}

	public void setAr_edate(String ar_edate) {
		this.ar_edate = ar_edate;
	}

	public String getShare_date() {
		return share_date;
	}

	public void setShare_date(String share_date) {
		this.share_date = share_date;
	}

	public String getFd_date() {
		return fd_date;
	}

	public void setFd_date(String fd_date) {
		this.fd_date = fd_date;
	}

	public String getRd_date() {
		return rd_date;
	}

	public void setRd_date(String rd_date) {
		this.rd_date = rd_date;
	}

	public String getInsurance_date() {
		return insurance_date;
	}

	public void setInsurance_date(String insurance_date) {
		this.insurance_date = insurance_date;
	}

	public String getMonthly_deposit_date() {
		return monthly_deposit_date;
	}

	public void setMonthly_deposit_date(String monthly_deposit_date) {
		this.monthly_deposit_date = monthly_deposit_date;
	}

	public String getNew_loan_date() {
		return new_loan_date;
	}

	public void setNew_loan_date(String new_loan_date) {
		this.new_loan_date = new_loan_date;
	}

	public String getEmergency_loan_date() {
		return emergency_loan_date;
	}

	public void setEmergency_loan_date(String emergency_loan_date) {
		this.emergency_loan_date = emergency_loan_date;
	}

	public List<EmeregencyLoanTrans> getEmergency_loan_details() {
		return emergency_loan_details;
	}

	public void setEmergency_loan_details(List<EmeregencyLoanTrans> emergency_loan_details) {
		this.emergency_loan_details = emergency_loan_details;
	}

	public List<Loan_Trans> getNew_loan_details() {
		return new_loan_details;
	}

	public void setNew_loan_details(List<Loan_Trans> new_loan_details) {
		this.new_loan_details = new_loan_details;
	}

	public List<FixedDeposite> getFd_details() {
		return fd_details;
	}

	public void setFd_details(List<FixedDeposite> fd_details) {
		this.fd_details = fd_details;
	}

	public List<RecurringDeposit> getRd_details() {
		return rd_details;
	}

	public void setRd_details(List<RecurringDeposit> rd_details) {
		this.rd_details = rd_details;
	}

	public List<Trans_MonthlyDeposit> getMonthly_deposit_details() {
		return monthly_deposit_details;
	}

	public void setMonthly_deposit_details(List<Trans_MonthlyDeposit> monthly_deposit_details) {
		this.monthly_deposit_details = monthly_deposit_details;
	}

	public List<Trans_Share> getShare_details() {
		return share_details;
	}

	public void setShare_details(List<Trans_Share> share_details) {
		this.share_details = share_details;
	}

	public List<TransInsurance> getInsurance_details() {
		return insurance_details;
	}

	public void setInsurance_details(List<TransInsurance> insurance_details) {
		this.insurance_details = insurance_details;
	}

	public List<Deduction_Compare> getDeduction_compare() {
		return deduction_compare;
	}

	public void setDeduction_compare(List<Deduction_Compare> deduction_compare) {
		this.deduction_compare = deduction_compare;
	}

	public String getCmonth() {
		return cmonth;
	}

	public void setCmonth(String cmonth) {
		this.cmonth = cmonth;
	}

	public List<FixedDeposite> getFixed_depo() {
		return fixed_depo;
	}

	public void setFixed_depo(List<FixedDeposite> fixed_depo) {
		this.fixed_depo = fixed_depo;
	}

	public List<RecurringDeposit> getRecurring_depo() {
		return recurring_depo;
	}

	public void setRecurring_depo(List<RecurringDeposit> recurring_depo) {
		this.recurring_depo = recurring_depo;
	}

	public String getEMIList() {
		return EMIList;
	}

	public void setEMIList(String eMIList) {
		EMIList = eMIList;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}
	
	
}
