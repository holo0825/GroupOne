package com.GroupOne.yu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.yu.model.MenuBean;
import com.GroupOne.yu.model.RestaurantBean;
import com.GroupOne.yu.services.MenuService;
import com.GroupOne.yu.services.RestaurantService;

//賣家用Controller
@Controller
@SessionAttributes("seller")
@RequestMapping("/seller")
public class RestaurantSellerController {
	RestaurantService restaurantService;
	MenuService menuService;
	ServletContext servletContext;
	//String userName = "秦霜原";
	//String rstName = "義想曲";

	@Autowired
	public RestaurantSellerController(RestaurantService restaurantService, MenuService menuService,
			ServletContext servletContext) {
		this.restaurantService = restaurantService;
		this.menuService = menuService;
		this.servletContext = servletContext;
	}
	
	//處理送出呼叫的時候沒有給ModelAttribute的
	@ModelAttribute("menuBean")
	public MenuBean menu(@RequestParam(required = false) Integer id) {
		MenuBean bean = new MenuBean();
		return bean;
	}
	
	@ModelAttribute("restaurantBean")
	public RestaurantBean restaurant(Model model) {
		RestaurantBean bean = new RestaurantBean();
		return bean;
	}

	// ----------管理介面----------
	
	// 賣家登入後 團購OR餐廳功能選單畫面
		@GetMapping("/home")
		public String sellerCenter() {
			return "Restaurant_Menu/SellerCenter";
		}

	// 賣家 導向餐廳管理畫面
	@GetMapping("/ManageRestaurant")
	public String ManageRestaurant() {
		return "Restaurant_Menu/ManageRestaurant";
	}

	// 賣家 導向菜單管理畫面
	@GetMapping("/ManageMenu")
	public String ManageMenu() {
		return "Restaurant_Menu/ManageMenu";
	}

	// ----------餐廳CRUD----------

	// 到更新頁面(for 賣家)
//	@GetMapping("/UpdateRestaurant")
//	public String updateRst() {
//		return "Restaurant_Menu/UpdateRestaurant";
//	}

	// 賣家 依照餐廳名稱更新餐廳資訊>到該餐廳修改畫面
	@GetMapping("/UpdateRestaurant")
	public String updateRestaurant(Model model) {
		//查用戶名稱>抓出餐廳名稱
		Member seller = (Member) model.getAttribute("seller");
		RestaurantBean restaurant = restaurantService.findByUserName(seller.getUsername());	
		//String rstName2 = restaurant.getRstName();
		model.addAttribute("restaurant", restaurant);
		return "Restaurant_Menu/UpdateRestaurant";
	}

	// 賣家 修改餐廳資訊後送出
	@PostMapping("/informationUpdate")
	public String informationUpdate(Model model, @ModelAttribute RestaurantBean restaurantBean, 
			@RequestParam(name = "image", required = false) MultipartFile image,
			@RequestParam("rstName") String rstName) throws IOException {
		System.out.println("餐廳名稱是"+restaurantBean.getRstName());
		System.out.println("餐廳名稱是"+rstName);
		
		if (!image.getOriginalFilename().equals("")) {
			restaurantBean.setRstImage(image.getBytes());
		} else {
			restaurantBean.setRstImage((restaurantService.findByRstName(restaurantBean.getRstName())).getRstImage());
		}
		
		restaurantService.updateRestaurant(restaurantBean);
		return "redirect:/seller/ManageRestaurant";
	}

	// 賣家 到新增餐點畫面
	@GetMapping("/newarestaurant")
	public String getNewRestaurant(Model model) {
		RestaurantBean restaurantBean = new RestaurantBean();
		model.addAttribute("restaurantBean", restaurantBean);
		return "Restaurant_Menu/NewARestaurant";
	}

	// 賣家 新增餐廳
	@PostMapping("/OpenSuccess")
	public String processAddNewProductForm(@RequestParam("userName") String userName,
			@RequestParam("mobile") String mobile, @RequestParam("rstName") String rstName,
			@RequestParam(value="license", required=false) String license, @RequestParam("rstAddress") String rstAddress,
			@RequestParam("rstTel") String rstTel, @RequestParam("category") String category,
			@RequestParam("businessHour") String businessHour, @RequestParam("rstImage") MultipartFile rstImage)
			throws IOException {

		RestaurantBean restaurant = new RestaurantBean(userName, mobile, rstName, license, rstAddress, rstTel, category,
				businessHour, rstImage.getBytes());
		restaurantService.addRestaurant(restaurant);
		System.out.println("餐廳已新增");
		return "Restaurant_Menu/OpenSuccess";
	}

