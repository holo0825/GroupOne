package com.GroupOne.tom.customer.service.imp;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.tom.customer.dao.CustomerRepository;
import com.GroupOne.tom.customer.service.CustomerService;
import com.GroupOne.tom.model.CartBean;
import com.GroupOne.tom.model.SellerProductBean;

@Repository
@Transactional
public class CustomerServiceImpl implements CustomerService {
	
	CustomerRepository customerRepository;
	
	@Autowired
	public CustomerServiceImpl(CustomerRepository customerRepository) {
		this.customerRepository = customerRepository;
	}
	
	@Override
	public List<SellerProductBean> findAll() {
		return customerRepository.findAll();
	}

	@Override
	public CartBean getCustomerById(int id) {
		Optional<SellerProductBean> sellerBean = customerRepository.findById(id);
		
		SellerProductBean seller = sellerBean.get();
		CartBean cart = new CartBean();
		cart.setId(seller.getId());
		cart.setName(seller.getName());
		cart.setPrice(seller.getPrice());
		cart.setCategory("group");
		
		return cart;
	}
	
	@Override
	public Optional<SellerProductBean> findById(int id) {
		return customerRepository.findById(id);
	}
	
	public List<SellerProductBean> findAllByName(String name){
		return customerRepository.findAllByName(name);
	}

	@Override
	public List<SellerProductBean> findByItem(String item) {
		return customerRepository.findByItem(item);
	}

	@Override
	public List<SellerProductBean> findAllByNameAndItem(String name, String item) {

		return customerRepository.findAllByNameAndItem(name,item);
	}

	@Override
	public void updateProduct(SellerProductBean seller) {
		customerRepository.save(seller);
	}
}
