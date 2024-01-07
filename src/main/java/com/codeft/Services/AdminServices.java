package com.codeft.Services;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.codeft.Entity.Add_Member;
import com.codeft.Entity.Cancel_Member;
import com.codeft.Entity.Change_Interest;
import com.codeft.Entity.Close_FD;
import com.codeft.Entity.Close_RD;
import com.codeft.Entity.Dead_Member;
import com.codeft.Entity.Deduction;
import com.codeft.Entity.Deduction_Compare;
import com.codeft.Entity.Dividend;
import com.codeft.Entity.Dividend_Interest;
import com.codeft.Entity.EmergencyLoan;
import com.codeft.Entity.Emergency_Loan_Close;
import com.codeft.Entity.Emergency_Loan_Credit;
import com.codeft.Entity.FixedDeposite;
import com.codeft.Entity.Head;
import com.codeft.Entity.Insurance;
import com.codeft.Entity.Loan;
import com.codeft.Entity.Loan_Amount_Credit;
import com.codeft.Entity.Loan_Closed;
import com.codeft.Entity.Trans.EmeregencyLoanTrans;
import com.codeft.Entity.Trans.Loan_Trans;
import com.codeft.Entity.MonthlyDeposit;
import com.codeft.Entity.Monthly_Emi_Change;
import com.codeft.Entity.Notification;
import com.codeft.Entity.Pat_Profile;
import com.codeft.Entity.RecurringDeposit;
import com.codeft.Entity.RecurringDepositeNew;
import com.codeft.Entity.Share;
import com.codeft.Entity.Third_Party_Payment;
import com.codeft.Entity.UserAnnualReport;
import com.codeft.Entity.Trans.Trans_Share;
import com.codeft.Entity.UserSign;
import com.codeft.Entity.Trans.TransInsurance;
import com.codeft.Entity.Trans.Trans_MonthlyDeposit;

public interface AdminServices {
   
   Add_Member GetUserName(String AccountNumber);
	
   String SaveInsuranceOfUser(Insurance ins);
	
   String SaveShare(Share share);
   
   String SaveMonthlyDeposit(MonthlyDeposit monthly_deposit);
	
   String SaveHeadName(Head head);
   
   String SaveRDInfo(RecurringDeposit RD);
   
   List<RecurringDeposit> GetAllRDInformation();
   
   RecurringDepositeNew GetRDDocument(String AccountNumber);
   
   List<Head> GetAllHeadName();
   
   List<Close_RD> GetAllCloseRd();
   
   String SaveThirdPartyDetails(Third_Party_Payment tpp);
   
   String SaveNotificationDetails(Notification ntf);
   
   List<Third_Party_Payment> GetAllThirdPartyDetails();
   
   String DeleteThirdPartyPayment(int id);
   
   String DeleteRegularLoan(String accountnumber);
   
   String DeleteRegularLoanTrans(int id);
   
   String DeleteFD(int id);
   
   String DeleteRD(int id);
   
   String DeleteEmergencyLoan(String accountnumber);
   
   String DeleteEmergencyLoanTrans(int id);
   
   String DeleteNotification(int id);
   
   String DeleteAccountHead(int id);  
////////////////////////// Dashboard /////////////////////////////////////   
   double GetTotalRDInformation();
   
   double GetTotalFDInformation();
   
   double GetTotalMonthlyDepositInformation();
   
   double GetTotalInsuranceInformation();
   
   double GetTotalShareInformation();
   
   double GetTotalRegularLoanInformation();
   
   double GetTotalRemainingRegularLoanInformation();
   
   double GetTotalEmergencyLoanInformation();
   
   double GetTotalRemainingEmergencyLoanInformation();
   
   int GetTotalClosedAccountInformation();
   
   int GetTotalCanceledAccountInformation();
////////////////////////// Dashboard ///////////////////////////////////// 
   
   String save_patsanstha_profile(Pat_Profile pat_profile);
   
   String save_member(Add_Member add_member);
   
   String save_new_loan(Loan new_loan);
   
   String save_trans_loan(Loan_Trans trans_loan);
   
   String save_loan_amount_credit(Loan_Amount_Credit loan_amount_credit);
   
   String UpdateNewLoanDetails(String accountnumber, String loanamount);
   
   String UpdateEmergencyLoanDetails(String accountnumber, String loanamount);
   
   String save_loan_closed(Loan_Closed loan_closed);
   
   String save_emergency_loan(EmergencyLoan emergency_loan);
   
   String save_emergency_loan_credit(Emergency_Loan_Credit emergency_loan_credit);
   
   String save_emergency_loan_close(Emergency_Loan_Close emergency_loan_close);
   
   String save_monthly_emi_change(Monthly_Emi_Change monthly_emi_change);
   
   String save_fd(FixedDeposite fd_save);
   
   //String save_close_fd(Close_FD fd_close);
   
   String save_close_fd(FixedDeposite fd_close);
   
   String save_close_rd(Close_RD rd_close);
   
