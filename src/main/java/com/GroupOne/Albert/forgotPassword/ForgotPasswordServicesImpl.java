package com.GroupOne.Albert.forgotPassword;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.members.Member;

@Service
@Transactional
public class ForgotPasswordServicesImpl implements ForgotPasswordServices{
 
    @Autowired
    private ForgotPasswordRepository forgotPasswordRepo;
     
 
    public void updateResetPasswordToken(String token, String email) throws MemberNotFoundException {
    	Member member = forgotPasswordRepo.findByEmail(email);
        if (member != null) {
        	member.setResetPasswordToken(token);
        	forgotPasswordRepo.save(member);
        } else {
            throw new MemberNotFoundException("Could not find any customer with the email " + email);
        }
    }
     
    public Member getByResetPasswordToken(String token) {
        return forgotPasswordRepo.findByResetPasswordToken(token);
    }
     
    public void updatePassword(Member member, String newPassword) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(newPassword);
        member.setPassword(encodedPassword);
         
        member.setResetPasswordToken(null);
        forgotPasswordRepo.save(member);
    }
}