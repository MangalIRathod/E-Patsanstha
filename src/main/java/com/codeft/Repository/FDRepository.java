package com.codeft.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.FixedDeposite;

public interface FDRepository extends JpaRepository<FixedDeposite, Integer>{

	@Query("select f from FixedDeposite f where f.accountnumber = ?1 ORDER BY id DESC") 
	List<FixedDeposite> findfdByAccountNumber(String acc_no);

	@Query("select f from FixedDeposite f where f.accountnumber = ?1") 
	FixedDeposite findFDByAccountNumber(String acc_no);
	
	@Query("SELECT SUM(fdamount) FROM FixedDeposite")
    double selectFDAmount();
	
	@Modifying
	@Query("Delete from FixedDeposite am where am.accountnumber = ?1")
	void deleteFixedDepositeByAccountNumber(String accountnumber);
	
	@Query("select f from FixedDeposite f where  f.fdamount > 0 AND f.status = 'start' ORDER BY id ASC") 
	List<FixedDeposite> findAllFDDetails();
	
	@Modifying
	@Query("Delete from FixedDeposite lt where lt.id = ?1")
	void deleteFD(int id);
}
