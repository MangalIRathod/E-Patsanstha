package com.codeft.ServicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import com.codeft.Entity.MonthlyDeposit;
import com.codeft.Entity.Trans.EmeregencyLoanTrans;
import com.codeft.Entity.Trans.Loan_Trans;
import com.codeft.Entity.Trans.TransInsurance;
import com.codeft.Entity.Trans.Trans_MonthlyDeposit;
import com.codeft.Entity.Trans.Trans_Share;
import com.codeft.Repository.LoanRepository;
import com.codeft.Repository.MonthlyDepositeRepository;
import com.codeft.Repository.Trans.EmergencyLoanTransRepository;
import com.codeft.Repository.Trans.Loan_TransRepository;
import com.codeft.Repository.Trans.TransInsuranceRepository;
import com.codeft.Repository.Trans.TransShareRepository;
import com.codeft.Repository.Trans.Trans_MonthlyDepositRepository;
import com.codeft.Services.TransactionalService;

@Repository
public class TransactionalServiceImplementation implements TransactionalService {

	@Autowired
	TransInsuranceRepository TIR;
	
	@Autowired
	TransShareRepository TSR;
	
	@Autowired
	MonthlyDepositeRepository MDR;
	
	@Autowired
	LoanRepository LD;
	
	@Autowired
	Loan_TransRepository LTR;
	
	@Autowired
	Trans_MonthlyDepositRepository TMDR;
	
	@Autowired
	EmergencyLoanTransRepository ELTR;
	
	@Override
	public String SaveInsurance(TransInsurance trans) {
		String string  = "fail";
	TransInsurance tr =	TIR.save(trans);
	if(tr  != null)
		string = "Success";
		return string;
	}


	@Override
	public List<TransInsurance> GetAllUserInsurance() {
		//List<TransInsurance> AllUserInsurance = TIR.findAll();
		List<TransInsurance> AllUserInsurance = TIR.findAll(Sort.by(Sort.Direction.ASC, "accountnumber"));
		return AllUserInsurance;
	}


	@Override
	public String SaveShare(Trans_Share transshare) {
		String string = "Fail";
		
		Trans_Share TS = TSR.save(transshare);
		if(TS != null)
			string = "Success";
		return string;
	}
	
	@Override
	public String SaveTransMonthlyDeposit(Trans_MonthlyDeposit trans_monthly_deposit) {
		String string = "Fail";
		
		Trans_MonthlyDeposit TMD = TMDR.save(trans_monthly_deposit);
		if(TMD != null)
			string = "Success";
		return string;
	}

	@Override
	public List<Trans_Share> GetAllUserShare() {
		//List<Trans_Share> ShareData = TSR.findAll();
		List<Trans_Share> ShareData = TSR.findAll(Sort.by(Sort.Direction.ASC, "accountnumber"));
		return ShareData;
	}


	@Override
	public List<Trans_Share> GetUserShareData(String AccountNumber) {
		List<Trans_Share> ShareData = TSR.findshareByAccountNumber(AccountNumber);
		return ShareData;
	}


	@Override
	public List<TransInsurance> getUserInsuranceData(String AccountNumber) {
		List<TransInsurance> InsuranceData = TIR.finddInsuranceByAccountNumber(AccountNumber);
		return InsuranceData;
	}


	@Override
	public List<MonthlyDeposit> getUserMonthlyDepositData(String AccountNumber) {
		// TODO Auto-generated method stub
		List<MonthlyDeposit> monthlydeposit = MDR.findMonthlyDepositByAccountNumber(AccountNumber);
		return monthlydeposit;
	}


	@Override
	public List<Loan_Trans> getUserLoanData(String AccountNumber) {
		// TODO Auto-generated method stub
		List<Loan_Trans> loandata = LTR.findLoanTransDataByAccountNumber(AccountNumber);
		return loandata;
	}


	@Override
	public List<Trans_MonthlyDeposit> GetAllUserMonthlyDeposit() {
	//	List<Trans_MonthlyDeposit> Monthly_Deposit_Data = TMDR.findAll();
		List<Trans_MonthlyDeposit> Monthly_Deposit_Data = TMDR.findAll(Sort.by(Sort.Direction.ASC, "accountnumber"));
		return Monthly_Deposit_Data;
	}


	@Override
	public String save_emergency_loan_trans(EmeregencyLoanTrans emergency_loan_trans) {
		String string = "Fail";
		
		EmeregencyLoanTrans ELT = ELTR.save(emergency_loan_trans);
		if(ELT != null)
			string = "Success";
		return string;
	}


	@Override
	public List<EmeregencyLoanTrans> GetAllEmergencyLoanTransInformation() {
		// TODO Auto-generated method stub
	//	List<EmeregencyLoanTrans> elt = ELTR.findAll();
		List<EmeregencyLoanTrans> elt = ELTR.findAll(Sort.by(Sort.Direction.ASC, "accountnumber"));
		return elt;
	}


	@Override
	public List<Trans_MonthlyDeposit> getUserTransMonthlyDepositData(String AccountNumber) {
		List<Trans_MonthlyDeposit> monthlydeposit = TMDR.findTransMonthlyDepositByAccountNumber(AccountNumber);
		return monthlydeposit;
	}


	@Override
	public List<EmeregencyLoanTrans> getUserEmergencyTransLoanData(String AccountNumber) {
		List<EmeregencyLoanTrans> eloantransdata = ELTR.findTransEmergencyLoanDataByAccountNumber(AccountNumber);
		return eloantransdata;
	}

}