   String save_close_rd(RecurringDepositeNew rd_close);
   
   String save_new_rd(RecurringDepositeNew rd_new_save);
   
   List<Close_RD> GetAllCloseRDInformation();
   
   List<Close_FD> GetAllCloseFDInformation();
   
   List<FixedDeposite> GetAllFDInformation();
   
   List<RecurringDepositeNew> GetAllNewRDInformation();
   
   FixedDeposite GetFDDocument(String AccountNumber);
   
   List<Loan> GetAllLoanInformation();
   
   List<Loan_Trans> GetAllLoanTransInformation();
   
   Loan GetNewLoanDocument(String AccountNumber);
   
   List<Loan_Amount_Credit> GetAllCreditLoanInformation();
   
   Loan_Amount_Credit GetLoanAmountCreditDocument(String AccountNumber);
   
   List<Loan_Closed> GetAllCloseLoanInformation();
   
   List<EmergencyLoan> GetAllEmergencyLoanInformation();
   
   EmergencyLoan GetEmergencyLoanDocument(String AccountNumber);
   
   List<Emergency_Loan_Credit> GetAllEmergencyLoanCreditInformation();
   
   List<Emergency_Loan_Close> GetAllEmergencyLoanCloseInformation();
   
   List<Add_Member> GetAllMemberInformation();
   
   List<Add_Member> GetAllGuarantorMemberInformation();
   
   List<Add_Member> GetAllMemberBirthdayInformation(String bdate);
   
   List<Add_Member> GetAllMemberRetiredInformation(String dor);
   
   Add_Member GetAddMemberDocument(String AccountNumber);
   
   String save_dead_member(Dead_Member dead_member);
   
   String save_cancel_member(Cancel_Member cancel_member);
   
   String CheckLoanSanction(String LoanAmount,String NetSalary,String Share,String Insurance);
   
   //String LoanAutoCalculate(String LoanAmount,String InterstRate,String Tenure);
   
   List<Dead_Member> GetAllDeadMemberInformation();
   
   List<Notification> GetAllNotificationInformation();
   
   List<Cancel_Member> GetAllCancelMemberInformation();
   
   String SearchInsuranceDetails(String accountnumber);
   
   String SearchShareDetails(String accountnumber);
   
   String[] SearchCreditLoanDetails(String accountnumber);
   
   String SearchEmergencyCreditLoanDetails(String accountnumber);
   
   Loan_Closed GetLoanClosedDocument(String AccountNumber);
   
   String SearchCloseLoanDetails(String accountnumber);
   
   String SearchEmergencyCloseLoanDetails(String accountnumber);
   
   String SearchMonthlyEmiChangeDetails(String accountnumber);
   
   String UpdateShareDetails(String accountnumber, String share);
   
   String UpdateInsuranceDetails(String accountnumber, String insurance);
   
   String UpdateMemberGuantorCount(String guarantor1, String guarantor2);
   
   String UpdateMemberGuantorCountLess(String guarantor1, String guarantor2);
   
   String save_change_interest(Change_Interest change_interest);
   
   String save_dividend_interest(Dividend_Interest dividend_interest);
   
   List<Change_Interest> GetAllChangeInterestInformation();
   
   List<Dividend_Interest> GetAllDividendInterestInformation();
  
   String FindAllDividendInterestInformation();  
   
   String DeleteChangeInterest(int id); 
   
   String DeleteDividendInterest(int id); 
   
   String SearchType_of_loan(String interesttype);
   
   String SearchMonthDepositDetails(String accountnumber);
   
   String SearchRegularLoanDetails(String accountnumber);
   
   String SearchRegularLoanBalanceDetails(String accountnumber);
   
   String SearchEmergencyLoanDetails(String accountnumber);
   
   String SearchRDDetails(String accountnumber);
      
   String UpdateMonthlyEmiChangeDetails(String accountnumber, String shares, String monthlydeposit, String insurance, String regularloan, String emergencyloan);
   
   String UpdateMonthlyDeductionEditDetails(String accountnumber, String shares, String monthlydeposit, String insurance, String regularloan, String regularloaninterest,String emergencyloan, String emergencyloaninterest);
   
   String UpdateMonthlyDeductionDetails(String accountnumber, String fullname, String shares, String rd, String insurance, String monthly_deposit, String emi, String principal_amount, String interest, String e_emi, String e_principal_amount, String e_interest, String total);

///////////////////////////// Start Dead & Cancel Members ///////////////////////////////////////////////////
   
   String SearchDeadShareDetails(String accountnumber);
   
   String SearchDeadRDDetails(String accountnumber);
   
   String SearchDeadFDDetails(String accountnumber);
   
   String SearchDeadInsuranceDetails(String accountnumber);  
   
   String SearchDeadMonthDepositDetails(String accountnumber);
   
   String SearchDeadRegularLoanDetails(String accountnumber);
   
