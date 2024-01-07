package com.codeft.Services;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.core.io.Resource;

import com.codeft.Entity.Add_Member;
import com.codeft.Entity.Annual_Report;
import com.codeft.Entity.EmergencyLoan;
import com.codeft.Entity.FixedDeposite;
import com.codeft.Entity.Insurance;
import com.codeft.Entity.Loan;
import com.codeft.Entity.MonthlyDeposit;
import com.codeft.Entity.RecurringDeposit;
import com.codeft.Entity.RecurringDepositeNew;
import com.codeft.Entity.Share;
import com.codeft.Entity.Trans.Trans_Share;
import com.codeft.Entity.UserSign;

public interface UserServices {

	String loginvalidate(String name,String Password);
	
	String RegisterUser(UserSign us);
	
	//String save_user_profile(userprofile user_profile);
	
	//String update_user_profile(userprofile user_profile_update);
	
	//userprofile GetUserProfile(String AccountNumber);
	
	Add_Member GetAddMemberProfile(String AccountNumber);
	
	String UpdateUserPassword(UserSign userReg);
	
	List<FixedDeposite> getFD(String AccountNumber);
	
	List<RecurringDeposit> getRD(String AccountNumber);
	
	MonthlyDeposit getMonthlyDepositeUser(String AccountNUmber);
	
	Share GetShareByuser(String AccountNumber);
	
	Insurance GetInsuranceOfUser(String AccountNumber);
	
	Loan GetLoanOfUser(String AccountNumber);
	
	EmergencyLoan GetEmergencyLoanOfUser(String AccountNumber);
	
	double GetRecurringDepositOfNewUser(String AccountNumber);
	
	double GetFDOfNewUser(String AccountNumber);
	
    Resource load(String filename);
     
    List<Trans_Share> GetTransShareDetails(String acc_no);

    List<EmergencyLoan> GetEmergencyLoanDetails(String acc_no);
    
    List<EmergencyLoan> GetUserEmergencyLoanDetails(String acc_no);

    List<FixedDeposite> GetFixedDepositeDetails(String acc_no);

    List<RecurringDeposit> GetRecurringDepositeDetails(String acc_no);    
     
    List<Annual_Report> GetAllAnnualReportDetails(String accountnumber, String sdate, String edate);
     
    Set<Annual_Report> GetAllSETAnnualReportDetails(String accountnumber, String sdate, String edate);
    
    List<RecurringDepositeNew> GetAllNewRDInformation(String AccountNumber);
    
    List<Loan> GetUserRegularLoan(String AccountNumber);
     
}
