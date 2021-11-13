//package com.GroupOne.Albert.controller;
//
//import org.springframework.security.authentication.AnonymousAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//
//// 顯示登入頁面的Controller方法
//// 防止已經登入的用戶重複登入
////@Controller
//public class MemberLoginController {
//	@GetMapping("/login")
//    public String showLoginForm(Model model) {
//         
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
////            return "login";
//            return "__login";
//        }
// 
//        return "redirect:/";
//    }
//
//}
