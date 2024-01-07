package com.codeft.ServicesImpl;

import java.io.FileInputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.Vector;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.apache.commons.collections4.multimap.HashSetValuedHashMap;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.codeft.Beans.JavaBeans;
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
import com.codeft.Repository.Add_Member_Repository;
import com.codeft.Repository.Cancel_Member_Repository;
import com.codeft.Repository.Change_Interest_Repository;
import com.codeft.Repository.Close_FD_Repository;
import com.codeft.Repository.Close_RD_Repository;
import com.codeft.Repository.Dead_Member_Repository;
import com.codeft.Repository.Dividend_Interest_Repository;
import com.codeft.Repository.EmergencyLoanRepository;
import com.codeft.Repository.Emergency_Loan_Close_Repository;
import com.codeft.Repository.Emergency_Loan_Credit_Repository;
import com.codeft.Repository.FDRepository;
import com.codeft.Repository.HeadRepository;
import com.codeft.Repository.InsuranceRepository;
import com.codeft.Repository.LoanRepository;
import com.codeft.Repository.Loan_Amount_Credit_Repository;
import com.codeft.Repository.Loan_Closed_Repository;
import com.codeft.Repository.Trans.EmergencyLoanTransRepository;
import com.codeft.Repository.Trans.Loan_TransRepository;
import com.codeft.Repository.Trans.TransInsuranceRepository;
import com.codeft.Repository.Trans.TransShareRepository;
import com.codeft.Repository.Trans.Trans_MonthlyDepositRepository;
import com.codeft.Repository.MonthlyDepositeRepository;
import com.codeft.Repository.Monthly_Emi_Change_Repository;
import com.codeft.Repository.Notification_Repository;
import com.codeft.Repository.Pat_Profile_Repository;
import com.codeft.Repository.RDNewRepository;
import com.codeft.Repository.RDRepository;
import com.codeft.Repository.ShareRepository;
import com.codeft.Repository.Third_Party_Payment_Repository;
import com.codeft.Repository.UserSignRepository;
import com.codeft.Services.AdminServices;


@Repository
public class AdminServicesImplement implements AdminServices{
	//@Autowired	
	//JavaBeans javabeans = new JavaBeans();
	
	@Autowired
	UserSignRepository USR;
	@Autowired
	InsuranceRepository INSRepo;
	@Autowired
	ShareRepository sharerepo;
	@Autowired
	HeadRepository HR;
	@Autowired
	RDRepository RDR;
	@Autowired
	Third_Party_Payment_Repository TPPR;
	@Autowired
	MonthlyDepositeRepository MDR;
	@Autowired
	RDNewRepository RDNR;
	
	@Autowired
	Pat_Profile_Repository PPR;
	@Autowired
	Add_Member_Repository AMR;
	@Autowired
	LoanRepository LR;
	@Autowired
	Loan_TransRepository LTR;
	@Autowired
	Loan_Amount_Credit_Repository LACR;
	@Autowired
	Loan_Closed_Repository LCR;
	@Autowired
	EmergencyLoanRepository ELR;
	@Autowired
	Emergency_Loan_Credit_Repository ELCR;	
	@Autowired
	Emergency_Loan_Close_Repository ELClose;
	@Autowired
	Monthly_Emi_Change_Repository MECR;
	@Autowired
	FDRepository FD;
	@Autowired
	Close_FD_Repository CFR;
	@Autowired
	Close_RD_Repository CRR;
	
	@Autowired
	Dead_Member_Repository DMR;
	@Autowired
	Cancel_Member_Repository CMR;
	@Autowired
	Change_Interest_Repository CIR;
	@Autowired
	Dividend_Interest_Repository DIR;
	@Autowired
	TransShareRepository TSR;
	@Autowired
	TransInsuranceRepository TIR;
	@Autowired
	Trans_MonthlyDepositRepository TMDR;
	@Autowired
	EmergencyLoanTransRepository ELTR;
	@Autowired
	Notification_Repository NR;
	
	
	@PersistenceContext
	 private EntityManager entityManager;
	
	@Override
	public Add_Member GetUserName(String AccountNumber) {
		
		//UserSign us = USR.finduserByMob(AccountNumber);
		Add_Member am = AMR.finduserByAccountNumber(AccountNumber);
		return am;
	}


	@Override
	public String SaveInsuranceOfUser(Insurance ins) {
	ins = 	INSRepo.save(ins);
	String string = "";
	if(ins != null)	
	string = "Success";
	else {
		string = "Fail";
	}
	return string;
	}


	@Override
	public String SaveShare(Share share) {
	String string = "fail";
	Share sharereturn = sharerepo.save(share);
	if(sharereturn != null)
	string = "Success";
		return string;
	}

	@Override
	public String SaveMonthlyDeposit(MonthlyDeposit monthly_deposit) {
		String string = "fail";
		MonthlyDeposit monthly_data = MDR.save(monthly_deposit);
		if(monthly_data != null)
		string = "Success";
		return string;
	}
	
	@Override
	public String save_new_rd(RecurringDepositeNew rd_new_save) {
		String string = "Fail";
		RecurringDepositeNew rdnew = RDNR.save(rd_new_save);
		if(rdnew != null)
		string = "Success";
		return string;
	}

	@Override
	public String SaveHeadName(Head head) {
		String string = "Fail";
		Head hd = HR.save(head);
		if(hd != null)
			string = "Successful";
		return string;
	}


	@Override
	public String SaveRDInfo(RecurringDeposit RD) {
		
		String string = "Fail";
		RecurringDeposit RCD = RDR.save(RD);
		if(RCD != null)
			string = "Success";
		return string;
	}


	@Override
	public List<RecurringDeposit> GetAllRDInformation() {
		//List<RecurringDeposit> RD = RDR.findAll();
		List<RecurringDeposit> RD = RDR.findAllRDDetails();
		return RD;
	}
	
	@Override
	public List<RecurringDepositeNew> GetAllNewRDInformation() {
		List<RecurringDepositeNew> rdn = RDNR.findAll();
		return rdn;
	}

	@Override
	public int GetRecurringDepositOfNewUserId() {
		
		String status = "Success";
		Session session = null;
		if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
		    throw new NullPointerException();
		}
		  int sum = 0;
			try {
				 		 				 	
			     final Query query = (Query)session.createNativeQuery("select id,accno from new_rd ORDER BY id DESC LIMIT 1");
			     
			     final List<Object[]> result = (List<Object[]>)query.getResultList();
			
			     for (final Object[] res : result) {			  	 
			    	 sum = Integer.parseInt(res[0].toString());
		             String accno = res[1].toString(); 
			    }			   
			}
			catch (Exception e) {			
					}
			return sum;
	}

	@Override
	public RecurringDepositeNew GetRDDocument(String AccountNumber) {
	RecurringDepositeNew RD = RDNR.findRDByAccountNumber(AccountNumber);
		return RD;
	}
	
	@Override
	public FixedDeposite GetFDDocument(String AccountNumber) {
		FixedDeposite FDD = FD.findFDByAccountNumber(AccountNumber);
		return FDD;
	}
	
	@Override
	public Loan GetNewLoanDocument(String AccountNumber) {
		Loan lnn = LR.findNewLoanByAccountNumber(AccountNumber);
		return lnn;
	}

	@Override
	public Loan_Amount_Credit GetLoanAmountCreditDocument(String AccountNumber) {
		Loan_Amount_Credit lac = LACR.findLoanAmountCreditByAccountNumber(AccountNumber);
		return lac;
	}

	@Override
	public EmergencyLoan GetEmergencyLoanDocument(String AccountNumber) {
		// TODO Auto-generated method stub
		EmergencyLoan el = ELR.findEmergencyLoanByAccountNumber(AccountNumber);
		return el;
	}
	
	@Override
	public Add_Member GetAddMemberDocument(String AccountNumber) {
		// TODO Auto-generated method stub 
		Add_Member el = AMR.findAddMemberByAccountNumber(AccountNumber);
		return el;
	}
	
	@Override
	public Loan_Closed GetLoanClosedDocument(String AccountNumber) {
		// TODO Auto-generated method stub
		Loan_Closed lc = LCR.findLoanClosedByAccountNumber(AccountNumber);
		return lc;
	}

	@Override
	public List<Head> GetAllHeadName() {
		List<Head> HN = HR.findAll();
		return HN;
	}

	
	@Override
	public String SaveThirdPartyDetails(Third_Party_Payment tpp) {
		String string = "Fail";
		Third_Party_Payment tppd = TPPR.save(tpp);
		if(tppd != null)
			string = "Success";
		return string;
	}
	
	@Override
	public String SaveNotificationDetails(Notification ntf) {
		String string = "Fail";
		Notification ntfc = NR.save(ntf);
		if(ntfc != null)
			string = "Success";
		return string;
	}
	
	@Override
	public List<Third_Party_Payment> GetAllThirdPartyDetails() {
		List<Third_Party_Payment> tpp = TPPR.findAll();
		return tpp;
	}


	@Override
	@Transactional
	public String DeleteThirdPartyPayment(int id) {
		TPPR.deleteThirdPartyPaymentById(id);
		return "Success";
	}
	
	@Override
	@Transactional
	public String DeleteRegularLoan(String accountnumber) {
		LR.deleteLoanByAccountNumber(accountnumber);
		return "Success";
	}


	@Override
	@Transactional
	public String DeleteRegularLoanTrans(int id) {
		LTR.deleteRegularLoanTransById(id);
		return "Success";
	}

	@Override
	@Transactional
	public String DeleteFD(int id) {
		FD.deleteFD(id);
		return "Success";
	}


	@Override
	@Transactional
	public String DeleteRD(int id) {
		RDR.deleteRD(id);
		return "Success";
	}
	
	@Override
	@Transactional
	public String DeleteNewRD(int id) {
		// TODO Auto-generated method stub
		RDNR.deleteNewRDByID(id);
		return "Success";
	}


	@Override
	@Transactional
	public String DeleteEmergencyLoan(String accountnumber) {
		ELR.deleteEmergencyLoanByAccountNumber(accountnumber);
		return "Success";
	}


	@Override
	@Transactional
	public String DeleteEmergencyLoanTrans(int id) {
		ELTR.deleteEmergencyLoanTransById(id);
		return "Success";
	}

	@Override
	@Transactional
	public String DeleteNotification(int id) {
		NR.deleteNotificationById(id);
		return "Success";
	}

	@Override
	@Transactional
	public String DeleteAccountHead(int id) {
		HR.deleteAccountHeadById(id);
		return "Success";
	}


	@Override
	public double GetTotalRDInformation() {
		double sum = 0.0;
		/*
		String status = "Success";
		Session session = null;
		if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
		    throw new NullPointerException();
		}
		  double sum = 0.0;
			try {
				 		 				 	
			     final Query query = (Query)session.createNativeQuery("select * from rd");
			     
			     final List<Object[]> result = (List<Object[]>)query.getResultList();
			     System.out.println("Hello RD Total");
			     for (final Object[] res : result) {			  	 
			  	 sum = sum+Double.parseDouble(res[8].toString());
			  	 // 	System.out.println("RD Sum : "+sum);		  	     	     	
			    }			   
			}
			catch (Exception e) {			
					}
			return sum;
			*/
		//sum = RDR.selectTotalAmount();
		sum = RDNR.selectTotalAmount();
	//	System.out.println("RD Sum :  "+sum);
		return sum;
	}


	@Override
	public double GetTotalFDInformation() {
		double sum = 0.0;
		try {
			sum = FD.selectFDAmount();			
		} catch (Exception e) {
			// TODO: handle exception
		}				
	//	System.out.println("FD Sum :  "+sum);
		return sum;		
	}


	@Override
	public double GetTotalMonthlyDepositInformation() {
		
		double sum = MDR.selectM_DepositAmount();
	//	System.out.println("Monthly Deposit Sum :  "+sum);
		return sum;
	}


	@Override	
	public double GetTotalInsuranceInformation() {
		double sum = 0;
		try {
			sum = INSRepo.selectTotalInsuranceAmount();
			//	System.out.println("Total Insurance Sum :  "+sum);
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sum;
	}


	@Override
	public double GetTotalShareInformation() {
		
		double sum = sharerepo.selectTotalShareAmount();
	//	System.out.println("Total Share Sum :  "+sum);
		return sum;
	}
	
	@Override
	public double GetTotalRegularLoanInformation() {
		
			double sum = LR.selectTotalLoanAmount();
		//	System.out.println("Total Loan Sum :  "+sum);
			return sum;	
	}
	
	@Override
	public double GetTotalRemainingRegularLoanInformation() {
		
			double sum = LR.selectRemainingLoanAmount();
	//		System.out.println("Remaining Loan Sum :  "+sum);
			return sum;
	}

	@Override
	public double GetTotalEmergencyLoanInformation() {
		
			double sum = ELR.selectEmergencyLoanAmount();
	//		System.out.println("Remaining Emergency Loan Sum :  "+sum);
			return sum;
	}


	@Override
	public double GetTotalRemainingEmergencyLoanInformation() {
		
			double sum = ELR.selectEmergencyBalanceLoanAmount();
	//		System.out.println("Remaining Emergency Loan Balance Sum :  "+sum);
			return sum;
	}
	
	@Override
	public int GetTotalClosedAccountInformation() {
		String status = "Success";
		Session session = null;
		if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
		    throw new NullPointerException();
		}
		  int sum = 0;
			try {
				 		 				 	
			     final Query query = (Query)session.createNativeQuery("select * from deadmembers");
			     
			     final List<Object[]> result = (List<Object[]>)query.getResultList();
			//     System.out.println("Hello Total Closed Account");
			     for (final Object[] res : result) {			  	 
			//  	 	System.out.println("Sum : "+sum);	
			    	 sum++;
			    }			   
			}
			catch (Exception e) {			
					}
			return sum;
	}
	
	@Override
	public int GetTotalCanceledAccountInformation() {
		String status = "Success";
		Session session = null;
		if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
		    throw new NullPointerException();
		}
		  int sum = 0;
			try {
				 		 				 	
			     final Query query = (Query)session.createNativeQuery("select * from cancel_membership");
			     
			     final List<Object[]> result = (List<Object[]>)query.getResultList();
			//     System.out.println("Hello Total Canceled Accounts");
			     for (final Object[] res : result) {			  	 
			//  	 	System.out.println("Sum : "+sum);	
			    	 sum++;
			    }			   
			}
			catch (Exception e) {			
					}
			return sum;
	}


	@Override
	public String save_patsanstha_profile(Pat_Profile pat_profile) {
		PPR.save(pat_profile);
		return "Success";
	}


	@Override
	public String save_member(Add_Member add_member) {
		AMR.save(add_member);
		return "Success";
	}


	@Override
	public String save_new_loan(Loan new_loan) {
		// TODO Auto-generated method stub
		LR.save(new_loan);
		return "Success";
	}
	
	@Override
	public String save_trans_loan(Loan_Trans trans_loan) {
		LTR.save(trans_loan);
		return "Success";
	}

	@Override
	public String save_loan_amount_credit(Loan_Amount_Credit loan_amount_credit) {
		// TODO Auto-generated method stub
		LACR.save(loan_amount_credit);
		return "Success";
	}


	@Override
	public String save_loan_closed(Loan_Closed loan_closed) {
		// TODO Auto-generated method stub
		LCR.save(loan_closed);
		return "Success";
	}


	@Override
	public String save_emergency_loan(EmergencyLoan emergency_loan) {
		// TODO Auto-generated method stub
		ELR.save(emergency_loan);
		return "Success";
	}


	@Override
	public String save_emergency_loan_credit(Emergency_Loan_Credit emergency_loan_credit) {
		// TODO Auto-generated method stub
		ELCR.save(emergency_loan_credit);
		return "Success";
	}


	@Override
	public String save_emergency_loan_close(Emergency_Loan_Close emergency_loan_close) {
		// TODO Auto-generated method stub
		ELClose.save(emergency_loan_close);
		return "Success";
	}


	@Override
	public String save_monthly_emi_change(Monthly_Emi_Change monthly_emi_change) {
		// TODO Auto-generated method stub
		MECR.save(monthly_emi_change);
		return "Success";
	}


	@Override
	public String save_fd(FixedDeposite fd_save) {
		// TODO Auto-generated method stub
		FD.save(fd_save);
		return "Success";
	}

    /*
	@Override
	public String save_close_fd(Close_FD fd_close) {
		// TODO Auto-generated method stub
		CFR.save(fd_close);
		return "Success";
	}
	*/
	
	@Override
	public String save_close_fd(FixedDeposite fd_close) {
		FD.save(fd_close);
		return "Success";
	}

	@Override
	public String save_close_rd(Close_RD rd_close) {
		// TODO Auto-generated method stub
		CRR.save(rd_close);
		return "Success";
	}
	
	@Override
	public String save_close_rd(RecurringDepositeNew rd_close) {
		RDNR.save(rd_close);
		return "Success";
	}


	@Override
	public List<Close_RD> GetAllCloseRDInformation() {
		// TODO Auto-generated method stub
		List<Close_RD> RD = CRR.findAll();
		return RD;
	}

	@Override
	public List<Close_RD> GetAllCloseRd() {
		List<Close_RD> close_rd_list = CRR.findAll();
		return close_rd_list;
	}

	@Override
	public List<Close_FD> GetAllCloseFDInformation() {
		// TODO Auto-generated method stub
		List<Close_FD> FD = CFR.findAll();
		return FD;
	}


	@Override
	public List<FixedDeposite> GetAllFDInformation() {
		// TODO Auto-generated method stub
		//List<FixedDeposite> FDD = FD.findAllFDDetails();
		List<FixedDeposite> FDD = FD.findAll();
		return FDD;
	}
	
	@Override
	public List<Loan> GetAllLoanInformation() {
		// TODO Auto-generated method stub
		List<Loan> ln = LR.findLoanMember();
		return ln;
	}

	@Override
	public List<Loan_Trans> GetAllLoanTransInformation() {
		// TODO Auto-generated method stub
	//	List<Loan_Trans> ltn = LTR.findAll();
		List<Loan_Trans> ltn = LTR.findAll(Sort.by(Sort.Direction.ASC, "accountnumber"));
		return ltn;
	}

	@Override
	public List<Loan_Amount_Credit> GetAllCreditLoanInformation() {
		// TODO Auto-generated method stub
		List<Loan_Amount_Credit> lac = LACR.findAll();
		return lac;
	}


	@Override
	public List<Loan_Closed> GetAllCloseLoanInformation() {
		// TODO Auto-generated method stub
		List<Loan_Closed> lc = LCR.findAll();
		return lc;
	}


	@Override
	public List<EmergencyLoan> GetAllEmergencyLoanInformation() {
		// TODO Auto-generated method stub
		List<EmergencyLoan> el = ELR.findAll();
		return el;
	}


	@Override
	public List<Emergency_Loan_Credit> GetAllEmergencyLoanCreditInformation() {
		// TODO Auto-generated method stub
		List<Emergency_Loan_Credit> elc = ELCR.findAll();
		return elc;
	}


	@Override
	public List<Emergency_Loan_Close> GetAllEmergencyLoanCloseInformation() {
		// TODO Auto-generated method stub
		List<Emergency_Loan_Close> elc = ELClose.findAll();
		return elc;
	}


	@Override
	public List<Add_Member> GetAllMemberInformation() {
		// TODO Auto-generated method stub
		List<Add_Member> am = AMR.findAll();
		return am;
	}

	@Override
	public List<Add_Member> GetAllGuarantorMemberInformation() {
		// TODO Auto-generated method stub
		List<Add_Member> glist = AMR.findGuarantorMemberList();
		return glist;
	}


	@Override
	public String save_dead_member(Dead_Member dead_member) {
		// TODO Auto-generated method stub
		DMR.save(dead_member);
		return "Success";
	}
	
	@Override
	public String save_cancel_member(Cancel_Member cancel_member) {
		// TODO Auto-generated method stub
		CMR.save(cancel_member);
		return "Success";
	}
	
