package com.GroupOne.tom.customer.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.shoppingcarts.model.CartsBean;
import com.GroupOne.tom.customer.service.CustomerService;
import com.GroupOne.tom.model.CartBean;
import com.GroupOne.tom.model.SellerProductBean;
import com.GroupOne.shoppingcarts.service.ProductService;

@SessionAttributes("user")
@Controller
public class CustomerController {

	CustomerService customerService;
	ProductService productService;

	@Autowired
	public CustomerController(CustomerService customerService, ProductService productService) {
		super();
		this.customerService = customerService;
		this.productService = productService;
	}

	@GetMapping("customer")
	public String test(Model model) {

		return "groupbuy/customer";
	}

	@GetMapping("customerSearch")
	public String customerSearch(Model model) {

		List<SellerProductBean> products = customerService.findAll();

		model.addAttribute("Products", products);
		return "groupbuy/customerSearch";
	}

	@PostMapping("customerSearchProduct")
	public String customerSearchProduct(Model model, @RequestParam String item,@RequestParam String item2) {
		
		if(item2.equals("請選擇品項")) {item2="";}
		List<SellerProductBean> products;
		if (item.isEmpty()&&item2.isEmpty()) {
			return "redirect:/customerSearch";
		}else if(!item.isEmpty()&&item2.isEmpty()) {
			products = customerService.findAllByName(item);
		}else if(item.isEmpty()&&!item2.isEmpty()) {
			products = customerService.findByItem(item2);
		}else {
			products = customerService.findAllByNameAndItem(item,item2);
		}

		

		model.addAttribute("Products", products);
		return "groupbuy/customerSearch";
	}

	@GetMapping("customer/{id}")
	public String customer(Model model, @PathVariable(required = false) Integer id) {

		Member userBean = (Member) model.getAttribute("user");
		if (userBean != null) {

			String username = userBean.getUsername();
			System.out.println("user_name: " + username);

			CartsBean cartBean = productService.findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(username, "coupon");
			int itemNo = -1;
			if (cartBean != null) {
				itemNo = cartBean.getItemNo();
			}

			model.addAttribute("carts", productService.findByItemNo(itemNo));
		}
		
		
		Optional<SellerProductBean> product = customerService.findById(id);
		SellerProductBean customerProduct = product.get();
		model.addAttribute("Product", customerProduct);
		return "groupbuy/customer";
	}
	
	
	@PostMapping(value = "/user/customerForm")
	public String sellerForm(Model model, RedirectAttributes red, @RequestParam(value = "id") Integer id,
			@RequestParam(value = "number") Integer number) {

		CartBean cart = customerService.getCustomerById(id);
		cart.setNumber(number);
		System.out.println("+++++++++++++++++++++");
		System.out.println("321:" + cart.getId());
		System.out.println("321:" + cart.getName());
		System.out.println("321:" + cart.getPrice());
		System.out.println("321:" + cart.getNumber());
		System.out.println("321:" + cart.getCategory());

		System.out.println("+++++++++++++++++++++");

		red.addAttribute("id", cart.getId());
		red.addAttribute("name", cart.getName());
		red.addAttribute("price", cart.getPrice());
		red.addAttribute("number", cart.getNumber());
		red.addAttribute("category", cart.getCategory());
//		model.addAttribute("cart", cart);
		
		Optional<SellerProductBean> seller =customerService.findById(id);
		SellerProductBean seller2 = seller.get();
		seller2.setPeopleNow(number+seller2.getPeopleNow());
		customerService.updateProduct(seller2);
		
		return "redirect:/user/CartListNew";

	}

//	@GetMapping("/CartList/{type}")
//	public String cartListType(Model model, RedirectAttributes redModel, @PathVariable("type") String type) {
//
////		return "redirect:/user/CartListOld";
//		return "shopping/CartList";
//	}

}
