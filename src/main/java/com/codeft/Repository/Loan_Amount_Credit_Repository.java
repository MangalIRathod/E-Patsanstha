package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Loan_Amount_Credit;

public interface Loan_Amount_Credit_Repository extends JpaRepository<Loan_Amount_Credit, Integer>{

	@Query("select f from Loan_Amount_Credit f where f.accountnumber = ?1") 
	Loan_Amount_Credit findLoanAmountCreditByAccountNumber(String acc_no);
}
