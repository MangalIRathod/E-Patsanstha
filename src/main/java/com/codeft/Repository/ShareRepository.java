package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Share;

public interface ShareRepository extends JpaRepository<Share, String>{
	
	@Query("select s from Share s where s.accountnumber = ?1") 
	Share findshareByAccountNumber(String acc_no);
	
	@Query("SELECT SUM(totalamountofsahre) FROM Share")
    double selectTotalShareAmount();
	
	@Modifying
	@Query("Delete from Share sh where sh.accountnumber = ?1")
	void deleteShareByAccountNumber(String accountnumber);

	@Query("select totalamountofsahre from Share sh where sh.accountnumber = ?1")
	String findShareByAccountNumber(String accountnumber);
}
