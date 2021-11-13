package com.GroupOne.Albert.forgotPassword;

import com.GroupOne.Albert.members.Member;

public interface ForgotPasswordServices {

	void updateResetPasswordToken(String token, String email) throws MemberNotFoundException;
	
	public Member getByResetPasswordToken(String token);
	
	public void updatePassword(Member member, String newPassword);
}