/*
	@Override
	public String LoanAutoCalculate(String LoanAmount, String InterstRate, String Tenure) {
	String LoanData[] = new String[2];
	String vb ="";	
	double INTR = ((Double.parseDouble(InterstRate)/12) * Double.parseDouble(Tenure));
	INTR = ((INTR/100) * Double.parseDouble(LoanAmount));
	double TAmount = Double.parseDouble(LoanAmount) + INTR;
	double EMI = (TAmount/Double.parseDouble(Tenure));
	LoanData[0] = Double.toString(INTR);
	LoanData[1] = Double.toString(EMI);
	vb = LoanData[0]+":"+LoanData[1];
	return vb;
	}
*/	
	
	@Override
	public Vector<String> LoanAutoCalculate(String LoanAmount, String InterstRate, String Tenure) {
/*	String LoanData[] = new String[2];
	String vb ="";
	double loanAmount = Double.parseDouble(LoanAmount);
	int numYears = Integer.parseInt(Tenure);
	double annualInterestRate = Double.parseDouble(InterstRate);
	double monthlyInterestRate = annualInterestRate / 12;
	double monthlyPayment      = monthlyPayment(loanAmount, monthlyInterestRate, numYears);
	System.out.println("EMI IS HERE :  "+ monthlyPayment);
	Vector<String> EMI = printAmortizationSchedule(loanAmount, annualInterestRate, numYears);
	*/
		int count = 0;
		Vector<String> EMI =new Vector<>();
		double LAmount =Double.parseDouble(LoanAmount);
		//double InterestAmount = ((Double.parseDouble(LoanAmount) * Double.parseDouble(InterstRate))/1200);
	    //System.out.println("Loan Amount : "+LAmount);    
		int i = Integer.parseInt(Tenure);
		while(i <= LAmount)
	         {
	        	 count++;
	        	 double InterestAmount = ((LAmount * Double.parseDouble(InterstRate))/1200);
	        	 double interest = Math.round(InterestAmount * 100.0) / 100.0;
	        	
	        	 LAmount =  LAmount - Integer.parseInt(Tenure);
	        	 double loanamount = Math.round(LAmount * 100.0) / 100.0;
	        	 
	        	 EMI.add(count + ":"+Double.toString(interest) + ":"+Integer.parseInt(Tenure)+":"+loanamount);
        	 
	        	 // i = i + 2000;
	         }
		
	         //System.out.println(EMI);	
	return EMI;
	}

	
	
	public static Vector<String> printAmortizationSchedule(double principal, double annualInterestRate,
	             int numYears) {
	Vector<String> EMIList = new Vector<>();
	double interestPaid, principalPaid, newBalance;
	double monthlyInterestRate, monthlyPayment;
	int month;
	int numMonths = numYears ;

	// Output monthly payment and total payment
	monthlyInterestRate = annualInterestRate / 12;
	monthlyPayment      = monthlyPayment(principal, monthlyInterestRate, numYears);
	System.out.format("Monthly Payment: %8.2f%n", monthlyPayment);
	System.out.format("Total Payment:   %8.2f%n", monthlyPayment * numYears );

	// Print the table header
	//printTableHeader();

	for (month = 1; month <= numMonths; month++) {
	// Compute amount paid and new balance for each payment period
	interestPaid  = principal      * (monthlyInterestRate / 100);
	principalPaid = monthlyPayment - interestPaid;
	newBalance    = principal      - principalPaid;

	// Output the data item
	//printScheduleItem(month, interestPaid, principalPaid, newBalance);
	EMIList.add(month + ":"+ Math.round(interestPaid) + ":"+ Math.round(principalPaid) + ":"+Math.round(newBalance)  );
	// Update the balance
	principal = newBalance;
	}
	return EMIList;
	}
	   
	static double monthlyPayment(double loanAmount, double monthlyInterestRate, int numberOfYears) {
	       monthlyInterestRate /= 100;  // e.g. 5% => 0.05
	       return loanAmount * monthlyInterestRate /
	               ( 1 - 1 / Math.pow(1 + monthlyInterestRate, numberOfYears) );
	}
	
	@Override
	public String CheckLoanSanction(String LoanAmount, String NetSalary, String Share, String Insurance) {
	String string= "";
	double AsPerNetSalary = Double.parseDouble(NetSalary) * 0.4;
	AsPerNetSalary = AsPerNetSalary * 12 * 60;
	double AsPerShare = Double.parseDouble(Share) * 10;
	double AsPerInsurance = Double.parseDouble(Insurance) * 10;

	if(Double.parseDouble(LoanAmount) > AsPerNetSalary)
	string = "Loan Amount Is Gretter Than NetSalary";
	if(Double.parseDouble(LoanAmount) > AsPerShare)
	{
	string = string + ":"+"Loan Amount Is Gretter Than Share Price";
	double temp = Double.parseDouble(LoanAmount) - AsPerShare;
	string = string+":"+ "You Need To Add " +temp +"  Amount Share";

	}
	if(Double.parseDouble(LoanAmount) > AsPerInsurance)
	{
	string = string+":"+"Loan Amount Is Gretter Than Insurance Price";
	double temp = Double.parseDouble(LoanAmount) - AsPerInsurance;
	string = string+":"+ "You Need To Add " +temp +"  Amount Insurance";
	}
	return string;
	}

	@Override
	public List<Dead_Member> GetAllDeadMemberInformation() {
		List<Dead_Member> dm = DMR.findAll();
		return dm;
	}
	
	@Override
	public List<Notification> GetAllNotificationInformation() {
		List<Notification> ntf = NR.findAll();
		return ntf;
	}
	
	@Override
	public List<Cancel_Member> GetAllCancelMemberInformation() {
		// TODO Auto-generated method stub
		List<Cancel_Member> cm = CMR.findAll();
		return cm;
	}

	@Override
	public String SearchInsuranceDetails(String accountnumber) {
		Session session = null;
		String string = "";
		String string1 = "";
		String string2 = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, insdebt from insuranceform where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String full_name = res[0].toString();
                String insurance = res[1].toString();
              //  String share = res[2].toString();
                
                string = insurance;
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String SearchRegularLoanDetails(String accountnumber) {
		Session session = null;
		String string = "";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, principalamount,intrestamount from new_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String full_name = res[0].toString();
                String principalamount = res[1].toString();
         //       String interestamount = res[2].toString();
                
          //      string = principalamount+":"+interestamount;
                string = principalamount;
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String SearchRegularLoanBalanceDetails(String accountnumber) {
		Session session = null;
		String string = "";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, IFNULL(loanbalance, 0.0), IFNULL(principalamount,0.0) from new_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
            	
                try {									
                String full_name = res[0].toString();
                String loanbalance = res[1].toString();
                String principalamount = res[2].toString();
                if(!loanbalance.equals(null))
                string = loanbalance+":"+principalamount;
                }
                
                catch (Exception e) {
					// TODO: handle exception
				}
            	
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String SearchEmergencyLoanDetails(String accountnumber) {
		Session session = null;
		String string = "";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, e_principalamount,e_intrestamount from emergency_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
          
            if(result.get(0)[1] != null)
            {
            for (final Object[] res : result) {
                
                String full_name = res[0].toString();
                String e_principalamount = res[1].toString();
        //        String e_intrestamount = res[2].toString();
                
        //        string = e_principalamount+":"+e_intrestamount;
                string = e_principalamount;
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
       return string; 
	}
	
	@Override
	public String SearchMemberDetails(String accountnumber) {
		Session session = null;
		String string = "";		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, accountnumber from add_member where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();            
            for (final Object[] res : result) {                
                String full_name = res[0].toString();
                String accountno = res[1].toString();
                string = full_name;
            }           
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public String SearchEmergencyBalanceLoanDetails(String accountnumber) {
		Session session = null;
		String string = "";		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, IFNULL(eloanbalance,0.0), IFNULL(e_principalamount,0.0) from emergency_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();            
            for (final Object[] res : result) {               
                String full_name = res[0].toString();
                String eloanbalance = res[1].toString();     
                String e_principalamount = res[2].toString();     
                string = eloanbalance+":"+e_principalamount;
            }           
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String SearchRDDetails(String accountnumber) {
		Session session = null;
		String string = "";
		String status = "start";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
           // final Query query = (Query)session.createNativeQuery(" Select fullname, sum(rdamount) as ProdTotal from rd where accountnumber ='"+accountnumber+"' and status IS NULL group by accountnumber, fullname");
            final Query query = (Query)session.createNativeQuery(" Select name, totamt from new_rd where accno ='"+accountnumber+"' order by id desc limit 1");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String full_name = res[0].toString();
                String totalamount = res[1].toString();
              //  String share = res[2].toString();
                
                string = totalamount;
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String SearchShareDetails(String accountnumber) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname,shareallot from share where accountnumber ='" + accountnumber + "' ");            
			final List<Object[]> result = (List<Object[]>)query.getResultList();
					
            for (final Object[] res : result) {               
            	String fullname = res[0].toString();
                String share = res[1].toString();
                string = fullname+":"+share;
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String SearchMonthDepositDetails(String accountnumber) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname,m_debit from monthlydeposit where accountnumber ='" + accountnumber + "' ");            
			final List<Object[]> result = (List<Object[]>)query.getResultList();
					
            for (final Object[] res : result) {               
            	String fullname = res[0].toString();
                String mdeposit = res[1].toString();
                string = mdeposit;
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String[] SearchCreditLoanDetails(String accountnumber) {
		Session session = null;
		String string[] =  new String[2];
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, loanbalance,principalamount from new_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String fullname = res[0].toString();
             //   String share = res[1].toString();
             //   String insurance = res[2].toString();
                String loanamount = res[1].toString();
                String principalamount = res[2].toString();
                string[0] = loanamount;
                string[1] = principalamount;
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String SearchEmergencyCreditLoanDetails(String accountnumber) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, IFNULL(eloanbalance,0) as eloanb from emergency_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
             
            	 String fullname = res[0].toString();               
                 String loanamount = res[1].toString();
                 
                 string = fullname+":"+loanamount;
			
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String SearchCloseLoanDetails(String accountnumber) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, IFNULL(loanbalance,0) as loanb, IFNULL(intrestamount,0) as intrest, IFNULL(principalamount,0) as princi, IFNULL(guranteer,'') as guran, IFNULL(guranteer2,'') as gurante from new_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
           for (final Object[] res : result) {
                try {
                	String fullname = res[0].toString();
                    String loanbalance = res[1].toString();
                    String interest = res[2].toString();
                    String principalamount = res[3].toString();
                    String guranteer = res[4].toString();
                    String guranteer2 = res[5].toString();
                    
                    string = fullname+":"+loanbalance+":"+interest+":"+principalamount+":"+guranteer+":"+guranteer2;
                    //System.out.println("Close Loan Details : "+string);
				} catch (Exception e) {
					System.out.println(e);
				}
                
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public String SearchEmergencyCloseLoanDetails(String accountnumber) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, IFNULL(eloanbalance,0) as eloanb, IFNULL(e_intrestamount,0) as e_intrest, IFNULL(e_principalamount,0) as e_princ, IFNULL(guranteername1,'') as gurant1, IFNULL(guarnteername2,'') as guarnt2 from emergency_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
           for (final Object[] res : result) {
                try {
									
                String fullname = res[0].toString();
                String eloanbalance = res[1].toString();
                String interest = res[2].toString();
                String e_principalamount = res[3].toString();
                String guranteer = res[4].toString();
                String guranteer2 = res[5].toString();
                
                string = fullname+":"+eloanbalance+":"+interest+":"+e_principalamount+":"+guranteer+":"+guranteer2;
              //  System.out.println(string);
                } catch (Exception e) {
					System.out.println(e);
				}
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	
	@Override
	@Transactional
	public String UpdateRegularLoanDetails(String accountnumber, String intrestamount, String balanceloan, String remtenure) {
		// TODO Auto-generated method stub
		Session session = null;
        int modifications = 0;
        String emi = "0";
        String principal_amount = "0";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update new_loan set tenure=tenure-'" + remtenure + "', emi='"+emi+"', principalamount='"+principal_amount+"', intrestamount=intrestamount-'" + intrestamount + "', loanbalance=loanbalance-'" + balanceloan + "' where accountnumber ='" + accountnumber + "' ");
            modifications = query.executeUpdate();
           if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}
	
	@Override
	@Transactional
	public String UpdateEmergencyRegularLoanDetails(String accountnumber, String balanceloan) {
		// TODO Auto-generated method stub
		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update emergency_loan set eloanbalance=eloanbalance-'" + balanceloan + "' where accountnumber ='" + accountnumber + "' ");
            modifications = query.executeUpdate();
           if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}


	@Override
	public String SearchMonthlyEmiChangeDetails(String accountnumber) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, shares, monthlydeposit, insurance, regularloan, emergencyloan, rd, date1 from monthly_emi_change where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String fullname = res[0].toString();
                String shares = res[1].toString();
                String monthlydeposit = res[2].toString();
                String insurance = res[3].toString();
                String regularloan = res[4].toString();
                String emergencyloan = res[5].toString();
                String rd = res[6].toString();
                String date1 = res[7].toString();
                
                string = fullname+":"+shares+":"+monthlydeposit+":"+insurance+":"+regularloan+":"+emergencyloan+":"+rd+":"+date1;
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	@Transactional
	public String UpdateShareDetails(String accountnumber, String share) {
		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update share set totalamountofsahre = '" + share + "' where accountnumber ='" + accountnumber + "' ");
            modifications = query.executeUpdate();
           if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}


	@Override
	@Transactional
	public String UpdateInsuranceDetails(String accountnumber, String insurance) {
		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update insuranceform set totalinsuranceamount = '" + insurance + "' where accountnumber ='" + accountnumber + "' ");
            modifications = query.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}


	@Override
	public String save_change_interest(Change_Interest change_interest) {
		CIR.save(change_interest);
		return "Success";
	}
	
	@Override
	public String save_dividend_interest(Dividend_Interest dividend_interest) {
		DIR.save(dividend_interest);
		return "Success";
	}

	@Override
	public List<Change_Interest> GetAllChangeInterestInformation() {
		List<Change_Interest> ci = CIR.findAll();
		return ci;
	}

	@Override
	public List<Dividend_Interest> GetAllDividendInterestInformation() {
		List<Dividend_Interest> di = DIR.findAll();
		return di;
	}

	@Override
	@Transactional
	public String DeleteChangeInterest(int id) {
		CIR.deleteChangeInterestById(id);
		return "Success";
	}

	@Override
	@Transactional
	public String DeleteDividendInterest(int id) {
		DIR.deleteDividendInterestById(id);
		return "Success";
	}

	@Override
	public String SearchType_of_loan(String interesttype) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select interesttype,roi from change_interest where interesttype ='" + interesttype + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {               
                String roi = res[1].toString();                                
                string = roi;
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	@Transactional
	public String UpdateMonthlyEmiChangeDetails(String accountnumber, String shares, String monthlydeposit,
			String insurance, String regularloan, String emergencyloan) {
		// TODO Auto-generated method stub
		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update share set shareallot='" + shares + "' where accountnumber ='" + accountnumber + "' ");
            final Query query1 = (Query)session.createNativeQuery("update monthlydeposit set m_debit='" + monthlydeposit + "' where accountnumber ='" + accountnumber + "' ");
            final Query query2 = (Query)session.createNativeQuery("update insuranceform set insdebt='" + insurance + "' where accountnumber ='" + accountnumber + "' ");
            final Query query3 = (Query)session.createNativeQuery("update new_loan set principalamount='" + regularloan + "' where accountnumber ='" + accountnumber + "' ");
            final Query query4 = (Query)session.createNativeQuery("update emergency_loan set e_principalamount='" + emergencyloan + "' where accountnumber ='" + accountnumber + "' ");
            //final Query query5 = (Query)session.createNativeQuery("update new_rd set totamt='" + rd + "' where accno ='" + accountnumber + "' ");
            modifications = query.executeUpdate();
            modifications = query1.executeUpdate();
            modifications = query2.executeUpdate();
            modifications = query3.executeUpdate();
            modifications = query4.executeUpdate();
            //modifications = query5.executeUpdate();
        //   if (modifications == 1) {
                return "Success";
        //    }
        //    return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}
	
	@Override
	@Transactional
	public String UpdateMonthlyDeductionEditDetails(String accountnumber, String shares, String monthlydeposit,
			String insurance, String regularloan, String regularloaninterest, String emergencyloan, String emergencyloaninterest) {
		// TODO Auto-generated method stub
		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update share set shareallot='" + shares + "' where accountnumber ='" + accountnumber + "' ");
            final Query query1 = (Query)session.createNativeQuery("update monthlydeposit set m_debit='" + monthlydeposit + "' where accountnumber ='" + accountnumber + "' ");
            final Query query2 = (Query)session.createNativeQuery("update insuranceform set insdebt='" + insurance + "' where accountnumber ='" + accountnumber + "' ");
            final Query query3 = (Query)session.createNativeQuery("update new_loan set principalamount='" + regularloan + "', intrestamount='"+regularloaninterest+"' where accountnumber ='" + accountnumber + "' ");
            final Query query4 = (Query)session.createNativeQuery("update emergency_loan set e_principalamount='" + emergencyloan + "', e_intrestamount='"+emergencyloaninterest+"' where accountnumber ='" + accountnumber + "' ");
     //       final Query query5 = (Query)session.createNativeQuery("update rd set rdamount='" + rd + "' where accountnumber ='" + accountnumber + "' ");
            modifications = query.executeUpdate();
            modifications = query1.executeUpdate();
            modifications = query2.executeUpdate();
            modifications = query3.executeUpdate();
            modifications = query4.executeUpdate();
        //    modifications = query5.executeUpdate();
        //   if (modifications == 1) {
                return "Success";
        //    }
        //    return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}

	@Override
	@Transactional
	public String UpdateMonthlyDeductionDetails(String accountnumber, String fullname, String shares, String rd, String insurance,
			String monthly_deposit, String emi, String principal_amount, String interest, String e_emi,
			String e_principal_amount, String e_interest, String total) {
		
		   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		   LocalDateTime now = LocalDateTime.now();
		   System.out.println(dtf.format(now));
		   String cdate = dtf.format(now);

		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update share set totalamountofsahre=totalamountofsahre+'" + shares + "' where accountnumber ='" + accountnumber + "' ");
            final Query query1 = (Query)session.createNativeQuery("insert into trans_share(accountnumber,fullname,shareallot,date,totalamountofshare) values('"+accountnumber+"')");
      /* 
            final Query query1 = (Query)session.createNativeQuery("update monthlydeposit set m_debit='" + monthlydeposit + "' where accountnumber ='" + accountnumber + "' ");
            final Query query2 = (Query)session.createNativeQuery("update insuranceform set insdebt='" + insurance + "' where accountnumber ='" + accountnumber + "' ");
            final Query query3 = (Query)session.createNativeQuery("update new_loan set emi='" + regularloan + "' where accountnumber ='" + accountnumber + "' ");
            final Query query4 = (Query)session.createNativeQuery("update emergency_loan set e_emi='" + emergencyloan + "' where accountnumber ='" + accountnumber + "' ");
            final Query query5 = (Query)session.createNativeQuery("update rd set rdamount='" + rd + "' where accountnumber ='" + accountnumber + "' ");
     */ 
            modifications = query.executeUpdate();
            modifications = query1.executeUpdate();
     /*       
            modifications = query2.executeUpdate();
            modifications = query3.executeUpdate();
            modifications = query4.executeUpdate();
            modifications = query5.executeUpdate();
     */       
        //   if (modifications == 1) {
                return "Success";
        //    }
        //    return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}
	
	@Override
	public String SearchDeadShareDetails(String accountnumber) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname,totalamountofsahre from share where accountnumber ='" + accountnumber + "' ");            
			final List<Object[]> result = (List<Object[]>)query.getResultList();
					
            for (final Object[] res : result) {               
            	String fullname = res[0].toString();
                String share = res[1].toString();
                string = share;
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String SearchDeadRDDetails(String accountnumber) {
		Session session = null;
		String string = "";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, totalamount from rd where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String full_name = res[0].toString();
                String totalamount = res[1].toString();
              //  String share = res[2].toString();
                
                string = totalamount;
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String SearchDeadFDDetails(String accountnumber) {
		Session session = null;
		String string = "";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, totalamount from fixeddeposite where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String full_name = res[0].toString();
                String totalamount = res[1].toString();
              
                string = totalamount;
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String SearchDeadInsuranceDetails(String accountnumber) {
		Session session = null;
		String string = "";
		String string1 = "";
		String string2 = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname, totalinsuranceamount from insuranceform where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String full_name = res[0].toString();
                String insurance = res[1].toString();
              
                string = insurance;
            }           
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String SearchDeadMonthDepositDetails(String accountnumber) {
		Session session = null;
		String string = "";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select fullname,m_deposit from monthlydeposit where accountnumber ='" + accountnumber + "' ");            
			final List<Object[]> result = (List<Object[]>)query.getResultList();
					
            for (final Object[] res : result) {               
            	String fullname = res[0].toString();
                String mdeposit = res[1].toString();
                string = mdeposit;
            }
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String SearchDeadRegularLoanDetails(String accountnumber) {
		Session session = null;
		String string = "";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select intrestamount, loanbalance from new_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String intrestamount = res[0].toString();
                String loanbalance = res[1].toString();
              //  String share = res[2].toString();
                
                string = loanbalance+":"+intrestamount;
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String SearchDeadEmergencyLoanDetails(String accountnumber) {
		Session session = null;
		String string = "";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select e_intrestamount, eloanbalance from emergency_loan where accountnumber ='" + accountnumber + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
            	String intrestamount = res[0].toString();
                String eloanbalance = res[1].toString();
              //  String share = res[2].toString();
                
                string = eloanbalance+":"+intrestamount;
            }
            
            
           // string = string1+":"+string2;
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	@Transactional
	public String UpdateNewLoanDetails(String accountnumber, String loanamount) {
		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update new_loan set tenure=tenure-1, loanbalance=loanbalance-'" + loanamount + "' where accountnumber ='" + accountnumber + "' ");
            modifications = query.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}


	@Override
	@Transactional
	public String UpdateEmergencyLoanDetails(String accountnumber, String loanamount) {
		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update emergency_loan set eloanbalance=eloanbalance-'" + loanamount + "' where accountnumber ='" + accountnumber + "' ");
            modifications = query.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}


	@Override
	public List<RecurringDeposit> SearchAllRDOfMember(String AccountNumber) {
	List<RecurringDeposit> RDListOfMember = RDR.findrdByAccountNumber(AccountNumber);
		return RDListOfMember;
		
	}
	
	@Override
	public List<RecurringDepositeNew> SearchAllCloseNewRDOfMember(String AccountNumber) {
		// TODO Auto-generated method stub
		List<RecurringDepositeNew> rdn = RDNR.findNewRDByAccountNumber(AccountNumber);
	
		return rdn;
	}

	@Override
	public List<RecurringDeposit> SearchAllCloseRDOfMember(String AccountNumber) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          final Query query = (Query)session.createNativeQuery("Select rdd.accountnumber, rdd.fullname, nrd.startdate, rdd.rdamount, rdd.status FROM rd rdd INNER JOIN new_rd nrd ON rdd.accountnumber = nrd.accno where rdd.accountnumber = '"+AccountNumber+"' ");
          
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<RecurringDeposit> list = new ArrayList<RecurringDeposit>();
            for (final Object[] res : result) {
                final RecurringDeposit data = new RecurringDeposit();
               try {
				
									
                data.setAccountnumber(res[0].toString()); 
                data.setFullname(res[1].toString());
                data.setRddate(res[2].toString());
                data.setRdamount(Double.parseDouble(res[3].toString()));                        
                data.setStatus(res[4].toString());
               } catch (Exception e) {
   				// TODO: handle exception
   			}	
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}	

	@Override
	public List<Deduction> GetAllDeductionDetails(String month) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          //final Query query = (Query)session.createNativeQuery("Select am.accountnumber, am.fullname, sh.shareallot, sum(ra.rdamount) as ProdTotal, ins.insdebt, nl.emi, nl.principalamount, nl.intrestamount, el.e_emi, el.e_principalamount, el.e_intrestamount, md.m_debit FROM add_member am INNER JOIN share sh ON am.accountnumber = sh.accountnumber INNER JOIN rd ra ON ra.accountnumber = am.accountnumber INNER JOIN insuranceform ins ON ins.accountnumber = am.accountnumber INNER JOIN new_loan nl ON nl.accountnumber = am.accountnumber INNER JOIN emergency_loan el ON el.accountnumber = am.accountnumber INNER JOIN monthlydeposit md ON md.accountnumber = am.accountnumber where sh.date LIKE '%"+month+"%' group by sh.accountnumber,ra.accountnumber");
          //final Query query = (Query)session.createNativeQuery("Select am.accountnumber, am.fullname, sh.shareallot, sum(ra.rdamt) as ProdTotal, ins.insdebt, nl.emi, nl.principalamount, nl.intrestamount, el.e_emi, el.e_principalamount, el.e_intrestamount, md.m_debit FROM add_member am INNER JOIN share sh ON am.accountnumber = sh.accountnumber INNER JOIN new_rd ra ON ra.accno = am.accountnumber INNER JOIN insuranceform ins ON ins.accountnumber = am.accountnumber INNER JOIN new_loan nl ON nl.accountnumber = am.accountnumber INNER JOIN emergency_loan el ON el.accountnumber = am.accountnumber INNER JOIN monthlydeposit md ON md.accountnumber = am.accountnumber group by sh.accountnumber,ra.accno");
          final Query query = (Query)session.createNativeQuery("select md.accountnumber,md.fullname,md.m_debit,IFNULL(sum(ra.rdamt),0)  as ProdTotal,IFNULL(sh.shareallot,0) as sha,IFNULL(ins.insdebt,0) as insd, IFNULL(nl.emi,0) as nle, IFNULL(nl.principalamount,0) as nlp, IFNULL(nl.intrestamount,0) as nli, IFNULL(el.e_emi,0) as ele, IFNULL(el.e_principalamount,0) as elp, IFNULL(el.e_intrestamount,0) as eli from monthlydeposit md left join new_rd ra ON md.accountnumber = ra.accno left join insuranceform ins ON md.accountnumber = ins.accountnumber left join share sh ON md.accountnumber = sh.accountnumber left join new_loan nl ON md.accountnumber = nl.accountnumber left join emergency_loan el ON md.accountnumber = el.accountnumber group by md.accountnumber");
          
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Deduction> list = new ArrayList<Deduction>();
            for (final Object[] res : result) {
                final Deduction data = new Deduction();
               try {							
                data.setAccountnumber(res[0].toString()); 
                data.setFullname(res[1].toString());
                data.setM_debit(res[2].toString());
                data.setRdamount(res[3].toString());
                data.setShareallot(res[4].toString());                
                data.setInsdebt(res[5].toString());   
                
                data.setEmi(res[6].toString());                               
                data.setPrincipalamount(res[7].toString());                
                data.setIntrestamount(res[8].toString());  
                
                data.setE_emi(res[9].toString());                                
                data.setE_principalamount(res[10].toString());
                data.setE_intrestamount(res[11].toString());
                
                double total = Double.parseDouble(res[2].toString())+Double.parseDouble(res[3].toString())+Double.parseDouble(res[4].toString())+Double.parseDouble(res[5].toString())+Double.parseDouble(res[7].toString())+Double.parseDouble(res[8].toString())+Double.parseDouble(res[10].toString())+Double.parseDouble(res[11].toString());
                String total1 = String.valueOf(total);
                double total3 = Math.round(Double.parseDouble(total1));
                String total4 = String.valueOf(total3);
                data.setTotal(total4);
               // String total1 = String.valueOf(total);
               // data.setTotal(total1);
            //  System.out.println(res[0].toString()+"  "+res[1].toString()+"  "+res[2].toString()+"  "+res[3].toString()+"  "+res[4].toString()+"  "+res[5].toString()+"  "+res[6].toString()+"  "+res[7].toString());
               } catch (Exception e) {
   				System.out.println(e);
   			}
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public double CalRDAmountTillDate(String RDAmount, String RDDate) {

	//System.out.println("RD DATE: "+RDDate);
	double CurrentRDAmount = 0.0;

	try
	{

	int DiffYears[] = FindYears(RDDate);
	//System.out.println("Years: "+DiffYears[0]+" Month :  "+DiffYears[1]);

	if(DiffYears[0] < 2)
	{
		if(DiffYears[0] < 1 && DiffYears[1] <= 1)
		{
			
			if(DiffYears[1] == 1)
			CurrentRDAmount = Double.parseDouble(RDAmount) + Double.parseDouble(RDAmount);
			else
				CurrentRDAmount = Double.parseDouble(RDAmount) * (DiffYears[1] + 1);
		}
		else
		{
		int temp = DiffYears[0];
		temp = temp * 12;
		temp = temp + DiffYears[1] +1;
		CurrentRDAmount = Double.parseDouble(RDAmount) * temp;
		}
	}


	else if((DiffYears[0] >= 2 && DiffYears[0] < 5) && DiffYears[1] >= 1 )
	{
	int month = DiffYears[0] *12 + DiffYears[1] + 1;
	CurrentRDAmount = RDAmountBefore5Years(RDAmount, month);

	}

	else {

	CurrentRDAmount = RDAmountAfter5Years(RDAmount);


	}

	}
	catch (Exception e) {
	System.err.println(e);
	}
	return CurrentRDAmount;
	}


	public int[] FindYears(String RDDate) throws ParseException
	{

	String[] string = RDDate.split("-");
	int a = Integer.parseInt(string[1]);
	Month mon = Month.of(a);
	//System.out.println("month is:  "+mon);
	LocalDate RDDate1 = LocalDate.of(Integer.parseInt(string[0]), Month.of(a), Integer.parseInt(string[2]));
	LocalDate today = LocalDate.now();
	Period CalYears = Period.between(RDDate1, today);
	int year = CalYears.getYears();
	int months = CalYears.getMonths();
	int Days = CalYears.getDays();
	int Years[] = new int[]{year,months,Days};

	return Years;
	}

	public double RDAmountBefore5Years(String RDAmount,int month)
	{
	double RDAmountWithInterest = 0.0;

	double RDAmountTillDate = Double.parseDouble(RDAmount) * month;
	double RDInterest = ((RDAmountTillDate * 6)/1200);
	RDAmountWithInterest = RDAmountTillDate + RDInterest;

	return RDAmountWithInterest;
	}

	public double RDAmountAfter5Years(String RDAmount)
	{
	double RDAmountWithInterest = 0.0;
	double RDAmountTillDate = Double.parseDouble(RDAmount) * 60;
	double RDInterest = ((RDAmountTillDate * 7)/1200);
	RDAmountWithInterest = RDAmountTillDate + RDInterest;

	return RDAmountWithInterest;
	}

	


	@Override
	public double CalFDAmountTillDate(String FDAmount, String FDDate) {
	double CurrentFDAmount = 0.0;

	try
	{
	//	System.out.println("Implement FD Date : "+FDDate);
	int DiffYears[] = FindYears(FDDate);
	//System.out.println("Years: "+DiffYears);
	if( DiffYears[0] <= 90 && DiffYears[2] < 1)
	{
	CurrentFDAmount =  Double.parseDouble(FDAmount);

	}
	else if(DiffYears[0] > 90 && DiffYears[2] < 1)
	{
	double InterestAmount = ((Double.parseDouble(FDAmount) * DiffYears[0] * 3)/(365 * 100));

	CurrentFDAmount = Double.parseDouble(FDAmount) + InterestAmount;

	}
	else {

	double InterestAmount = ((Double.parseDouble(FDAmount) * 7)/100);
	//System.out.println("InterestAmount : "+ InterestAmount);
	CurrentFDAmount = Double.parseDouble(FDAmount) + InterestAmount ;

	}


	}
	catch (Exception e) {
	System.err.println(e);
	}
	return CurrentFDAmount;
	}

	@Override
	@Transactional
	public String UpdateRDStatus(String id, String rdamount, String enddate, String totamt, String chequenumber,
			String receiptnumber) {
		Session session = null;
		System.out.println("Hello update rd status");
        int modifications = 0;
        String status = "close";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update new_rd set totamt = '"+totamt+"', cheque_no='"+chequenumber+"', receiptnumber='"+receiptnumber+"', total_rd_amt = total_rd_amt - '"+rdamount+"', status='"+status+"' where id ='"+id+"'");
            modifications = query.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}
	
	
	@Override
	@Transactional
	public String UpdateLoanGuarantor(String accountnumber, String guranteer, String guranteer2, String chequenumber) {
		Session session = null;
		System.out.println("Hello update Loan Guarantor");
        int modifications = 0;
        String status = "close";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update new_loan set guranteer='"+guranteer+"', guranteer2='"+guranteer2+"', chequenumber='"+chequenumber+"' where accountnumber ='"+accountnumber+"'");
            final Query query1 = (Query)session.createNativeQuery("update new_loan_trans set guranteer='"+guranteer+"', guranteer2='"+guranteer2+"', chequenumber='"+chequenumber+"' where accountnumber ='"+accountnumber+"'");
            modifications = query.executeUpdate();
            modifications = query1.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Success";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Success";
        }
	}

	@Override
	@Transactional
	public String UpdateEmergencyLoanGuarantor(String accountnumber, String guranteer, String guranteer2,
			String chequenumber) {
		Session session = null;
		System.out.println("Hello update Emergency Loan Guarantor");
        int modifications = 0;
        String status = "close";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update emergency_loan set guranteername1='"+guranteer+"', guarnteername2='"+guranteer2+"', chequenumber='"+chequenumber+"' where accountnumber ='"+accountnumber+"'");
            final Query query1 = (Query)session.createNativeQuery("update emergency_loan_trans set guranteername1='"+guranteer+"', guranteername2='"+guranteer2+"', chequenumber='"+chequenumber+"' where accountnumber ='"+accountnumber+"'");
            modifications = query.executeUpdate();
            modifications = query1.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Success";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Success";
        }
	}

	@Override
	@Transactional
	public String UpdateFDStatus(int id, String chequenumber, String receiptnumber) {
		Session session = null;
        int modifications = 0;
        String status = "Close";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update fixeddeposite set chequenumber='"+chequenumber+"', receiptnumber='"+receiptnumber+"', status='"+status+"' where id ='"+id+"'");
            modifications = query.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}


	@Override
	public String SearchChangeInterestDetails(String interesttype) {
		Session session = null;
		String string = "";		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select interesttype, roi from change_interest where interesttype ='" + interesttype + "' ");
            final List<Object[]> result = (List<Object[]>)query.getResultList();            
            for (final Object[] res : result) {                
                String interesttype1 = res[0].toString();
                String roi = res[1].toString();
                string = roi;
            }           
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public List<Deduction_Compare> CompareExcel(FileInputStream excellFile1,FileInputStream excellFile2) {
		List<Deduction_Compare> list = new ArrayList<Deduction_Compare>();	    
	try
	{
		
	XSSFWorkbook workbook1 = new XSSFWorkbook(excellFile1);
	XSSFWorkbook workbook2 = new XSSFWorkbook(excellFile2);

	        // Get first/desired sheet from the workbook
	        XSSFSheet sheet1 = workbook1.getSheetAt(0);
	        XSSFSheet sheet2 = workbook2.getSheetAt(0);

//////////////////////////////////////////////////////////////////////////	        
	        int firstRow1 = sheet1.getFirstRowNum();
		    int lastRow1 = sheet1.getLastRowNum();
		    boolean equalSheets = true;
		    for(int ii=1; ii <= lastRow1; ii++) {
		       
		     //   System.out.println("\n\nComparing Row "+i);
		       
		        XSSFRow row1 = sheet1.getRow(ii);
		        XSSFRow row2 = sheet2.getRow(ii);
		 
		    int firstCell1 = row1.getFirstCellNum();
		    int lastCell1 = row1.getLastCellNum();
		    boolean equalRows = true;
		    
		    // Compare all cells in a row
		    
		    for(int i=13; i < lastCell1; i++) {
		    	final Deduction_Compare data = new Deduction_Compare();
		    	
		    	
		        XSSFCell cell1 = row1.getCell(i);
		        XSSFCell cell2 = row2.getCell(4);
		        XSSFCell cell3 = row2.getCell(i-12);// second excel account number
		        XSSFCell cell4 = row1.getCell(i-12);// first excel account number
		        
		   //     System.out.println(cell1+"    "+cell2);
		        String sell1 = cell1.toString();
		        String sell2 = cell2.toString();
		        String sell3 = cell3.toString();// second excel account number
		        String sell4 = cell4.toString();// first excel account number
		   //     System.out.println(sell3+"    "+sell4);
		   //     String acc_no = sell4.replace(".0", "");
		   //     if(sell3.equals(acc_no)) {
		        double vb = Double.valueOf(sell1)-Double.valueOf(sell2);
		   //     System.out.println("Difference  :"+sell3+" "+sell1+" "+" "+sell2+" "+vb);

		        data.setAccountnumber(""+sell3);
		        data.setMonthly_deduction(""+sell1); 
		        data.setBank_deduction(""+sell2);
		        data.setDifference(""+vb);
		        
		        list.add(data);
		  //  	}  
		    }		
		    }
		    
///////////////////////////////////////////////////////////////////////////	        	        
	       
	        //close files
	        excellFile1.close();
	        excellFile2.close();

	}
	catch (Exception e) {
	System.out.println(e);
	}
	return list;
	}
/*
	public static boolean compareTwoSheets(XSSFSheet sheet1, XSSFSheet sheet2) {
	    int firstRow1 = sheet1.getFirstRowNum();
	    int lastRow1 = sheet1.getLastRowNum();
	    boolean equalSheets = true;
	    for(int i=1; i <= lastRow1; i++) {
	       
	     //   System.out.println("\n\nComparing Row "+i);
	       
	        XSSFRow row1 = sheet1.getRow(i);
	        XSSFRow row2 = sheet2.getRow(i);
	        if(!compareTwoRows(row1, row2)) {
	            equalSheets = false;
	         //   System.out.println("Row "+i+" - Not Equal");
	            break;
	        } else {
	       //     System.out.println("Row "+i+" - Equal");
	        }
	    }
	    return equalSheets;
	}

	// Compare Two Rows
	public static boolean compareTwoRows(XSSFRow row1, XSSFRow row2) {
	    if((row1 == null) && (row2 == null)) {
	        return true;
	    } else if((row1 == null) || (row2 == null)) {
	        return false;
	    }
	   
	    int firstCell1 = row1.getFirstCellNum();
	    int lastCell1 = row1.getLastCellNum();
	    boolean equalRows = true;
	   
	    // Compare all cells in a row
	    List<Deduction_Compare> list = new ArrayList<Deduction_Compare>();
	    JavaBeans beans = new JavaBeans();
	    for(int i=12; i < lastCell1; i++) {
	    	final Deduction_Compare data = new Deduction_Compare();
	        XSSFCell cell1 = row1.getCell(i);
	        XSSFCell cell2 = row2.getCell(i-1);
	    //    System.out.println(cell1+"    "+cell2);
	        String sell1 = cell1.toString();
	        String sell2 = cell2.toString();
	        double vb = Double.valueOf(sell1)-Double.valueOf(sell2);
	        System.out.println("Difference  :"+cell1+" "+" "+cell2+" "+vb);
//	        if(!compareTwoCells(cell1, cell2)) {
//	            equalRows = false;
//	            System.err.println("       Cell "+i+" - NOt Equal  ");
//	         //   break;
//	        } else {
//	            System.out.println("       Cell-- "+i+" - Equal");
//	        }
	        
	        data.setMonthly_deduction(""+cell1); 
	        data.setBank_deduction(""+cell2);
	        data.setDifference(""+vb);
	        
	        list.add(data);
	        
	    }
	    beans.setDeduction_compare(list);
	 //   List<Deduction_Compare> deduction_compare = beans.getDeduction_compare();
	    
	    return equalRows;
	}
*/
	// Compare Two Cells
	public static boolean compareTwoCells(XSSFCell cell1, XSSFCell cell2) {
	    if((cell1 == null) && (cell2 == null)) {
	        return true;
	    } else if((cell1 == null) || (cell2 == null)) {
	        return false;
	    }
	   
	    boolean equalCells = false;
	    int type1 = cell1.getCellType();
	    int type2 = cell2.getCellType();
	    if (type1 == type2) {
	        if (cell1.getCellStyle().equals(cell2.getCellStyle())) {
	            // Compare cells based on its type
	            switch (cell1.getCellType()) {
	            case HSSFCell.CELL_TYPE_FORMULA:
	                if (cell1.getCellFormula().equals(cell2.getCellFormula())) {
	                    equalCells = true;
	                }
	                break;
	            case HSSFCell.CELL_TYPE_NUMERIC:
	                if (cell1.getNumericCellValue() == cell2
	                        .getNumericCellValue()) {
	                    equalCells = true;
	                }
	                break;
	            case HSSFCell.CELL_TYPE_STRING:
	                if (cell1.getStringCellValue().equals(cell2
	                        .getStringCellValue())) {
	                    equalCells = true;
	                }
	                break;
	            case HSSFCell.CELL_TYPE_BLANK:
	                if (cell2.getCellType() == HSSFCell.CELL_TYPE_BLANK) {
	                    equalCells = true;
	                }
	                break;
	            case HSSFCell.CELL_TYPE_BOOLEAN:
	                if (cell1.getBooleanCellValue() == cell2
	                        .getBooleanCellValue()) {
	                    equalCells = true;
	                }
	                break;
	            case HSSFCell.CELL_TYPE_ERROR:
	                if (cell1.getErrorCellValue() == cell2.getErrorCellValue()) {
	                    equalCells = true;
	                }
	                break;
	            default:
	                if (cell1.getStringCellValue().equals(
	                        cell2.getStringCellValue())) {
	                    equalCells = true;
	                }
	                break;
	            }
	        } else {
	            return false;
	        }
	    } else {
	        return false;
	    }
	    return equalCells;
	}


	@Override
	public List<Dividend> GetAllDividendDetails(String share_interest, String deposit_interest) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          final Query query = (Query)session.createNativeQuery("Select sh.accountnumber, sh.fullname, sh.totalamountofsahre, md.m_deposit FROM share sh INNER JOIN monthlydeposit md ON sh.accountnumber = md.accountnumber ");
          
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Dividend> list = new ArrayList<Dividend>();
            for (final Object[] res : result) {
                final Dividend data = new Dividend();
               
                data.setAccountnumber(res[0].toString());              
                data.setFullname(res[1].toString());
                data.setShare_total(res[2].toString());
                data.setMonthly_deposit_total(res[3].toString());
                
                double share_dividend = Double.parseDouble(res[2].toString())*Double.parseDouble(share_interest)/100;
                data.setShare_dividend(String.valueOf(share_dividend));
                
                double monthly_deposit_dividend = Double.parseDouble(res[3].toString())*Double.parseDouble(deposit_interest)/100;
                data.setMonthly_deposit_dividend(String.valueOf(monthly_deposit_dividend));
                
                double total_dividend = share_dividend + monthly_deposit_dividend;
                data.setTotal_dividend(String.valueOf(total_dividend));
                                       
            //   System.out.println(res[0].toString()+"  "+res[1].toString()+"  "+res[2].toString()+"  "+res[3].toString());
                
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public String FindAllDividendInterestInformation() {
		Session session = null;
		String string = "";
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("Select share_interest, monthly_deposit_interest from dividend_interest");
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            
            for (final Object[] res : result) {
                
                String share_interest = res[0].toString();
                String monthly_deposit_interest = res[1].toString();
              
                string = share_interest+":"+monthly_deposit_interest;
            }           
            return string;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<Trans_Share> Share_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(date,'') as dat, IFNULL(shareallot,0) as shareal, IFNULL(totalamountofshare,0) as totalamount FROM trans_share WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(date,'') as dat, IFNULL(shareallot,0) as shareal, IFNULL(totalamountofshare,0) as totalamount FROM trans_share WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }   
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Trans_Share> list = new ArrayList<Trans_Share>();
            for (final Object[] res : result) {
                final Trans_Share data = new Trans_Share();
               							
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setDate(res[2].toString());
                data.setShareallot(res[3].toString());
                data.setTotalamountofshare(res[4].toString());              
               
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<TransInsurance> Insurance_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(date,'') as dat, IFNULL(insdebt,0) as insd, IFNULL(totalinsuranceamount,0) as totalins FROM trans_insurance WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(date,'') as dat, IFNULL(insdebt,0) as insd, IFNULL(totalinsuranceamount,0) as totalins FROM trans_insurance WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<TransInsurance> list = new ArrayList<TransInsurance>();
            for (final Object[] res : result) {
                final TransInsurance data = new TransInsurance();
             					
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setDate(res[2].toString());
                data.setInsdebt(res[3].toString());
                data.setTotalinsuranceamount(res[4].toString());              
             
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<Trans_MonthlyDeposit> Monthly_Deposit_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(m_debit,0) as m_deb, IFNULL(m_deposit,0) as m_depo, IFNULL(cdate,'') as cdat FROM trans_monthlydeposit WHERE cdate BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(m_debit,0) as m_deb, IFNULL(m_deposit,0) as m_depo, IFNULL(cdate,'') as cdat FROM trans_monthlydeposit WHERE cdate BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc");
        } 
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Trans_MonthlyDeposit> list = new ArrayList<Trans_MonthlyDeposit>();
            for (final Object[] res : result) {
                final Trans_MonthlyDeposit data = new Trans_MonthlyDeposit();
               						
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setCdate(res[4].toString()); 
                data.setM_debit(res[2].toString());
                data.setM_deposit(res[3].toString());
                                           
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<FixedDeposite> FD_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(fdamount,0) as fda, IFNULL(fddate,'') as fddat, IFNULL(maturingdate,'') as maturingd, IFNULL(totalamount,0) as totalam, IFNULL(status,'') as stat FROM fixeddeposite WHERE fddate BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(fdamount,0) as fda, IFNULL(fddate,'') as fddat, IFNULL(maturingdate,'') as maturingd, IFNULL(totalamount,0) as totalam, IFNULL(status,'') as stat FROM fixeddeposite WHERE fddate BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<FixedDeposite> list = new ArrayList<FixedDeposite>();
            for (final Object[] res : result) {
                final FixedDeposite data = new FixedDeposite();
              
            	   data.setAccountnumber(res[0].toString());
                   data.setFullname(res[1].toString());
                   data.setFdamount(res[2].toString());
                   data.setFddate(res[3].toString());
                   data.setMaturingdate(res[4].toString());  
                   data.setTotalamount(res[5].toString()); 
                   data.setStatus(res[6].toString());
				                       
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<RecurringDeposit> RD_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(rdamount,0) as rda, IFNULL(rddate,'') as rdd, IFNULL(totalamount,0) as totalam FROM rd WHERE rdamount>0 AND rddate BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, IFNULL(rdamount,0) as rda, IFNULL(rddate,'') as rdd, IFNULL(totalamount,0) as totalam FROM rd WHERE rdamount>0 AND rddate BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<RecurringDeposit> list = new ArrayList<RecurringDeposit>();
            for (final Object[] res : result) {
                final RecurringDeposit data = new RecurringDeposit();
             
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setRdamount(Double.valueOf(res[2].toString()));
                data.setRddate(res[3].toString());                
                data.setTotalamount(res[4].toString());  
              
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<Loan_Trans> new_loan_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        query = (Query)session.createNativeQuery("Select accountnumber, fullname, date, IFNULL(loanamount,0) as loa, IFNULL(principalamount,0) as princ, IFNULL(intrestamount,0) as intrest, IFNULL(loanbalance,0) as loanb FROM new_loan_trans WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        query = (Query)session.createNativeQuery("Select accountnumber, fullname, date, IFNULL(loanamount,0) as loa, IFNULL(principalamount,0) as princ, IFNULL(intrestamount,0) as intrest, IFNULL(loanbalance,0) as loanb FROM new_loan_trans WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Loan_Trans> list = new ArrayList<Loan_Trans>();
            for (final Object[] res : result) {
                final Loan_Trans data = new Loan_Trans();
         
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setDate(res[2].toString());
                data.setLoanamount(res[3].toString());
                data.setPrincipalamount(res[4].toString());
                data.setIntrestamount(res[5].toString());
                data.setLoanbalance(res[6].toString());
       
                list.add(data);               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
	@Override
	public List<Loan_Closed> new_loan_close_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, date, balanceloan, intrestamount, paidamount FROM closed_loan WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, date, balanceloan, intrestamount, paidamount FROM closed_loan WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Loan_Closed> list = new ArrayList<Loan_Closed>();
            for (final Object[] res : result) {
                final Loan_Closed data = new Loan_Closed();
              try {
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setDate(res[2].toString());
                data.setBalanceloan(res[3].toString());
                data.setIntrestamount(res[4].toString());
                data.setPaidamount(res[5].toString());               
               } catch (Exception e) {
   			//	System.out.println(e);
   			}
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public List<Emergency_Loan_Close> emergency_loan_close_Report_Details(String accountnumber, String sdate,
			String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, date1, balanceloan, interestamount, paidamount FROM emergency_closed_loan WHERE date1 BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, date1, balanceloan, interestamount, paidamount FROM emergency_closed_loan WHERE date1 BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Emergency_Loan_Close> list = new ArrayList<Emergency_Loan_Close>();
            for (final Object[] res : result) {
                final Emergency_Loan_Close data = new Emergency_Loan_Close();
              try {
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setDate1(res[2].toString());
                data.setBalanceloan(res[3].toString());
                data.setInterestamount(res[4].toString());
                data.setPaidamount(res[5].toString());               
               } catch (Exception e) {
   			//	System.out.println(e);
   			}
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<EmeregencyLoanTrans> emergency_loan_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, date, IFNULL(loanamount,0) as loa, IFNULL(eloanbalance,0) as eloanb, IFNULL(e_principalamount,0) as e_princ, IFNULL(e_intrestamount,0) as e_intrest FROM emergency_loan_trans WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, date, IFNULL(loanamount,0) as loa, IFNULL(eloanbalance,0) as eloanb, IFNULL(e_principalamount,0) as e_princ, IFNULL(e_intrestamount,0) as e_intrest FROM emergency_loan_trans WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<EmeregencyLoanTrans> list = new ArrayList<EmeregencyLoanTrans>();
            for (final Object[] res : result) {
                final EmeregencyLoanTrans data = new EmeregencyLoanTrans();
               try {
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setDate(res[2].toString());
                data.setLoanamount(res[3].toString());
                data.setEloanbalance(res[4].toString());
                data.setE_principalamount(res[5].toString());
                data.setE_intrestamount(res[6].toString());
               } catch (Exception e) {
   			//	System.out.println(e);
   			}
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public List<Cancel_Member> cancel_member_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, date, reason, IFNULL(shares,0) as sha, IFNULL(fd,0) as fdd, IFNULL(insurance,0) as ins, IFNULL(percentamount,0) as percen, IFNULL(rd,0) as rdd, IFNULL(totalregularloan,0) as totalreg, IFNULL(intrestregularloan,0) as intrestreg, IFNULL(totalemerloan,0) as totalemer, IFNULL(intrestonemerloan,0) as intrestonemer, IFNULL(monthlydeposit,0) as monthlydep, IFNULL(payableamount,0) as payableamo FROM cancel_membership WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, date, reason, IFNULL(shares,0) as sha, IFNULL(fd,0) as fdd, IFNULL(insurance,0) as ins, IFNULL(percentamount,0) as percen, IFNULL(rd,0) as rdd, IFNULL(totalregularloan,0) as totalreg, IFNULL(intrestregularloan,0) as intrestreg, IFNULL(totalemerloan,0) as totalemer, IFNULL(intrestonemerloan,0) as intrestonemer, IFNULL(monthlydeposit,0) as monthlydep, IFNULL(payableamount,0) as payableamo FROM cancel_membership WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Cancel_Member> list = new ArrayList<Cancel_Member>();
            for (final Object[] res : result) {
                final Cancel_Member data = new Cancel_Member();
               
                data.setAccountnumber(res[0].toString());
                data.setFullname(res[1].toString());
                data.setDate(res[2].toString());
                data.setReason(res[3].toString());
                data.setShares(res[4].toString());
                data.setFd(res[5].toString());
                data.setInsurance(res[6].toString());
                data.setPercentamount(res[7].toString());
                data.setRd(res[8].toString());
                data.setTotalregularloan(res[9].toString());
                data.setIntrestregularloan(res[10].toString());
                data.setTotalemerloan(res[11].toString());
                data.setIntrestonemerloan(res[12].toString());
                data.setMonthlydeposit(res[13].toString());
                data.setPayableamount(res[14].toString());
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<Dead_Member> dead_member_Report_Details(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        final Query query;
        if(accountnumber.equals("")) {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, dateofdeath, IFNULL(shares,0) as sha, IFNULL(fd,0) as fdd, IFNULL(insurance,0) as ins, IFNULL(percentamount,0) as percen, IFNULL(rd,0) as rdd, IFNULL(totalregularloan,0) as totalreg, IFNULL(intrestregularloan,0) as intrestreg, IFNULL(totalemerloan,0) as totalemer, IFNULL(intrestonemerloan,0) as intrestonemer, IFNULL(monthlydeposit,0) as monthlydep, IFNULL(payableamount,0) as payableamo FROM deadmembers WHERE dateofdeath BETWEEN '"+sdate+"' AND '"+edate+"' order by accountnumber asc ");
        }else {
        	query = (Query)session.createNativeQuery("Select accountnumber, fullname, dateofdeath, IFNULL(shares,0) as sha, IFNULL(fd,0) as fdd, IFNULL(insurance,0) as ins, IFNULL(percentamount,0) as percen, IFNULL(rd,0) as rdd, IFNULL(totalregularloan,0) as totalreg, IFNULL(intrestregularloan,0) as intrestreg, IFNULL(totalemerloan,0) as totalemer, IFNULL(intrestonemerloan,0) as intrestonemer, IFNULL(monthlydeposit,0) as monthlydep, IFNULL(payableamount,0) as payableamo FROM deadmembers WHERE dateofdeath BETWEEN '"+sdate+"' AND '"+edate+"' AND accountnumber='"+accountnumber+"' order by accountnumber asc ");
        }
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Dead_Member> list = new ArrayList<Dead_Member>();
            for (final Object[] res : result) {
                final Dead_Member data = new Dead_Member();
               
            	   data.setAccountnumber(res[0].toString());
                   data.setFullname(res[1].toString());
                   data.setDateofdeath(res[2].toString());                  
                   data.setShares(res[3].toString());
                   data.setFd(res[4].toString());
                   data.setInsurance(res[5].toString());
                   data.setPercentamount(res[6].toString());
                   data.setRd(res[7].toString());
                   data.setTotalregularloan(res[8].toString());
                   data.setIntrestregularloan(res[9].toString());
                   data.setTotalemerloan(res[10].toString());
                   data.setIntrestonemerloan(res[11].toString());
                   data.setMonthlydeposit(res[12].toString());
                   data.setPayableamount(res[13].toString());
                   
                 //  System.out.println(res[0].toString()+"    "+res[1].toString()+"    "+res[12].toString());
            
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	@Transactional
	public String DeleteCancelMemberDetails(String accountnumber) {
		// TODO Auto-generated method stub
		try {			
		
		AMR.deleteAddMemberByAccountNumber(accountnumber);
		
		sharerepo.deleteShareByAccountNumber(accountnumber);		
		TSR.deleteTransShareByAccountNumber(accountnumber);
		
		INSRepo.deleteInsuranceByAccountNumber(accountnumber);
		TIR.deleteTransInsuranceByAccountNumber(accountnumber);
		
		MDR.deleteMonthlyDepositByAccountNumber(accountnumber);
		TMDR.deleteTrans_MonthlyDepositByAccountNumber(accountnumber);
		
		LR.deleteLoanByAccountNumber(accountnumber);
		LTR.deleteLoan_TransByAccountNumber(accountnumber);
		
		ELR.deleteEmergencyLoanByAccountNumber(accountnumber);
		ELTR.deleteEmeregencyLoanTransByAccountNumber(accountnumber);
		
		FD.deleteFixedDepositeByAccountNumber(accountnumber);
		
		RDR.deleteRecurringDepositByAccountNumber(accountnumber);
		RDNR.deleteNewRecurringDepositByAccountNumber(accountnumber);
		
		} catch (Exception e) {
			System.out.println("Delete Member : "+e);
		}
		
		return "Success";
	}

	//deduction operation
	 @Override
	 @Transactional
	 public String GenerateMonthlyDeductionShare(String AccountNumber, String FulName,String date) {
	 HashMap<String,Set<String>> FailExecuteAccountNumber = JavaBeans.getFailExecuteAccountNumber();
	 Set<String> TableNames = new HashSet<String>();
	 Session session = null;
	      //  int modifications = 0;
	        String status = "Close";
	        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
	            throw new NullPointerException();
	        }
	      //share
	        try {
	                   final Query query1 = (Query)session.createNativeQuery("INSERT INTO trans_share (accountnumber,fullname,date,shareallot,totalamountofshare)SELECT accountnumber,fullname,'"+date+"',shareallot,SUM(totalamountofsahre + shareallot) FROM share WHERE accountnumber = '"+AccountNumber+"'");
	                   int ReturnDB = query1.executeUpdate();
	       if (ReturnDB != 1) {
	       TableNames.add("trans_share");
	          FailExecuteAccountNumber.put(AccountNumber,TableNames);
	       }
	       }
	       catch (Exception e) {
	       e.printStackTrace();
	       TableNames.add("trans_share");
	       FailExecuteAccountNumber.put(AccountNumber,TableNames);
	       }
	              
	               //share
	               try
	               {
	               final Query query = (Query)session.createNativeQuery("update share set totalamountofsahre = shareallot + totalamountofsahre, date = '"+date+"' where accountnumber = '"+AccountNumber+"'");
	               int  modifications = query.executeUpdate();
	                     if (modifications != 1) {
	                     TableNames.add("share");
	                        FailExecuteAccountNumber.put(AccountNumber,TableNames);
	                     }
	               }
	               catch (Exception e) {
	               TableNames.add("share");
	                   FailExecuteAccountNumber.put(AccountNumber,TableNames);
	       }

	        
	        
	        
	        
	        return "Success";
	 }


	 @Override
	 @Transactional
	 public String GenerateMonthlyDeductionMonthlyDeposite(String AccountNumber, String FulName,String date) {
	 HashMap<String,Set<String>> FailExecuteAccountNumber = JavaBeans.getFailExecuteAccountNumber();
	 Set<String> TableNames = new HashSet<String>();
	 Session session = null;
	      //  int modifications = 0;
	        String status = "Close";
	        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
	            throw new NullPointerException();
	        }
	      //trans monthlydeposite
	        try {
	            final Query query1 = (Query)session.createNativeQuery("INSERT INTO trans_monthlydeposit (accountnumber,fullname,cdate,m_debit,m_deposit)SELECT accountnumber,fullname,'"+date+"',m_debit,SUM(m_deposit + m_debit) FROM monthlydeposit WHERE accountnumber = '"+AccountNumber+"'");
	       int ReturnDB = query1.executeUpdate();
	 if (ReturnDB != 1) {
	 TableNames.add("trans_monthlydeposit");
	    FailExecuteAccountNumber.put(AccountNumber,TableNames);
	 }
	 }
	 catch (Exception e) {
	 e.printStackTrace();
	 TableNames.add("trans_monthlydeposit");
	 FailExecuteAccountNumber.put(AccountNumber,TableNames);
	 }
	        //monthlydeposit
	        try
	        {
	         final Query query = (Query)session.createNativeQuery("update monthlydeposit set m_deposit = m_deposit + m_debit ,cdate = '"+date+"' where accountnumber = '"+AccountNumber+"'");
	         int  modifications = query.executeUpdate();
	              if (modifications != 1) {
	               TableNames.add("monthlydeposit");
	                 FailExecuteAccountNumber.put(AccountNumber,TableNames);
	              }
	        }
	        catch (Exception e) {
	         TableNames.add("monthlydeposit");
	            FailExecuteAccountNumber.put(AccountNumber,TableNames);
	 }
	        
	        
	 return "Success";
	 }


	 @Override
	 @Transactional
	 public String GenerateMonthlyDeductionMonthlyRD(String AccountNumber, String FulName,String date) {

	 HashMap<String,Set<String>> FailExecuteAccountNumber = JavaBeans.getFailExecuteAccountNumber();
	 Set<String> TableNames = new HashSet<String>();
	 Session session = null;
	      //  int modifications = 0;
	        String status = "Close";
	        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
	            throw new NullPointerException();
	        }
	      //rd
	        String TotalAmount1 = RDNR.findSumOfRdTotalAmount(AccountNumber);
	        String rd_status = RDNR.findStatusOfRd(AccountNumber);
	     if((TotalAmount1 != null) && (rd_status.equals("start")))
	    {
	        try
	        {        
	         final Query query = (Query)session.createNativeQuery("update new_rd set totamt = rdamt + totamt where accno = '"+AccountNumber+"' ");
	         int  modifications = query.executeUpdate();
	              if (modifications < 1) {
	               TableNames.add("new_rd");
	                 FailExecuteAccountNumber.put(AccountNumber,TableNames);
	              }
	        }
	        catch (Exception e) {
	         TableNames.add("new_rd");
	            FailExecuteAccountNumber.put(AccountNumber,TableNames);
	 }
	      //trans rd          
	        try {
	          /*  Date date = new Date();
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	            String str = formatter.format(date);*/
	            String TotalAmount = RDNR.findSumOfRdTotalAmount(AccountNumber);
	            String TotalRDAmount = RDNR.findSumOfRdAmount(AccountNumber);
	            RecurringDeposit RD = new RecurringDeposit();
	            RD.setAccountnumber(AccountNumber);
	            RD.setFullname(FulName);
	            RD.setRdamount(Double.parseDouble(TotalAmount));
	            RD.setTotalamount(TotalRDAmount);
	            RD.setRddate(date);
	            RDR.save(RD);
	          
	    }
	    catch (Exception e) {
	    e.printStackTrace();
	    TableNames.add("rd");
	    FailExecuteAccountNumber.put(AccountNumber,TableNames);
	    }
	        
	    }
	    


	        
	        

	 return "Success";
	 }


	 @Override
	 @Transactional
	 public String GenerateMonthlyDeductionMonthlyRDTrans(String AccountNumber, String FulName,String TotalAmount,String TotalRDAmount,String date) {
	 HashMap<String,Set<String>> FailExecuteAccountNumber = JavaBeans.getFailExecuteAccountNumber();
	 Set<String> TableNames = new HashSet<String>();
	 Session session = null;
	      //  int modifications = 0;
	        String status = "Close";
	        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
	            throw new NullPointerException();
	        }
	 //trans rd
	      
	        try {
	           /* Date date = new Date();
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	            String str = formatter.format(date);
	          */
	            RecurringDeposit RD = new RecurringDeposit();
	            RD.setAccountnumber(AccountNumber);
	            RD.setFullname(FulName);
	            RD.setRdamount(Double.parseDouble(TotalRDAmount));
	            RD.setTotalamount(TotalAmount);
	            RD.setRddate(date);
	            RDR.save(RD);
	          
	    }
	    catch (Exception e) {
	    e.printStackTrace();
	    TableNames.add("rd");
	    FailExecuteAccountNumber.put(AccountNumber,TableNames);
	    }

	    


	 return "Success";
	 }


	 @Override
	 @Transactional
	 public String GenerateMonthlyDeductionMonthlyLoan(String AccountNumber, String FulName,String date) {
	 HashMap<String,Set<String>> FailExecuteAccountNumber = JavaBeans.getFailExecuteAccountNumber();
	 Set<String> TableNames = new HashSet<String>();
	 Session session = null;
	      //  int modifications = 0;
	        String status = "Close";
	        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
	            throw new NullPointerException();
	        }



	 try {
	        Loan loan = LR.findNewLoanByAccountNumber(AccountNumber);
	        if(loan != null)
	        {
	        Optional<String> temp = Optional.ofNullable(loan.getLoanbalance());
	         // double temp = Double.parseDouble(Eloan.getEloanbalance());
	          
	         String temp2 = temp.orElse("0.0");
	         double temp3 = Double.parseDouble(temp2);
	          if( temp3 > 0.0  )
	          {
	         double newLoanBalance=0;  
	        /* Date date = new Date();
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	            String str = formatter.format(date);
	          */
	            
	            String insuranceamount = INSRepo.findInsuranceByAccountNumber(AccountNumber);
	            String shareamount = sharerepo.findShareByAccountNumber(AccountNumber);
	          //  Loan loan = LR.findNewLoanByAccountNumber(AccountNumber);
	            double InterestAmount = ((Double.parseDouble(loan.getLoanbalance()) * Double.parseDouble("11.0"))/1200);
	            if(Double.parseDouble(loan.getLoanbalance()) >= Double.parseDouble(loan.getPrincipalamount())){
	             newLoanBalance = Double.parseDouble(loan.getLoanbalance()) - Double.parseDouble(loan.getPrincipalamount());
	            }else {
	             newLoanBalance = 0;
	            }
	           // final Query query1 = (Query)session.createNativeQuery("INSERT INTO new_loan_trans (accountnumber,fullname,date,principalamount,interestamount,insurance,share,loanbalance)SELECT accno,name,curdate(),rdamt,SUM(totamt + rdamt) FROM new_rd WHERE accno = '"+AccountNumber+"'");
	           //int ReturnDB = query1.executeUpdate();
	          
	 Loan_Trans loansendvalue = new Loan_Trans();
	 loansendvalue.setAccountnumber(AccountNumber);
	 loansendvalue.setFullname(loan.getFullname());
	 loansendvalue.setDate(date);
	 loansendvalue.setPrincipalamount(loan.getPrincipalamount());
	 loansendvalue.setIntrestamount(Double.toString(InterestAmount));
	 loansendvalue.setLoanbalance(Double.toString(newLoanBalance));
	 loansendvalue.setInsurance(insuranceamount);
	 loansendvalue.setShare(shareamount);
	 loansendvalue.setEmi(Double.toString(InterestAmount + Double.parseDouble(loan.getPrincipalamount())));
	 loansendvalue = LTR.save(loansendvalue);
	      
	       if (loansendvalue == null) {
	 TableNames.add("new_loan_trans");
	    FailExecuteAccountNumber.put(AccountNumber,TableNames);
	 }
	      
	      //new loan
	    
	     try
	          {
	           loan.setInsurance(insuranceamount);
	           loan.setShare(shareamount);
	           loan.setIntrestamount(Double.toString(InterestAmount));
	           loan.setLoanbalance(Double.toString(newLoanBalance));
	           loan.setDate(date);
	           loan.setEmi(Double.toString(InterestAmount + Double.parseDouble(loan.getPrincipalamount()) ));
	           LR.save(loan);
	          }
	          catch (Exception e) {
	           TableNames.add("new_loan");
	              FailExecuteAccountNumber.put(AccountNumber,TableNames);
	   }  
	    
	    
	    
	      //end
	        }
	 }
	 }
	 catch (Exception e) {
	 e.printStackTrace();
	 TableNames.add("new_loan_trans");
	 FailExecuteAccountNumber.put(AccountNumber,TableNames);
	 }
	      

	 return "Success";
	 }


	 @Override
	 @Transactional
	 public String GenerateMonthlyDeductionMonthlyEmergencyLoan(String AccountNumber, String FulName,String date) {

	 HashMap<String,Set<String>> FailExecuteAccountNumber = JavaBeans.getFailExecuteAccountNumber();
	 Set<String> TableNames = new HashSet<String>();
	 Session session = null;
	      //  int modifications = 0;
	        String status = "Close";
	        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
	            throw new NullPointerException();
	        }



	 try {
	          EmergencyLoan Eloan =   ELR.findELByAccountNumber(AccountNumber);
	          if(Eloan != null)
	          {
	          Optional<String> temp = Optional.ofNullable(Eloan.getEloanbalance());
	         // double temp = Double.parseDouble(Eloan.getEloanbalance());
	          
	         String temp2 = temp.orElse("0.0");
	         double temp3 = Double.parseDouble(temp2);
	          if( temp3 > 0.0  )
	          {
	          
	        /* Date date = new Date();
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	             String str = formatter.format(date);
	       */
	       
	       String insuranceamount = INSRepo.findInsuranceByAccountNumber(AccountNumber);
	       String shareamount = sharerepo.findShareByAccountNumber(AccountNumber);
	      // EmergencyLoan Eloan =   ELR.findELByAccountNumber(AccountNumber);
	       double InterestAmount = ((Double.parseDouble(Eloan.getEloanbalance()) * Double.parseDouble("11.0"))/1200);
	       double newLoanBalance = Double.parseDouble(Eloan.getEloanbalance()) - Double.parseDouble(Eloan.getE_principalamount());
	           // final Query query1 = (Query)session.createNativeQuery("INSERT INTO new_loan_trans (accountnumber,fullname,date,principalamount,interestamount,insurance,share,loanbalance)SELECT accno,name,curdate(),rdamt,SUM(totamt + rdamt) FROM new_rd WHERE accno = '"+AccountNumber+"'");
	       //int ReturnDB = query1.executeUpdate();
	 EmeregencyLoanTrans loansendvalue = new EmeregencyLoanTrans();
	 loansendvalue.setAccountnumber(AccountNumber);
	 loansendvalue.setFullname(Eloan.getFullname());
	 loansendvalue.setDate(date);
	 loansendvalue.setE_principalamount(Eloan.getE_principalamount());
	 loansendvalue.setE_intrestamount(Double.toString(InterestAmount));
	 loansendvalue.setEloanbalance(Double.toString(newLoanBalance));
	 //loansendvalue.sete(insuranceamount);
	 //loansendvalue.setShare(shareamount);
	 loansendvalue.setE_emi(Double.toString(InterestAmount + Double.parseDouble(Eloan.getE_principalamount())));
	 loansendvalue = ELTR.save(loansendvalue);
	      
	       if (loansendvalue == null) {
	 TableNames.add(" emergency_loan_trans");
	    FailExecuteAccountNumber.put(AccountNumber,TableNames);
	 }
	      
	       //new loan
	      
	       try
	           {
	      
	         Eloan.setE_intrestamount(Double.toString(InterestAmount));
	           Eloan.setEloanbalance(Double.toString(newLoanBalance));
	           Eloan.setDate(date);
	           Eloan.setE_emi(Double.toString(InterestAmount + Double.parseDouble(Eloan.getE_principalamount())));
	          
	           ELR.save(Eloan);
	           }
	           catch (Exception e) {
	           TableNames.add("emergency_loan");
	               FailExecuteAccountNumber.put(AccountNumber,TableNames);
	   }  
	      
	       //end
	          }
	 }
	 }
	 catch (Exception e) {
	 e.printStackTrace();
	 TableNames.add("new_loan_trans");
	 FailExecuteAccountNumber.put(AccountNumber,TableNames);
	 }
	 return "Success";
	 }
	
	//end
		
	@Override
	public List<Add_Member> GetAllMemberBirthdayInformation(String bdate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          final Query query = (Query)session.createNativeQuery("Select accountnumber, fullname, dob, mobile FROM add_member where dob LIKE '%"+bdate+"%' ");
          
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Add_Member> list = new ArrayList<Add_Member>();
            for (final Object[] res : result) {
                final Add_Member data = new Add_Member();
            //   try {							
                data.setAccountnumber(res[0].toString()); 
                data.setFullname(res[1].toString());
                data.setDob(res[2].toString());
                data.setMobile(res[3].toString());
                
               // System.out.println(res[0].toString()+"   "+res[1].toString()+"   "+res[2].toString());
                
                list.add(data);              
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public List<Add_Member> GetAllMemberRetiredInformation(String dor) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          final Query query = (Query)session.createNativeQuery("Select accountnumber, fullname, dor, mobile FROM add_member where dor LIKE '%"+dor+"%' ");
          
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Add_Member> list = new ArrayList<Add_Member>();
            for (final Object[] res : result) {
                final Add_Member data = new Add_Member();
            //   try {							
                data.setAccountnumber(res[0].toString()); 
                data.setFullname(res[1].toString());
                data.setDor(res[2].toString());
                data.setMobile(res[3].toString());
                
               // System.out.println(res[0].toString()+"   "+res[1].toString()+"   "+res[2].toString());
                
                list.add(data);              
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public double GetRecurringDepositOfNewUser(String AccountNumber) {
		Session session = null;
		double rd_tot = 0.0;
		String tot_rd = "";
		String status = "";
		  final List<Trans_Share> list = new ArrayList<Trans_Share>();
			if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
			throw new NullPointerException();
			}
			try {
			
			final Query query = (Query)session.createNativeQuery("select accno, sum(rdamt) from new_rd where accno='"+AccountNumber+"' AND status = '"+status+"' ");
			final List<Object[]> result = (List<Object[]>)query.getResultList();
			
			for (final Object[] res : result) {
				  RecurringDepositeNew  ts = new RecurringDepositeNew();
				
				  res[0].toString();
				  tot_rd = res[1].toString();	
				  rd_tot = Double.parseDouble(tot_rd);
			}
			
			}
			catch (Exception e) {	
				System.out.println(e);
					}
		return rd_tot;
	}


	@Override
	@Transactional
	public String UpdateMemberGuantorCount(String guarantor1, String guarantor2) {
		// TODO Auto-generated method stub
		Session session = null;
		System.out.println("Hello update Member Guarantor Count");
        int modifications = 0;
        String status = "close";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update add_member set gcount = gcount + 1 where fullname ='"+guarantor1+"'");   
            final Query query1 = (Query)session.createNativeQuery("update add_member set gcount = gcount + 1 where fullname ='"+guarantor2+"'");
            modifications = query.executeUpdate();   
            modifications = query1.executeUpdate();   
            if (modifications == 1) {
                return "Success";
            }
            return "Success";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Success";
        }
	}


	@Override
	@Transactional
	public String UpdateMemberGuantorCountLess(String guarantor1, String guarantor2) {
		// TODO Auto-generated method stub
		Session session = null;
		System.out.println("Hello update Member Guarantor Count");
        int modifications = 0;
        String status = "close";
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update add_member set gcount = gcount - 1 where fullname ='"+guarantor1+"'");   
            final Query query1 = (Query)session.createNativeQuery("update add_member set gcount = gcount - 1 where fullname ='"+guarantor2+"'");
            modifications = query.executeUpdate();   
            modifications = query1.executeUpdate();   
            if (modifications == 1) {
                return "Success";
            }
            return "Success";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Success";
        }
	}


	@Override
	@Transactional
	public String GenerateMonthlyDeductionInsurance(String AccountNumber, String FulName,String date) {
		HashMap<String,Set<String>> FailExecuteAccountNumber = JavaBeans.getFailExecuteAccountNumber();
		Set<String> TableNames = new HashSet<String>();
		Session session = null;
		      //  int modifications = 0;
		        String status = "Close";
		        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
		            throw new NullPointerException();
		        }
		       
		        ///trans insurance
		        try {
		                final Query query1 = (Query)session.createNativeQuery("INSERT INTO trans_insurance (accountnumber,fullname,date,insdebt,totalinsuranceamount)SELECT accountnumber,fullname,'"+date+"',insdebt,SUM(totalinsuranceamount + insdebt) FROM insuranceform WHERE accountnumber = '"+AccountNumber+"'");
		                int ReturnDB = query1.executeUpdate();
		            if (ReturnDB != 1) {
		            TableNames.add("trans_insurance");
		                FailExecuteAccountNumber.put(AccountNumber,TableNames);

		       
		            }
		           }
		        catch (Exception e) {
		            e.printStackTrace();
		            TableNames.add("trans_insurance");
		            FailExecuteAccountNumber.put(AccountNumber,TableNames);
		        }
		       
		        //insurance
		        try
		        {
		        final Query query = (Query)session.createNativeQuery("update insuranceform set totalinsuranceamount = insdebt + totalinsuranceamount, date = '"+date+"'where accountnumber = '"+AccountNumber+"'");
		        int modifications = query.executeUpdate();
		              if (modifications != 1) {
		              TableNames.add("insuranceform");
		                 FailExecuteAccountNumber.put(AccountNumber,TableNames);
		              }
		        }
		        catch (Exception e) {
		        TableNames.add("insuranceform");
		            FailExecuteAccountNumber.put(AccountNumber,TableNames);
		}
		       
		       
		       
		       
		       
		        //trans share
		       
		       
		       
		       
		        //end
		           //new lon trans hold here
		       
		        //end
		return "Success";
		}


	@Override
	@Transactional
	public Vector<LinkedHashMap<String, String>> GetTerijPatrakInfo(String sdate, String edate) {
		Session session = null;
		Vector<LinkedHashMap<String, String>> TerijPatrakData = new Vector<>();
		LinkedHashMap<String, String> data = new LinkedHashMap();
		LinkedHashMap<String, String> data1 = new LinkedHashMap();
		String[] Arr = {"सभासद भाग वसूल","सभासद ठेव वसूल","सभासद बचत खाते","सभासद कल्याण निधि","सभासद मुदत ठेव खाते","सभासद नियमित कर्ज़ वसूल","सभासद अल्प कर्ज़ वसूल","नियमित कर्ज़ व्याज वसूल","अल्प कर्ज़ व्याज वसूल"}; 
		String[] Arr1 = {"सभासद भाग वसूल","सभासद ठेव वसूल","सभासद नि. कर्ज वाटप","सभासद आ. कर्ज वाटप","सभासद मुदत ठेवखाते","सभासद कल्याण निधी"}; 
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        
        //LHS Record Teripatrak
        final Query query1 = (Query)session.createNativeQuery("select sum(shareallot) from trans_share  where date between '"+sdate+"' and '"+edate+"' union select sum(m_debit) from trans_monthlydeposit  where cdate between '"+sdate+"' and '"+edate+"' union select sum(rdamount) from rd where rddate between '"+sdate+"' and '"+edate+"'  union select sum(insdebt) from trans_insurance where date between '"+sdate+"' and '"+edate+"'  union select sum(fdamount) from fixeddeposite where fddate between '"+sdate+"' and '"+edate+"' union select sum(principalamount) from new_loan_trans where date between '"+sdate+"' and '"+edate+"' union select sum(e_principalamount) from emergency_loan_trans where date between '"+sdate+"' and '"+edate+"' union select sum(intrestamount) from new_loan_trans where date between '"+sdate+"' and '"+edate+"' union select sum(e_intrestamount) from emergency_loan_trans where date between '"+sdate+"' and '"+edate+"'");
        // final Query query = (Query)session.createNativeQuery("select party_name,amount from thirdpartypayment where party_name IN ('कर्मचारी व्यवसाय कर खाते','कर्मचारी भविष्य निधि','देनगी खाते','दिवाली अग्रिम','सभासद प्रवेश फीस',' झेरॉक्स  विभाग निव्वल ऩफा','कर्मचारी अधिलाभांश','संशयित बुडित निधि','ऑडिट फीस','इनकम टॅक्स परत','डेड़स्टॊक झीज','झेरॉक्स मशीन झीज फंड','इनकम टॅक्स भरणा','प्रशिक्षण निधी','इनकम टॅक्स फीस','डिजिटल स्वाक्षरी','जी एस टी शुल्क','किरकोळ खर्च','इनकम टॅक्स रिटर्न', 'झेरॉक्स झीज')");
         try {
        int count = 0;
             final List<Object> result = (List<Object>)query1.getResultList();
          
           
             
             for (final Object res : result) {
                
        
                 data.put(Arr[count], res.toString());
               count++;
                 
                          
             }
             
            
         }
          catch (Exception e) {
             e.printStackTrace();
            
         }
        
        
         
        
          //final Query query = (Query)session.createNativeQuery("select party_name,amount from thirdpartypayment where party_name IN ('कर्मचारी भविष्य निधि','बॅंक करंट खाते')");
        final Query query = (Query)session.createNativeQuery("select party_name,amount from thirdpartypayment where party_name IN ('आरंभिची  शिल्लक','कर्मचारी व्यवसाय कर खाते' ,'कर्मचारी भविष्य नि. निधी ', 'कर्मचारी कल्याण निधी ','बँक करंट खाते ','देणगी खाते ','दिवाळी अग्रीम ','गंगाजळी खाते (बँक व्याज )','गंगाजळी खाते ','झेरॉक्स विभागअनामत ','सभासद लाभांश ' ,'कर्मचारी अधिलाभांश ','संशियत बुडीत निधी ',\r\n" + 
        		"'एम.जी.बी.लोन','स. ठेवव्याज','मु. ठेवव्याज','बचत ठेवव्याज','विद्यापीठ ठेव व्याज','सकल कल्याणनिधी','ऑडिट फीस','प्रशीक्षण निधी','डेडस्टॉक झीज','एकून')");
        try {
       
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Add_Member> list = new ArrayList<Add_Member>();
            for (final Object[] res : result) {
               
       
                data.put(res[0].toString(), res[1].toString());
              
                
                         
            }
            
            
        }
        catch (Exception e) {
            e.printStackTrace();
           
        }
        
        
        
        //RHS Record Terij patrak
        
        
        final Query queryRHS1 = (Query)session.createNativeQuery("select sum(shares) from cancel_membership  where date between '"+sdate+"' and '"+edate+"' union select sum(monthlydeposit) from cancel_membership  where date between '"+sdate+"' and '"+edate+"'  union  select sum(loanamount) from new_loan where date between '"+sdate+"' and '"+edate+"' union select sum(loanamount) from emergency_loan where date between '"+sdate+"' and '"+edate+"' union select sum(fd) from cancel_membership where date between '"+sdate+"' and '"+edate+"' union select sum(insurance) from cancel_membership where date between '"+sdate+"' and '"+edate+"' ");
        // final Query query = (Query)session.createNativeQuery("select party_name,amount from thirdpartypayment where party_name IN ('कर्मचारी व्यवसाय कर खाते','कर्मचारी भविष्य निधि','देनगी खाते','दिवाली अग्रिम','सभासद प्रवेश फीस',' झेरॉक्स  विभाग निव्वल ऩफा','कर्मचारी अधिलाभांश','संशयित बुडित निधि','ऑडिट फीस','इनकम टॅक्स परत','डेड़स्टॊक झीज','झेरॉक्स मशीन झीज फंड','इनकम टॅक्स भरणा','प्रशिक्षण निधी','इनकम टॅक्स फीस','डिजिटल स्वाक्षरी','जी एस टी शुल्क','किरकोळ खर्च','इनकम टॅक्स रिटर्न', 'झेरॉक्स झीज')");
         try {
        int count = 0;
             final List<Object> result = (List<Object>)queryRHS1.getResultList();
          
           
             
             for (final Object res : result) {
                
        
                 data1.put(Arr1[count], res.toString());
               count++;
                 
                          
             }
             
            
         }
          catch (Exception e) {
             e.printStackTrace();
            
         }
        
        
        
        
        
        final Query queryRHS2 = (Query)session.createNativeQuery("select party_name , amount from thirdpartypayment where party_name IN ('बॅंक करेंटखाते','स. कल्याणनिधीव्याज','कर्मचारी पगार खाते',' बचत ठेव व्याज','कर्मचारी भ. निधी','बॅंक कमिशन','ऑडिट फीस','लाभांश वाटप','ठेव व्याज वाटप','प्रशीक्षण निधी','स.  ठेवव्याज','दिवाळी अग्रीम','कर्मचारी आधीलाभांश','किरकोळ खर्च','एम. जी. बी. लोन','नफा तोटा खाते','मानधन खर्च','गंगाजळी खाते (बँक व्याज )','सभासद बचत खाते','एम. जि. बी. व्याज','स. कर्ज व्याज','निवडणूक अनमत','स. ठेव व्याज खाते','मुदत ठेव व्याज ','बचत ठेव व्याज','विद्यापीठ ठेव व्याज','सभासद कल्याण निधी','ऑडिट फीस','प्रशीक्षण निधी','डेडस्टॉक झीज','एकून')");
        try {
       
            final List<Object[]> result = (List<Object[]>)queryRHS2.getResultList();
            final List<Add_Member> list = new ArrayList<Add_Member>();
            for (final Object[] res : result) {
               
       
            	data1.put(res[0].toString(), res[1].toString());
              
                
                         
            }
            
            
        }
        catch (Exception e) {
            e.printStackTrace();
           
        }
        
        TerijPatrakData.add(data);
        TerijPatrakData.add(data1);
        
        
        return TerijPatrakData;
		
	}


	@Override
	@Transactional
	public Vector<LinkedHashMap<String, String>> GetNAfaTotaPatrakInfo(String sdate, String edate) {
	
		Session session = null;
		Vector<LinkedHashMap<String, String>> TerijPatrakData = new Vector<>();
		LinkedHashMap<String, String> data = new LinkedHashMap();
		LinkedHashMap<String, String> data1 = new LinkedHashMap();
		String[] Arr = {"सभासद मुदत ठेव व्याज","सभासद बचत ठेव व्याज","सभासद कल्याण निधि"}; 
		String[] Arr1 = {"कर्ज़ व्याज वसूल"}; 
		
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        
        //LHS Record Teripatrak
        final Query query1 = (Query)session.createNativeQuery("select sum(shareallot) from trans_share  where date between '"+sdate+"' and '"+edate+"' union select sum(m_debit) from trans_monthlydeposit  where cdate between '"+sdate+"' and '"+edate+"' union select sum(rdamount) from rd where rddate between '"+sdate+"' and '"+edate+"'  union select sum(insdebt) from trans_insurance where date between '"+sdate+"' and '"+edate+"'  union select sum(fdamount) from fixeddeposite where fddate between '"+sdate+"' and '"+edate+"' union select sum(principalamount) from new_loan_trans where date between '"+sdate+"' and '"+edate+"' union select sum(e_principalamount) from emergency_loan_trans where date between '"+sdate+"' and '"+edate+"' union select sum(intrestamount) from new_loan_trans where date between '"+sdate+"' and '"+edate+"' union select sum(e_intrestamount) from emergency_loan_trans where date between '"+sdate+"' and '"+edate+"'");
        // final Query query = (Query)session.createNativeQuery("select party_name,amount from thirdpartypayment where party_name IN ('कर्मचारी व्यवसाय कर खाते','कर्मचारी भविष्य निधि','देनगी खाते','दिवाली अग्रिम','सभासद प्रवेश फीस',' झेरॉक्स  विभाग निव्वल ऩफा','कर्मचारी अधिलाभांश','संशयित बुडित निधि','ऑडिट फीस','इनकम टॅक्स परत','डेड़स्टॊक झीज','झेरॉक्स मशीन झीज फंड','इनकम टॅक्स भरणा','प्रशिक्षण निधी','इनकम टॅक्स फीस','डिजिटल स्वाक्षरी','जी एस टी शुल्क','किरकोळ खर्च','इनकम टॅक्स रिटर्न', 'झेरॉक्स झीज')");
         try {
        int count = 0;
             final List<Object> result = (List<Object>)query1.getResultList();
          
           
             
             for (final Object res : result) {
                
        
                 data.put(Arr[count], res.toString());
               count++;
                 
                          
             }
             
            
         }
          catch (Exception e) {
             e.printStackTrace();
            
         }
        
        
         
        
          //final Query query = (Query)session.createNativeQuery("select party_name,amount from thirdpartypayment where party_name IN ('कर्मचारी भविष्य निधि','बॅंक करंट खाते')");
        final Query query = (Query)session.createNativeQuery("select party_name,amount from thirdpartypayment where party_name IN ('आरंभिची  शिल्लक','कर्मचारी व्यवसाय कर खाते' ,'कर्मचारी भविष्य नि. निधी ', 'कर्मचारी कल्याण निधी ','बँक करंट खाते ','देणगी खाते ','दिवाळी अग्रीम ','गंगाजळी खाते (बँक व्याज )','गंगाजळी खाते ','झेरॉक्स विभागअनामत ','सभासद लाभांश ' ,'कर्मचारी अधिलाभांश ','संशियत बुडीत निधी ',\r\n" + 
        		"'एम.जी.बी.लोन','स. ठेवव्याज','मु. ठेवव्याज','बचत ठेवव्याज','विद्यापीठ ठेव व्याज','सकल कल्याणनिधी','ऑडिट फीस','प्रशीक्षण निधी','डेडस्टॉक झीज','एकून')");
        try {
       
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Add_Member> list = new ArrayList<Add_Member>();
            for (final Object[] res : result) {
               
       
                data.put(res[0].toString(), res[1].toString());
              
                
                         
            }
            
            
        }
        catch (Exception e) {
            e.printStackTrace();
           
        }
        
        
		
		return null;
	}

	@Override
	public List<Third_Party_Payment> Daily_Report_Details(String sdate, String edate) {
	Session session = null;
	        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
	            throw new NullPointerException();
	        }
	             
	        final Query query = (Query)session.createNativeQuery("Select party_name, amount, date, IFNULL(cheque_number,0), transaction, IFNULL(notes,0), IFNULL(accountnumber,0), openingbalance, closingbalance FROM thirdpartypayment WHERE date BETWEEN '"+sdate+"' AND '"+edate+"' ");
	         
	        try {
	            final List<Object[]> result = (List<Object[]>)query.getResultList();
	            final List<Third_Party_Payment> list = new ArrayList<Third_Party_Payment>();
	            for (final Object[] res : result) {
	                final Third_Party_Payment data = new Third_Party_Payment();
	               
	               try {

	                data.setParty_name(res[0].toString());
	                data.setAmount(res[1].toString());
	                data.setDate(res[2].toString());
	                data.setCheque_number(res[3].toString());
	                data.setTransaction(res[4].toString());        
	                data.setNotes(res[5].toString());
	                data.setAccountnumber(res[6].toString());
	                data.setClosingbalance(res[8].toString());
	                data.setOpeningbalance(res[7].toString());
	               
	               
	               } catch (Exception e) {
	    System.out.println(e);
	    }
	               
	                list.add(data);
	               
	            }
	           
	            return list;
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	}


	@Override
	public List<TransInsurance> getTransInsuranceData() {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          final Query query = (Query)session.createNativeQuery("SELECT accountnumber,date FROM trans_insurance WHERE id IN (SELECT MIN(id) FROM trans_insurance GROUP BY date)");
          
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<TransInsurance> list = new ArrayList<TransInsurance>();
            for (final Object[] res : result) {
                final TransInsurance data = new TransInsurance();
               try {
				
									
                data.setAccountnumber(res[0].toString()); 
                data.setDate(res[1].toString());    
                
                System.out.println(res[0].toString()+"--------"+res[1].toString());
               } catch (Exception e) {
   				System.out.println(e);
   			}	  
                list.add(data);              
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}


	@Override
	public List<UserAnnualReport> FetchAnnualReport(String Sdate, String Edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          final Query query = (Query)session.createNativeQuery("SELECT sh.fullname, sh.accountnumber, sh.totalamountofshare,md.m_deposit,ins.totalinsuranceamount,IFNULL(rdd.totalamount, 0),IFNULL(nl.loanbalance, 0), IFNULL(el.eloanbalance, 0) FROM trans_share sh LEFT JOIN trans_monthlydeposit md ON sh.accountnumber = md.accountnumber AND sh.date = md.cdate LEFT JOIN trans_insurance ins ON sh.accountnumber = ins.accountnumber AND sh.date = ins.date LEFT JOIN rd rdd ON rdd.accountnumber = sh.accountnumber AND rdd.rddate = sh.date LEFT JOIN new_loan_trans nl ON nl.accountnumber = sh.accountnumber        AND (DATE_FORMAT(nl.date, '%m-%y')) = (DATE_FORMAT(sh.date, '%m-%y')) LEFT JOIN emergency_loan_trans el ON el.accountnumber = sh.accountnumber AND el.date = sh.date WHERE sh.date BETWEEN '"+Sdate+"' AND '"+Edate+"' order by sh.accountnumber");
          final List<UserAnnualReport> list = new ArrayList<UserAnnualReport>();
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
           
            for (final Object[] res : result) {
                final UserAnnualReport data = new UserAnnualReport();
               try {
				
				data.setAccountname(res[0].toString()); 					
                data.setAccountnumber(res[1].toString()); 
                data.setShares(res[2].toString());    
                data.setMonthlydeposite(res[3].toString());
                data.setInsurance(res[4].toString());
                data.setRd(res[5].toString());
                data.setLoanbalance(res[6].toString());
               // data.setELoanBalance(res[6].toString());
                data.setEloanbalance(res[7].toString());
                System.out.println(res[0].toString()+"--------"+res[1].toString());
               } catch (Exception e) {
   				System.out.println(e);
   			}	  
                list.add(data);              
            }
        }
        
        catch (Exception e) {
			// TODO: handle exception
		}
            return list;
	
	
	
	}
	}
