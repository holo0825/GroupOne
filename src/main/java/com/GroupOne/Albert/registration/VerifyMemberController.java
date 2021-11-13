package com.GroupOne.Albert.registration;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.GroupOne.Albert.registration.service.MemberService;

@Controller
public class VerifyMemberController {

	private static Logger log = LoggerFactory.getLogger(UserRegisterController.class);
	MemberService memberService;
	ServletContext servletContext;

	@Autowired
	public VerifyMemberController(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}

	// 註冊會員點選確認信連結時對應的Controller方法，信箱驗證成功會變更enabled=true
	@GetMapping("/verify")
	public String verifyUser(@Param("code") String code) {
//				if (service.verify(code)) {
		System.out.println("=====================");
		System.out.println(code);
		System.out.println("=====================");
		if (memberService.verify(code)) {
//			return "verify_success";
//			return "_new_verify_success";
			return "Members/_new_verify_success";
		} else {
//			return "verify_fail";
//			return "_new_verify_fail";
			return "Members/_new_verify_fail";
		}
	}
}
