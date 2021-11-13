package com.GroupOne.tom.seller.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.kai.model.ActivityBean;
import com.GroupOne.tom.model.SellerProductBean;
import com.GroupOne.tom.seller.service.SellerService;

@SessionAttributes("seller") 
@RequestMapping("/seller")
@Controller
public class SellerController {
	
	
	SellerService sellerService;
	ServletContext servletContext;
	
	@Autowired
	public SellerController(SellerService sellerService,ServletContext servletContext) {
		super();
		this.sellerService = sellerService;
		this.servletContext = servletContext;
	}
	

	
	@ModelAttribute("product")
	public SellerProductBean model() {
		SellerProductBean product = new SellerProductBean();
		return product;   
	} 
	
	@GetMapping("/sellerCreate")
	public String sellerCreate(Model model) {
		List<String> lists = new ArrayList<>();
		lists.add("飲品");
		lists.add("甜點");
		lists.add("飯類");
		lists.add("飯類");
		lists.add("麵包");
		lists.add("Pizza");
		lists.add("水果");
		lists.add("冰品");
		lists.add("其他");
		
		model.addAttribute("lists", lists);
		
		return "groupbuy/sellerCreate";   
	}
	
	@GetMapping("/sellerList")
	public String seller(Model model) {
		int sellerid =sellerId(model);
		
		List<SellerProductBean> products = sellerService.findAllBySellerId(sellerid);
		model.addAttribute("Products", products);
		return "groupbuy/sellerList";   
	}
	

	
	@PostMapping("/sellerForm")
	public String sellerForm(Model model, 
			@ModelAttribute("product") SellerProductBean form) {
		form.setPeopleNow(0);
		form.setSellerId(sellerId(model));
		sellerService.insertProduct(form);

		return "redirect:/seller/sellerList";
	}	
	
	
	@GetMapping("/sellerProductEdit")
	public String edit(@ModelAttribute("product") SellerProductBean seller,
			@RequestParam Integer id, Model model) {
		List<String> lists = new ArrayList<>();
		lists.add("飲品");
		lists.add("甜點");
		lists.add("飯類");
		lists.add("飯類");
		lists.add("麵包");
		lists.add("Pizza");
		lists.add("水果");
		lists.add("冰品");
		lists.add("其他");
		
		model.addAttribute("lists", lists);
		
		Optional<SellerProductBean> sellerProduct = sellerService.findById(id);
		model.addAttribute("product", sellerProduct.get());
		return "groupbuy/productEdit";
	}
	
	@PostMapping("/sellerUpdateForm")
	public String FormUpdate(Model model, @ModelAttribute("product") SellerProductBean form) {
		System.out.println(form.getSellerId()+"sellerid");
		
		sellerService.updateProduct(form);
		
		return "redirect:/seller/sellerList";

	}
	
	//[後端]刪除 get delete紐進到刪除確認頁V
	@GetMapping("/sellerProductDelete")
	public String toDelete(@RequestParam Integer id, Model model) {		
		System.out.println(id+"id");
		sellerService.deleteProduct(id);
		return "redirect:/seller/sellerList";
	}
	
	
	public int sellerId(Model model) {
		Member seller = (Member) model.getAttribute("seller");
	    int sellerid = seller.getId();
	    return sellerid;
	}
	
//	@GetMapping("/")
//	public String index() {
//		return "SellerMain";   
//	}
	
//	@GetMapping("/SellerUpdate")
//	public String sellerUpdate(Model model) {
//		
//		List<SellerProductBean> products = sellerService.findAll();
//		
//		model.addAttribute("Products", products);
//		
//		return "seller/SellerUpdate";   
//	}
	
//	@GetMapping(value = "/sellerUpdateForm" )
//	public String sellerUpdateForm(Model model, 
//			@RequestParam(value = "UPDATE" ,required=false) String UPDATE,
//			@RequestParam(value = "DELETE" ,required=false) String DELETE,
//			@RequestParam(value = "productno") Integer id,
//			@RequestParam(value = "productname") String Name,
//			@RequestParam(value = "price") Integer price, 
//			@RequestParam(value = "people") Integer people,
//			@RequestParam(value = "date",required=false) Date date,
//			@RequestParam(value = "now") Date now) {
//		
//		SellerProductBean form = new SellerProductBean(); 
//		form.setId(id);
//		form.setName(Name);
//		form.setPrice(price);
//		form.setPeople(people);
//		if(date==null) {
//			form.setDate(now);
//		}else {
//			form.setDate(date);
//		}
//		
//		
//		if (DELETE != null) {
//			sellerService.deleteProduct(id);
//		}else if(UPDATE != null) {
//			sellerService.updateProduct(form);
//		}
//		
//		return "redirect:/seller/SellerUpdate";
//	}	
}
