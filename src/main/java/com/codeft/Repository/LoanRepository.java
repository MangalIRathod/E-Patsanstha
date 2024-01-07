package com.codeft.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.codeft.Entity.Loan;
import com.codeft.Entity.Trans.EmeregencyLoanTrans;

public interface LoanRepository extends JpaRepository<Loan, Integer> {

	
	@Query("select l from Loan l where l.accountnumber = ?1") 
	Loan findloanByAccountNumber(String acc_no);
	
	@Query("select l from Loan l where l.accountnumber = ?1") 
	List<Loan> findLoanDataByAccountNumber(String acc_no);
	
	@Query("select f from Loan f where f.accountnumber = ?1") 
	Loan findNewLoanByAccountNumber(String acc_no);
	
	@Query("select l from Loan l where l.loanamount > 0 ") 
	List<Loan> findLoanMember();
	
	@Query("SELECT SUM(loanamount) FROM Loan")
    double selectTotalLoanAmount();
	
	@Query("SELECT SUM(loanbalance) FROM Loan")
    double selectRemainingLoanAmount();
	
	@Modifying
	@Query("Delete from Loan am where am.accountnumber = ?1")
	void deleteLoanByAccountNumber(String accountnumber);
	
	@Query("select md from Loan md where md.accountnumber = ?1") 
	List<Loan> findRegularLoanDataByAccountNumber(String acc_no);
	

	@Modifying
	@Transactional
	@Query("UPDATE Loan lo SET lo.status = 'Completed' WHERE accountnumber= ?1")
	void setLoanStatus(String accountnumber);
	
}
