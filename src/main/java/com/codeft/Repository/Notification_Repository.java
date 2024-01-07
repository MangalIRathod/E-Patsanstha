package com.codeft.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.codeft.Entity.Notification;

public interface Notification_Repository extends JpaRepository<Notification, Integer>{
	
	@Modifying
	@Query("Delete from Notification nt where nt.id = ?1")
	 void deleteNotificationById(int id);

}
