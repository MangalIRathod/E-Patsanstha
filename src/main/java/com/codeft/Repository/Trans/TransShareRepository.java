package com.codeft.Repository.Trans;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


import com.codeft.Entity.Trans.Trans_Share;

public interface TransShareRepository extends JpaRepository<Trans_Share, Integer>{

	@Query("select s from Trans_Share s where s.accountnumber = ?1") 
	List<Trans_Share> findshareByAccountNumber(String acc_no);
	
	@Modifying
	@Query("Delete from Trans_Share sh where sh.accountnumber = ?1")
	void deleteTransShareByAccountNumber(String accountnumber);
}
