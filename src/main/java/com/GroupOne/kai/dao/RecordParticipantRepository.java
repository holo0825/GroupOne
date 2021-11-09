package com.GroupOne.kai.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.kai.model.RecordParticipantBean;

public interface RecordParticipantRepository 
				extends JpaRepository<RecordParticipantBean, Integer>{

	
	@Transactional
	 @Modifying
	  @Query(nativeQuery = true,value="delete from Record_Participant where recordId=?1 ")
	 public void deleteByRid(String id);
	
	
	
	
	
	
	

}
