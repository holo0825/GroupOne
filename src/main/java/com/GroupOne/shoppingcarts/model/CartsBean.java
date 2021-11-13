package com.GroupOne.shoppingcarts.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "cart")
public class CartsBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itemNo;
	private String username;
	private Integer amount;
	private Date payday;
	private Float points;
	private String wrong;
	
	@Column(name = "SHOPPINGTYPE")
	private String type;
	private Integer discount;
	private Integer disAmount;
	private String transactionalNum;
	private String refund;
	
	@Transient
	private String stringDate;
	
	public CartsBean() {
		super();
	}
	
	public CartsBean(Integer itemNo, String username, Integer amount, Date payday, Float points, String wrong,
			String type, Integer discount, Integer disAmount, String transactionalNum, String refund,
			String stringDate) {
		super();
		this.itemNo = itemNo;
		this.username = username;
		this.amount = amount;
		this.payday = payday;
		this.points = points;
		this.wrong = wrong;
		this.type = type;
		this.discount = discount;
		this.disAmount = disAmount;
		this.transactionalNum = transactionalNum;
		this.refund = refund;
		this.stringDate = stringDate;
	}

	

	public CartsBean(String username, String type) {
		super();
		this.username = username;
		this.type = type;
	}
	
	

	public CartsBean(Integer amount,Float points,String username,Integer itemNo,Integer discount,Integer disAmount,String transactionalNum) {
		super();
		this.itemNo = itemNo;
		this.username = username;
		this.amount = amount;
		this.points = points;
		this.discount = discount;
		this.disAmount = disAmount;
		this.transactionalNum = transactionalNum;
	}

	public String getType() {
		if (type.equals("food")) {
			type = "訂餐";
		}else if (type.equals("coupon")) {
			type = "團購券";
		} 
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getStringDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		stringDate = sdf.format(payday);
		return stringDate;
	}

	public void setStringDate(String stringDate) {
		this.stringDate = stringDate;
	}


	public Integer getItemNo() {
		return itemNo;
	}


	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public Integer getAmount() {
		return amount;
	}


	public void setAmount(Integer amount) {
		this.amount = amount;
	}


	public Date getPayday() {
		return payday;
	}


	public void setPayday(Date payday) {
		this.payday = payday;
	}


	public Float getPoints() {
		return points;
	}


	public void setPoints(Float points) {
		this.points = points;
	}


	public String getWrong() {
		return wrong;
	}


	public void setWrong(String wrong) {
		this.wrong = wrong;
	}


	public Integer getDiscount() {
		return discount;
	}


	public void setDiscount(Integer discount) {
		this.discount = discount;
	}


	public Integer getDisAmount() {
		return disAmount;
	}


	public void setDisAmount(Integer disAmount) {
		this.disAmount = disAmount;
	}


	public String getTransactionalNum() {
		return transactionalNum;
	}


	public void setTransactionalNum(String transactionalNum) {
		this.transactionalNum = transactionalNum;
	}


	public String getRefund() {
		return refund;
	}


	public void setRefund(String refund) {
		this.refund = refund;
	}

}
