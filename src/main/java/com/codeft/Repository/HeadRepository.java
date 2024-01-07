package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Head;

public interface HeadRepository extends JpaRepository<Head, Integer> {

	@Modifying
	@Query("Delete from Head ah where ah.id = ?1")
	 void deleteAccountHeadById(int id);
}
