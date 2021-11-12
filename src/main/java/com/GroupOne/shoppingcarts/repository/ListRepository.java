package com.GroupOne.shoppingcarts.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.shoppingcarts.model.ListBean;

public interface ListRepository extends JpaRepository<ListBean, Integer> {

//	List<Object[]> findListAmountStatistics(); // 預計新增,尚未使用
	@Query("select l.productName,l.price,SUM(l.number),SUM(l.number*l.price) from ListBean l where l.exist ='Y' and l.refund is null group by l.productName,l.price order by SUM(l.number*l.price) DESC") //hql
	List<Object[]> findListAmountStatistics();
	
//	List<ListBean> findAllByItemno(int itemNo);
	List<ListBean> findByItemNo(int itemNo);
	
//	boolean findByItemnoAndProductname(int itemNo, String productName);
	List<ListBean> findByItemNoAndProductName(int itemNo,String productName);
	
//	void insertList(ListBean listBean);

	
//	void updateByItemno(int number, int itemNo, String productNmae);
	@Modifying(clearAutomatically = true)
	@Query(value = "update List set number = ?1  where itemNo = ?2 and productName = ?3",nativeQuery = true)  //sql
	void updateNumberByItemNoAndProductName(int number, int itemNo, String productName);
	
//	void updateByItemnoAndExist(int number, String exist, int itemNo, String productNmae);
	@Modifying
	@Query(value = "update List set exist = ?1 where itemNo = ?2",nativeQuery = true)
	void updateExistByItemNo(String exist, int itemNo);
	
	@Modifying
	@Query("update ListBean l set l.refund = ?1 where l.itemNo = ?2")
	void updateRefundByItemNo(String refund,int itemNo);
	
//	boolean deleteListByItemNo(ListBean listBean);
	void deleteByItemNoAndExistIsNull(int itemNO);
	
	void deleteByItemNoAndProductName(int itemNo, String productName);
}
