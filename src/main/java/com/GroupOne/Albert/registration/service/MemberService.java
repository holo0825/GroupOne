package com.GroupOne.Albert.registration.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import com.GroupOne.Albert.members.Member;

public interface MemberService {
	boolean existsById(String id);
	
//	void save(MemberBean mb);
	void save(Member mb);
	
//	void checkUnpaidAmount(OrderBean ob);
	
//	MemberBean findByMemberId(String id);
	Member findByUsername(String username);
	
//	MemberBean findByMemberIdAndPassword(String memberId, String password) ;
	Member findByUsernameAndPassword(String username, String password);
	
	
	
	//------------------------------------------------------------------------
	// 以下為註冊會員使用的方法
	void register(Member user, String siteURL) 
			throws UnsupportedEncodingException, MessagingException;
	
	void sendVerificationEmail(Member user, String siteURL)
			throws MessagingException, UnsupportedEncodingException;
	
	boolean verify(String verificationCode);
	
	public Member findByEmail(String email);
}
