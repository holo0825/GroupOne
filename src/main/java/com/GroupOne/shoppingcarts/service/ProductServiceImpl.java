package com.GroupOne.shoppingcarts.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.shoppingcarts.model.CartsBean;
import com.GroupOne.shoppingcarts.model.ListBean;
import com.GroupOne.shoppingcarts.repository.CartsRepository;
import com.GroupOne.shoppingcarts.repository.ListRepository;
import com.GroupOne.shoppingcarts.repository.UserPointRepository;

@Repository
@Transactional
//@CacheConfig(cacheNames = "listtest")
public class ProductServiceImpl implements ProductService{

	CartsRepository cartsRepository;
	ListRepository listRepository;
	UserPointRepository userPointRepository;
	
	@Autowired
	public ProductServiceImpl(CartsRepository cartsRepository, ListRepository listRepository,UserPointRepository userPointRepository
			) {
		super();
		this.cartsRepository = cartsRepository;
		this.listRepository = listRepository;
		this.userPointRepository = userPointRepository;
	}

	//Cart
	@Override
	public List<CartsBean> findByPaydayNotNull() {
		return cartsRepository.findByPaydayNotNull();
	}

	@Override
	public List<Object[]> findTwoAmountStatistics() {
		return cartsRepository.findTwoAmountStatistics();
	}

	@Override
	public List<CartsBean> findByUsernameAndPaydayIsNullAndWrongIsNull(String username) {
		return cartsRepository.findByUsernameAndPaydayIsNullAndWrongIsNull(username);
	}

	@Override
	public List<CartsBean> findByUsernameAndPaydayNotNull(String username) {
		return cartsRepository.findByUsernameAndPaydayNotNull(username);
	}

	@Override
	public CartsBean findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(String username, String type) {
		return cartsRepository.findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(username, type);
	}

	@Override
	public void saveCart(CartsBean cartsBean) {
		cartsRepository.save(cartsBean);
	}

	@Override
	public void updateAmountAndPointsAndPaydayByUsernameAndItemNo(int amount, float points,Date payday, int dicount, int disAmount, String transactionalNum, String username, int itemNo) {
		cartsRepository.updateAmountAndPointsAndPaydayByUsernameAndItemNo(amount, points, payday, dicount, disAmount, transactionalNum, username, itemNo);;
		cartsRepository.flush();
	}

	@Override
	public void deleteCartByItemNo(int itemNo) {
		cartsRepository.deleteById(itemNo);
	}
	
	//List
	@Override
	public List<Object[]> findListAmountStatistics() {
		return listRepository.findListAmountStatistics();
	}

	@Override
//	@Cacheable(key="#p0")
	public List<ListBean> findByItemNo(int itemNo) {
		return listRepository.findByItemNo(itemNo);
	}

	@Override
	public boolean findByItemNoAndProductName(int itemNo, String productName) {
		List<ListBean> lBean = listRepository.findByItemNoAndProductName(itemNo, productName);
		System.out.println("size: "+ lBean.size());
		if( lBean.size() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public void saveList(ListBean listBean) {
		listRepository.save(listBean);
	}

	@Override
	public void updateNumberByItemNoAndProductName(int number, int itemNo, String productNmae) {
		listRepository.updateNumberByItemNoAndProductName(number, itemNo, productNmae);
		listRepository.flush();
	}

	@Override
	public void updateNumberAndExistByItemNoAndProductName(int number, String exist, int itemNo, String productNmae) {
		listRepository.updateNumberAndExistByItemNoAndProductName(number, exist, itemNo, productNmae);
		listRepository.flush();
	}

	@Override
	public void deleteListByItemNo(int itemNO) {
		listRepository.deleteByItemNoAndExistIsNull(itemNO);
	}
	
	@Override
	public void deleteByItemNoAndProductName(int itemNo, String productName) {
		listRepository.deleteByItemNoAndProductName(itemNo, productName);
	}
	
	//User
	@Override
	public float findByUsernametoCart(String username) {
		UserBean ubean = userPointRepository.findByUsername(username);
		System.out.println("ubean:"+ubean);
		return ubean.getBonusPoint();
	}

	@Override
	public void updatePointByUsernametoCart(float point, String username) {
		userPointRepository.updatePointByUsername(point, username);
	}



}
