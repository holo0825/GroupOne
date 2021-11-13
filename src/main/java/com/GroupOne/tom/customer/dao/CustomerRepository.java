package com.GroupOne.tom.customer.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.tom.model.SellerProductBean;

public interface CustomerRepository 
					extends JpaRepository<SellerProductBean, Integer> {
	
	@Query(value="SELECT * FROM ProductImformation p WHERE p.PRODUCT_NAME LIKE %?1% ", nativeQuery = true)
	List<SellerProductBean> findAllByName(String name);

	@Query(value="SELECT * FROM ProductImformation p WHERE p.PRODUCT_NAME LIKE %?1% and p.item = ?2", nativeQuery = true)
	List<SellerProductBean> findAllByNameAndItem(String name,String item);
	
	List<SellerProductBean> findByItem(String item);
}
