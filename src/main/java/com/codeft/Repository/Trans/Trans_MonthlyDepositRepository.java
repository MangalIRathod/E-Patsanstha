package com.codeft.Repository.Trans;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.MonthlyDeposit;
import com.codeft.Entity.Trans.Trans_MonthlyDeposit;

public interface Trans_MonthlyDepositRepository extends JpaRepository<Trans_MonthlyDeposit, Integer>{
	
	@Modifying
	@Query("Delete from Trans_MonthlyDeposit am where am.accountnumber = ?1")
	void deleteTrans_MonthlyDepositByAccountNumber(String accountnumber);
	
	@Query("select md from Trans_MonthlyDeposit md where md.accountnumber = ?1") 
	List<Trans_MonthlyDeposit> findTransMonthlyDepositByAccountNumber(String acc_no);

}
