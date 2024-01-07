package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Loan_Closed;

public interface Loan_Closed_Repository extends JpaRepository<Loan_Closed, String>{

	@Query("select f from Loan_Closed f where f.accountnumber = ?1") 
	Loan_Closed findLoanClosedByAccountNumber(String acc_no);
}
