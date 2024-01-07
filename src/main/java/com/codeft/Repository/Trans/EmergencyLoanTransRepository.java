package com.codeft.Repository.Trans;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Trans.EmeregencyLoanTrans;
import com.codeft.Entity.Trans.Trans_MonthlyDeposit;

public interface EmergencyLoanTransRepository extends JpaRepository<EmeregencyLoanTrans, Integer>{

	@Modifying
	@Query("Delete from EmeregencyLoanTrans am where am.accountnumber = ?1")
	void deleteEmeregencyLoanTransByAccountNumber(String accountnumber);
	
	@Query("select md from EmeregencyLoanTrans md where md.accountnumber = ?1") 
	List<EmeregencyLoanTrans> findTransEmergencyLoanDataByAccountNumber(String acc_no);
	
	@Modifying
	@Query("Delete from EmeregencyLoanTrans elt where elt.id = ?1")
	 void deleteEmergencyLoanTransById(int id);
}
