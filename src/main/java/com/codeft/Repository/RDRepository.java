package com.codeft.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.RecurringDeposit;

public interface RDRepository extends JpaRepository<RecurringDeposit, Integer>{
	
	@Query("select f from RecurringDeposit f where f.accountnumber = ?1 ORDER BY id DESC") 
	List<RecurringDeposit> findrdByAccountNumber(String acc_no);	
	
	@Query("select f from RecurringDeposit f where f.accountnumber = ?1") 
	RecurringDeposit findRDByAccountNumber(String acc_no);
	
	@Query("SELECT SUM(rdamount) FROM RecurringDeposit")
    double selectTotalAmount();
	
	@Modifying
	@Query("Delete from RecurringDeposit am where am.accountnumber = ?1")
	void deleteRecurringDepositByAccountNumber(String accountnumber);
	
	@Query("select f from RecurringDeposit f where  f.rdamount > 0 ORDER BY id ASC") 
	List<RecurringDeposit> findAllRDDetails();

	@Modifying
	@Query("Delete from RecurringDeposit lt where lt.id = ?1")
	void deleteRD(int id);
}
