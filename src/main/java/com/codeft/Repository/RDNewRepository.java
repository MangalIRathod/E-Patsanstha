package com.codeft.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.RecurringDeposit;
import com.codeft.Entity.RecurringDepositeNew;

public interface RDNewRepository extends JpaRepository<RecurringDepositeNew, Integer>{

	@Query("select f from RecurringDepositeNew f where f.accno = ?1") 
	List<RecurringDepositeNew> findNewRDByAccountNumber(String acc_no);
	
	@Query("select SUM(rdamt) from RecurringDepositeNew nrd where nrd.status = 'start' AND nrd.accno = ?1")
	String findSumOfRdTotalAmount(String acc_no);
	
	@Query("select status from RecurringDepositeNew nrd where nrd.accno = ?1")
	String findStatusOfRd(String acc_no);

	@Query("select SUM(totamt) from RecurringDepositeNew nrd where nrd.status = 'start' AND nrd.accno = ?1")
	String findSumOfRdAmount(String acc_no);
	
	@Query("select f from RecurringDepositeNew f where f.accno = ?1") 
	RecurringDepositeNew findRDByAccountNumber(String acc_no);	
	
	@Modifying
	@Query("Delete from RecurringDepositeNew am where am.accno = ?1")
	void deleteNewRecurringDepositByAccountNumber(String accountnumber);
	
	@Query("SELECT SUM(totamt) FROM RecurringDepositeNew")
    double selectTotalAmount();
	
	@Modifying
	@Query("Delete from RecurringDepositeNew am where am.id = ?1")
	void deleteNewRDByID(int id);
}
