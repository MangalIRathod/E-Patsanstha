package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Dividend_Interest;

public interface Dividend_Interest_Repository extends JpaRepository<Dividend_Interest, Integer>{

	@Modifying
	@Query("Delete from Dividend_Interest di where di.id = ?1")
	 void deleteDividendInterestById(int id);
}
