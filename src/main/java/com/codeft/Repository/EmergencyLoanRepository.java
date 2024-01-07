package com.codeft.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.codeft.Entity.EmergencyLoan;

public interface EmergencyLoanRepository extends JpaRepository<EmergencyLoan, String> {
	
	@Query("select el from EmergencyLoan el where el.accountnumber = ?1") 
	EmergencyLoan findELByAccountNumber(String acc_no);
	
	@Query("select f from EmergencyLoan f where f.accountnumber = ?1") 
	EmergencyLoan findEmergencyLoanByAccountNumber(String acc_no);
	
	@Query("SELECT SUM(loanamount) FROM EmergencyLoan")
    double selectEmergencyLoanAmount();
	
	@Query("SELECT SUM(eloanbalance) FROM EmergencyLoan")
    double selectEmergencyBalanceLoanAmount();
	
	@Modifying
	@Query("Delete from EmergencyLoan am where am.accountnumber = ?1")
	void deleteEmergencyLoanByAccountNumber(String accountnumber);
	
	@Query("select el from EmergencyLoan el where el.accountnumber = ?1")
	List<EmergencyLoan> findEmergencyLoanByUserAccountNumber(String accno);
	
	@Modifying
	@Transactional
	@Query("UPDATE EmergencyLoan el SET el.status = 'Completed' WHERE accountnumber= ?1")
	void setELoanStatus(String accountnumber);
	

}