   String SearchDeadEmergencyLoanDetails(String accountnumber);
   
/////////////////////////////// End Dead & Cancel Members //////////////////////////////////////////////////   
   
   Vector<String> LoanAutoCalculate(String LoanAmount,String InterstRate,String Tenure);
   
   String UpdateRegularLoanDetails(String accountnumber, String intrestamount, String balanceloan, String remtenure);
   
   //String UpdateEmergencyRegularLoanDetails(String accountnumber,String balanceloan, String remtenure);
   
   String UpdateEmergencyRegularLoanDetails(String accountnumber,String balanceloan);
   
   String SearchMemberDetails(String accountnumber);
   
   String SearchEmergencyBalanceLoanDetails(String accountnumber);
   
   List<RecurringDeposit> SearchAllRDOfMember(String AccountNumber);
   
   List<RecurringDeposit> SearchAllCloseRDOfMember(String AccountNumber);
   
   List<RecurringDepositeNew> SearchAllCloseNewRDOfMember(String AccountNumber);
   
////////////////////////////////// Deduction ///////////////////////////////////////////////
   List<Deduction> GetAllDeductionDetails(String month);
////////////////////////////////// Deduction /////////////////////////////////////////////// 
   
   List<Dividend> GetAllDividendDetails(String share_interest, String deposit_interest);
   
   double CalRDAmountTillDate(String RDAmount,String RDDate);
   
   String UpdateRDStatus(String id, String rdamount, String enddate, String totamt, String chequenumber, String receiptnumber);
   
   String DeleteNewRD(int id);
   
   String UpdateLoanGuarantor(String accountnumber, String guranteer, String guranteer2, String chequenumber);
   
   String UpdateEmergencyLoanGuarantor(String accountnumber, String guranteer, String guranteer2, String chequenumber);
   
   double CalFDAmountTillDate(String FDAmount,String FDDate);
   
   String UpdateFDStatus(int id, String chequenumber, String receiptnumber);
   
   String SearchChangeInterestDetails(String interesttype);
   
 //  void CompareExcel(FileInputStream excellFile1,FileInputStream excellFile2 );
   
   List<Deduction_Compare> CompareExcel(FileInputStream excellFile1,FileInputStream excellFile2 );
   
   List<Trans_Share> Share_Report_Details(String accountnumber, String sdate, String edate);
   
   List<FixedDeposite> FD_Report_Details(String accountnumber, String sdate, String edate);
   
   List<RecurringDeposit> RD_Report_Details(String accountnumber, String sdate, String edate);
   
   List<TransInsurance> Insurance_Report_Details(String accountnumber, String sdate, String edate);
   
   List<Trans_MonthlyDeposit> Monthly_Deposit_Report_Details(String accountnumber, String sdate, String edate);
   
   List<Loan_Trans> new_loan_Report_Details(String accountnumber, String sdate, String edate); 
   
   List<Loan_Closed> new_loan_close_Report_Details(String accountnumber, String sdate, String edate); 
   
   List<Emergency_Loan_Close> emergency_loan_close_Report_Details(String accountnumber, String sdate, String edate); 
   
   List<EmeregencyLoanTrans> emergency_loan_Report_Details(String accountnumber, String sdate, String edate); 
   
   List<Cancel_Member> cancel_member_Report_Details(String accountnumber, String sdate, String edate);
   
   List<Dead_Member> dead_member_Report_Details(String accountnumber, String sdate, String edate);
  
   String DeleteCancelMemberDetails(String accountnumber);  
   
   //String GenerateMonthlyDeduction(String AccountNumber,String FulName);   
 //  String GenerateMonthlyDeduction(String AccountNumber,String FulName);
   String GenerateMonthlyDeductionInsurance(String AccountNumber,String FulName,String date);
  
   String GenerateMonthlyDeductionShare(String AccountNumber,String FulName,String date);
   
   String GenerateMonthlyDeductionMonthlyDeposite(String AccountNumber,String FulName,String date);
   
   String GenerateMonthlyDeductionMonthlyRD(String AccountNumber,String FulName,String date);
   
   String GenerateMonthlyDeductionMonthlyRDTrans(String AccountNumber,String FulName,String TotalAmount,String TotalRDAmount,String date);
   
   String GenerateMonthlyDeductionMonthlyLoan(String AccountNumber,String FulName,String date);
   
   String GenerateMonthlyDeductionMonthlyEmergencyLoan(String AccountNumber,String FulName,String date);

   double GetRecurringDepositOfNewUser(String AccountNumber);
   
   int GetRecurringDepositOfNewUserId();
   
   Vector<LinkedHashMap<String, String>> GetTerijPatrakInfo(String sdate,String edate);
   
   Vector<LinkedHashMap<String, String>> GetNAfaTotaPatrakInfo(String sdate,String edate);
   
   List<Third_Party_Payment> Daily_Report_Details(String sdate, String edate);
   
   List<TransInsurance> getTransInsuranceData();
   
   List<UserAnnualReport> FetchAnnualReport(String Sdate,String Edate);
}
