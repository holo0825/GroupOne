package com.GroupOne.tom.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.GroupOne.tom.admin.service.AdminService;
import com.GroupOne.tom.model.SellerProductBean;

@SessionAttributes({ "admin" })
@Controller
@RequestMapping("/admin")
public class AdminController {

	AdminService adminService;

	@Autowired
	public AdminController(AdminService adminService) {
		super();
		this.adminService = adminService;
	}

	@GetMapping("/adminGroupBuy")
	public String restaurantList(Model model) {
		List<SellerProductBean> list = adminService.findAll();
		model.addAttribute("Products", list);
		return "groupbuy/adminGroupBuy";
	}

	@DeleteMapping("/updateSellerAdmin")
	@ResponseBody // 使其不跳轉畫面
	public void ajaxUpdateRestaurantByAdmin(@RequestParam int id, Model model) {
		adminService.deleteProduct(id);
	}
	
	

}
