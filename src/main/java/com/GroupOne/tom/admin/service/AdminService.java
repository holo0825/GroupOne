package com.GroupOne.tom.admin.service;

import java.util.List;

import com.GroupOne.tom.model.SellerProductBean;

public interface AdminService {
	List<SellerProductBean> findAll();
	
	void deleteProduct(Integer id);
}