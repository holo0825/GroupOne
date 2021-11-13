package com.GroupOne.tom.customer.service;

import java.util.List;
import java.util.Optional;

import com.GroupOne.tom.model.CartBean;
import com.GroupOne.tom.model.SellerProductBean;

public interface CustomerService {
	List<SellerProductBean> findAll();
	
	CartBean getCustomerById(int id);
	
	Optional<SellerProductBean> findById(int id);
	
	List<SellerProductBean> findAllByName(String name);
	
	List<SellerProductBean> findByItem(String item);
	
	List<SellerProductBean> findAllByNameAndItem(String name,String item);
	
	void updateProduct(SellerProductBean seller);
}