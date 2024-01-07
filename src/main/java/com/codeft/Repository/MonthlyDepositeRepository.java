package com.codeft.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.MonthlyDeposit;

public interface MonthlyDepositeRepository extends JpaRepository<MonthlyDeposit, String> {
	
	@Query("select md from MonthlyDeposit md where md.accountnumber = ?1") 
	MonthlyDeposit findmdByAccountNumber(String acc_no);
	
	@Query("select md from MonthlyDeposit md where md.accountnumber = ?1") 
	List<MonthlyDeposit> findMonthlyDepositByAccountNumber(String acc_no);
	
	@Query("SELECT SUM(m_deposit) FROM MonthlyDeposit")
    double selectM_DepositAmount();
	
	@Modifying
	@Query("Delete from MonthlyDeposit am where am.accountnumber = ?1")
	void deleteMonthlyDepositByAccountNumber(String accountnumber);

}
