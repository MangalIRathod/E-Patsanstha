package com.codeft.Repository.Trans;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Loan;
import com.codeft.Entity.Trans.Loan_Trans;

public interface Loan_TransRepository extends JpaRepository<Loan_Trans, Integer>{

	@Modifying
	@Query("Delete from Loan_Trans am where am.accountnumber = ?1")
	void deleteLoan_TransByAccountNumber(String accountnumber);
	
	@Query("select l from Loan_Trans l where l.accountnumber = ?1") 
	List<Loan_Trans> findLoanTransDataByAccountNumber(String acc_no);
	
	@Modifying
	@Query("Delete from Loan_Trans lt where lt.id = ?1")
	 void deleteRegularLoanTransById(int id);
}
