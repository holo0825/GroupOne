package com.GroupOne.shoppingcarts.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "list")
public class ListBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer itemNo;
	private String productName;
	private Integer number;
	private Integer price;
	private String exist;
	private String refund;
	private Integer typeId;
	
	
	
	
	public ListBean() {
		super();
	}
	public ListBean(Integer id, Integer itemNo, String productName, Integer number, Integer price, String exist,
			String refund, Integer typeId) {
		super();
		this.id = id;
		this.itemNo = itemNo;
		this.productName = productName;
		this.number = number;
		this.price = price;
		this.exist = exist;
		this.refund = refund;
		this.typeId = typeId;
	}
	
	public ListBean(Integer itemNo, String productName, Integer number, Integer price, Integer typeId) {
		super();
		this.itemNo = itemNo;
		this.productName = productName;
		this.number = number;
		this.price = price;
		this.typeId = typeId;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getItemNo() {
		return itemNo;
	}
	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getExist() {
		return exist;
	}
	public void setExist(String exist) {
		this.exist = exist;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	
}
