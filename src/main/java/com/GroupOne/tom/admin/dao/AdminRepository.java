package com.GroupOne.tom.admin.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.tom.model.SellerProductBean;

public interface AdminRepository 
					extends JpaRepository<SellerProductBean, Integer> {

}
