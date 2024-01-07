package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.UserSign;

public interface UserSignRepository extends JpaRepository<UserSign, Integer>{
	
	
	@Query("select u from UserSign u where u.acc_no = ?1 AND u.password = ?2") ///here mob is account number
	UserSign finduserByMob(String acc_no,String password);
	
	
	@Query("select u from UserSign u where u.acc_no = ?1") ///here mob is account number
	UserSign finduserByMob(String acc_no);

}