	// 賣家 刪除餐廳:依據餐廳名稱
	@DeleteMapping("/deleterestaurant/{rstName}")
	public String DeleteRestaurant(@RequestParam("rstName") String rstName) {
		RestaurantBean restaurantBean = new RestaurantBean(rstName);
		restaurantService.deleteByRstName(rstName);
		return "Restaurant_Menu/ManageRestaurant";
	}

	// ----------菜單CRUD----------

	// 賣家 查詢所有餐點
	@GetMapping("/searchallmenu")
	public String findAllByMyRestaurant(Model model) {
		// 查用戶名稱>抓出餐廳名稱
		Member seller = (Member) model.getAttribute("seller");
		RestaurantBean restaurantBean = restaurantService.findByUserName(seller.getUsername());
		String rstName = restaurantBean.getRstName();
		List<MenuBean> list = menuService.findByRstName(rstName);
		model.addAttribute("productName", list); // 跟前端items名字要一樣
		return "Restaurant_Menu/MenuList";
	}

	// 賣家 到新增餐點畫面
	@GetMapping("/addmenu")
	public String getAddMenu(Model model) {
		MenuBean menuBean = new MenuBean();
		// menuService.addProduct(menuBean);
		model.addAttribute("menuBean", menuBean);
		return "Restaurant_Menu/MenuEdit";
	}

	// 賣家 新增東西到SQL，跳轉到菜色列表畫面
	// 賣家新增菜單，先抓取餐廳名稱
	@PostMapping("/addtomenu")
	public String newMenu(Model model, @ModelAttribute MenuBean menuBean) {
		//查用戶名稱>抓出餐廳名稱
		Member seller = (Member) model.getAttribute("seller");
		RestaurantBean restaurant = restaurantService.findByUserName(seller.getUsername());	
		// 先查餐廳名稱
		//System.out.println(userName);
		//RestaurantBean restaurantBean = restaurantService.findByUserName(userName);
		// 抓取餐廳名稱
		System.out.println("123");
		String rstName1 = restaurant.getRstName();
		System.out.println(rstName1);
		System.out.println(456);
		// 再進行菜色新增
		menuBean.setRstName(rstName1);
		menuService.addProduct(menuBean);
		System.out.println("success");
		return "redirect:/seller/searchallmenu";

	}

	// 賣家 根據餐廳名稱&菜單名稱去修改菜單
	@GetMapping("/updateMenu")
	public String save(Model model, @RequestParam String productName) {
		//	, @RequestParam Integer id
		//查用戶名稱>抓出餐廳名稱
		Member seller = (Member) model.getAttribute("seller");
		RestaurantBean restaurant = restaurantService.findByUserName(seller.getUsername());	
		//System.out.println(userName);
		//RestaurantBean restaurantBean = restaurantService.findByUserName(userName);
		// 抓取餐廳名稱
		String rstName1 = restaurant.getRstName();
		System.out.println(456);
		// 再進行菜色修改
		System.out.println(productName);
		//System.out.println(id);		
		MenuBean menu = (MenuBean) menuService.findByProductName(productName);
		//Optional<MenuBean> menu = menuService.findById(id);	
		
		model.addAttribute("menu", menu);
		return "Restaurant_Menu/AdjustMenu";
	}

	// 賣家 修改菜單後送出
	@PostMapping("/doupdate")
	public String doUpdate(Model model, @RequestParam(name = "coverImage", required = false) MultipartFile coverImage,
			@ModelAttribute MenuBean menuBean) throws IOException {
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println(coverImage.getOriginalFilename());
		if (!coverImage.getOriginalFilename().equals("")) {
			menuBean.setDishImage(coverImage.getBytes());
		} else {
			menuBean.setDishImage((menuService.findByProductName(menuBean.getProductName())).getDishImage());
			//menuBean.setDishImage((menuService.findById(menuBean.getId())).getDishImage());
			
		}

		menuService.updateMenu(menuBean);
		return "redirect:/seller/searchallmenu";
	}

	// 賣家 刪除菜色
	@GetMapping("/deleteMenu")
	public String DeleteMenu(@RequestParam("productName") String productName) {
		MenuBean optional = menuService.findByProductName(productName);
		if (optional != null) {
			menuService.deleteByProductName(productName);
		} else {
			throw new RuntimeException(productName + "此菜色不存在");
		}
		return "Restaurant_Menu/ManageMenu";
	}

}
