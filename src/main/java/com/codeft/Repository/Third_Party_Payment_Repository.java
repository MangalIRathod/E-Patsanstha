package com.codeft.Repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Third_Party_Payment;

public interface Third_Party_Payment_Repository extends JpaRepository<Third_Party_Payment, Integer>{

	@Modifying
	@Query("Delete from Third_Party_Payment tpp where tpp.id = ?1")
	 void deleteThirdPartyPaymentById(int id);
	
	
	@Query("select SUM(amount) FROM Third_Party_Payment tpp where tpp.transaction='Credit' AND date = ?1")
	double getCreditSum(String cdate);

	@Query("select SUM(amount) FROM Third_Party_Payment tpp where tpp.transaction='Debit' AND date = ?1")
	double getDebitSum(String cdate);
	
	
	@Query(value = "select closingbalance from thirdpartypayment ORDER BY id DESC LIMIT 1",nativeQuery = true)
	double getClosingBalance();
	
	
	@Query(value = "select closingbalance from thirdpartypayment where   date < current_date() ORDER BY date DESC LIMIT 1",nativeQuery = true)
	double getOpeningBalance();
	

	
	
}
