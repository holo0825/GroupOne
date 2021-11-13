package com.GroupOne.Albert.registration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.Albert.members.Member;


public interface RegisterMemberRepository extends JpaRepository<Member, Integer>{
	
	boolean existsById(String id);
	
//	void save(MemberBean mb) ;
//	void save(Member mb);
	
//	MemberBean findByMemberId(String id);
	Member findByUsername(String username);
	
//	MemberBean findByMemberIdAndPassword(String memberId, String password);	
	Member findByUsernameAndPassword(String username, String password);	
	
//	void updateUnpaidAmount(OrderBean ob);

//	void setConnection(Connection con);
	
	//-----------------------------------------------------------------------
	// 註冊時用email找出會員資料
	@Query("SELECT m FROM Member m WHERE m.email = ?1")
	public Member findByEmail(String email);
	
	// 註冊時用驗證碼找出會員資料
	@Query("SELECT m FROM Member m WHERE m.verificationCode = ?1")
	public Member findByVerificationCode(String code);
}