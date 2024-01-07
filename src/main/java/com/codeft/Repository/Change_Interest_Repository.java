package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Change_Interest;

public interface Change_Interest_Repository extends JpaRepository<Change_Interest, Integer>{

	@Modifying
	@Query("Delete from Change_Interest ci where ci.id = ?1")
	 void deleteChangeInterestById(int id);
}
