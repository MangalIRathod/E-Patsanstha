package com.codeft.Services;

import java.util.List;

import com.codeft.Entity.MonthlyDeposit;
import com.codeft.Entity.Trans.EmeregencyLoanTrans;
import com.codeft.Entity.Trans.Loan_Trans;
import com.codeft.Entity.Trans.TransInsurance;
import com.codeft.Entity.Trans.Trans_MonthlyDeposit;
import com.codeft.Entity.Trans.Trans_Share;

public interface TransactionalService {

	String SaveInsurance(TransInsurance trans);
	
	List<TransInsurance> GetAllUserInsurance();
	
	String SaveShare(Trans_Share transshare);
	
	String SaveTransMonthlyDeposit(Trans_MonthlyDeposit trans_monthly_deposit);
	
	List<Trans_Share> GetAllUserShare();
	
	List<Trans_MonthlyDeposit> GetAllUserMonthlyDeposit();
	
	List<Trans_Share> GetUserShareData(String AccountNumber);
	
	List<TransInsurance> getUserInsuranceData(String AccountNumber);
	
	List<MonthlyDeposit> getUserMonthlyDepositData(String AccountNumber);
	
	List<Trans_MonthlyDeposit> getUserTransMonthlyDepositData(String AccountNumber);
	
	List<Loan_Trans> getUserLoanData(String AccountNumber);
	
	List<EmeregencyLoanTrans> getUserEmergencyTransLoanData(String AccountNumber);
	
	String save_emergency_loan_trans(EmeregencyLoanTrans emergency_loan_trans);
	
	List<EmeregencyLoanTrans> GetAllEmergencyLoanTransInformation();
}
