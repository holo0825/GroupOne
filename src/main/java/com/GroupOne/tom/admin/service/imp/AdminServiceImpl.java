package com.GroupOne.tom.admin.service.imp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.tom.admin.dao.AdminRepository;
import com.GroupOne.tom.admin.service.AdminService;
import com.GroupOne.tom.model.SellerProductBean;

@Repository
@Transactional
public class AdminServiceImpl implements AdminService {
	
	AdminRepository adminRepository;
	
	@Autowired
	public AdminServiceImpl(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}

	@Override
	public List<SellerProductBean> findAll() {
		return adminRepository.findAll();
	}
	
	@Override
	public void deleteProduct(Integer id) {
		adminRepository.deleteById(id);
	}
}
