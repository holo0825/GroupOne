package com.GroupOne.Albert.forgotPassword;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.GroupOne.Albert.members.Member;

public interface ForgotPasswordRepository extends CrudRepository<Member, Integer> {
	@Query("SELECT m FROM Member m WHERE m.email = ?1")
    public Member findByEmail(String email); 
     
    public Member findByResetPasswordToken(String token);
}
