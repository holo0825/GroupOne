package com.GroupOne.tom.seller.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.tom.model.SellerProductBean;

public interface SellerRepository 
					extends JpaRepository<SellerProductBean, Integer> {
	@Query(value="SELECT * FROM ProductImformation p WHERE p.sellerId = ?1", nativeQuery = true)
	List<SellerProductBean> findAllBySellerId(Integer sellerId);
}
