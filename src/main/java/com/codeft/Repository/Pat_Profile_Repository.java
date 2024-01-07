package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Pat_Profile;

public interface Pat_Profile_Repository extends JpaRepository<Pat_Profile, Integer>{

	@Query("select ap from Pat_Profile ap where ap.registrationnumber = ?1 ")
	Pat_Profile findpatprofileByRegisterNumber(String registrationnumber);
}
