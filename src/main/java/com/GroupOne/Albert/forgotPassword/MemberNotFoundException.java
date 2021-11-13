package com.GroupOne.Albert.forgotPassword;

// 自訂例外類別和例外訊息
public class MemberNotFoundException extends Exception{
	public MemberNotFoundException(String message) {
        super(message);
    }
}
