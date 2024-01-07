package com.codeft.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Add_Member;

public interface Add_Member_Repository extends JpaRepository<Add_Member, String>{

	@Query("select f from Add_Member f where f.accountnumber = ?1") 
	Add_Member findAddMemberByAccountNumber(String acc_no);
	
	@Modifying
	@Query("Delete from Add_Member am where am.accountnumber = ?1")
	void deleteAddMemberByAccountNumber(String accountnumber);
		
	
	@Query("select u from Add_Member u where u.accountnumber = ?1 ")
	Add_Member finduserprofileByAccountNumber(String AccountNumbere);
	
	@Query("select u from Add_Member u where u.accountnumber = ?1") ///here mob is account number
	Add_Member finduserByAccountNumber(String acc_no);
	
	@Query("select f from Add_Member f where f.gcount < 5") 
	List<Add_Member> findGuarantorMemberList();
}
