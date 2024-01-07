package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Insurance;

public interface InsuranceRepository extends JpaRepository<Insurance, String> {

	
	@Query("select i from Insurance i where i.accountnumber = ?1") 
	Insurance findinsuranceByAccountNumber(String acc_no);
	
	@Query("SELECT SUM(totalinsuranceamount) FROM Insurance")
    double selectTotalInsuranceAmount();
	
	@Modifying
	@Query("Delete from Insurance am where am.accountnumber = ?1")
	void deleteInsuranceByAccountNumber(String accountnumber);
	
	@Query("select totalinsuranceamount from Insurance am where am.accountnumber = ?1")
	String findInsuranceByAccountNumber(String accountnumber);
}
