package com.codeft.Repository.Trans;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Trans.TransInsurance;



public interface TransInsuranceRepository extends JpaRepository<TransInsurance, Integer> {

	@Query("select s from TransInsurance s where s.accountnumber = ?1") 
	List<TransInsurance> finddInsuranceByAccountNumber(String acc_no);
	
	@Modifying
	@Query("Delete from TransInsurance am where am.accountnumber = ?1")
	void deleteTransInsuranceByAccountNumber(String accountnumber);
	
}
