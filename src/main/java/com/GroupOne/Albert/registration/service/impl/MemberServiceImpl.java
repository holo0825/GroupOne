package com.GroupOne.Albert.registration.service.impl;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.registration.repository.RegisterMemberRepository;

//import _00_init.util.GlobalService;
import com.GroupOne.Albert.registration.service.MemberService;

import net.bytebuddy.utility.RandomString;

@Service
public class MemberServiceImpl implements MemberService {
	private static Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);

	RegisterMemberRepository registerMemberRepo;
	
	JavaMailSender mailSender;
	
//	SessionFactory factory;
	@Autowired
	public MemberServiceImpl(RegisterMemberRepository memberDao, JavaMailSender mailSender) {
		this.registerMemberRepo = memberDao;
		this.mailSender = mailSender;
//		this.factory = factory;
	}
	
//	public MemberServiceImpl(MemberDao memberDao) {
//		this.memberDao = memberDao;
//		this.factory = HibernateUtils.getSessionFactory();
//	}
	@Transactional
	@Override
	public void save(Member mb) {
//	public void save(MemberBean mb) {
		log.info("會員註冊功能之Service: 儲存會員資料");
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			registerMemberRepo.save(mb);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null)  
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
	}
	@Transactional
	@Override
	public boolean existsById(String id) {
		log.info("會員註冊功能之Service: 檢查會員輸入的編號是否已被使用");
		boolean exist = false;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			exist = registerMemberRepo.existsById(id);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null)  
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
		return exist;
	}
	@Transactional
	@Override
	public Member findByUsername(String username) {
//	public MemberBean findByMemberId(String id) {
		log.info("會員註冊功能之Service: 由會員編號找出對應的會員");
//		MemberBean mb = null;
		Member mb = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			mb = registerMemberRepo.findByUsername(username);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null) 
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
		return mb;
	}

	/*
	 * 功能：檢查客戶的未付款訂購金額。 說明：處理客戶訂單時，[訂單的總金額 + 該客戶的未付款餘額]不能超過限額， 此限額定義在
	 * GlobalService類別的常數: ORDER_AMOUNT_LIMIT 步驟： 1. 取出 OrderBean 內的訂單的總金額 1.
	 * 取出Member表格內的 Member#unpaid_amount欄位(未付款餘額) 2.
	 * unpaid_amount加上本訂單的總金額後，檢查該數值是否超過限額 (GlobalService.ORDER_AMOUNT_LIMIT)。
	 * 如果超過限額， 則 該訂單不予處裡， 丟出UnpaidOrderAmountExceedingException，
	 * 否則呼叫memberDao#updateUnpaidAmount(ob)：執行更新Member表格的 unpaid_amount欄位:
	 * Member#unpaid_amount += currentAmount;
	 */
//	@Transactional
//	@Override
//	public void checkUnpaidAmount(OrderBean ob) {
//		log.info("處理訂單之Service: 由會員編號找出對應的會員，計算新的未付款餘額");
////		Session session = factory.getCurrentSession();
////		Transaction tx = null;
////		try {
////			tx = session.beginTransaction();
//			double currentAmount = ob.getTotalAmount(); // 取出該訂單的總金額
//			double unpaidAmount = findByMemberId(ob.getMemberId()).getUnpaid_amount();
//			if (currentAmount + unpaidAmount > GlobalService.ORDER_AMOUNT_LIMIT) {
//				log.info("處理訂單之Service: 未付款金額超過限額: " + (currentAmount + unpaidAmount));
//				throw new UnpaidOrderAmountExceedingException("未付款金額超過限額: " 
//							+ (currentAmount + unpaidAmount));
//			} 
//			log.info("處理訂單之Service: 未付款金額並未超過限額，立即呼叫memberDao更新會員的未付款餘額");
//			memberDao.updateUnpaidAmount(ob);
////			tx.commit();
////		} catch (Exception ex) {
////			if (tx != null)
////				tx.rollback();
////			ex.printStackTrace();
////			throw new RuntimeException(ex);
////		}
//	}
	
	@Transactional	
	@Override
	public Member findByUsernameAndPassword(String username, String password) {
//	public MemberBean findByMemberIdAndPassword(String memberId, String password) {
//		Session session = factory.getCurrentSession();
//		MemberBean mb = null;
		Member mb = null;
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			mb = registerMemberRepo.findByUsernameAndPassword(username, password);
	    	log.info("會員登入功能之Service: 檢查帳號/密碼結果:" 
					+ (mb == null? "帳號/密碼正確" : "帳號/密碼錯誤"));
//	    	tx.commit();
//		} catch (Exception ex) {
//			if (tx != null)
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
		return mb;
	}

	//--------------------------------------------------------------------------------------
	
//	public void register(User user, String siteURL) 
	public void register(Member user, String siteURL) 
			throws UnsupportedEncodingException, MessagingException {
//		String encodedPassword = passwordEncoder.encode(user.getPassword());
//		user.setPassword(encodedPassword);
//		
//		String TrimmedEmail = user.getEmail().trim();
//		user.setEmail(TrimmedEmail);
//		
		String randomCode = RandomString.make(64);
		user.setVerificationCode(randomCode);
		user.setEnabled(false);
		
//		repo.save(user);
		registerMemberRepo.save(user);
		
		sendVerificationEmail(user, siteURL);
	}
	
//	private void sendVerificationEmail(User user, String siteURL) 
	public void sendVerificationEmail(Member user, String siteURL) 
			throws MessagingException, UnsupportedEncodingException {
		String toAddress = user.getEmail();
//		String toAddress = IDNMailHelper.toIdnAddress(user.getEmail());
		
//		String fromAddress = "your email address";
		String fromAddress = "littleel218@gmail.com";
//		String senderName = "your company name";
		String senderName = "聚點時刻";
		
//		String subject = "請完成您的信箱驗證 | 一般會員註冊";
		String subject;
		switch (user.getMemberRole()) {
		case ROLE_USER:
			subject = "請完成您的信箱驗證 | 一般會員註冊";
			break;
		case ROLE_SELLER:
			subject = "請完成您的信箱驗證 | 商家會員註冊";
			break;
		default:
			subject = "請完成您的信箱驗證 | 會員註冊";
			break;
		}
		
		
		String content = "親愛的 [[name]],<br>"
				+ "請先點選以下連結完成信箱驗證：<br>"
				+ "<h3><a href=\"[[URL]]\" target=\"_self\">驗證信箱</a></h3>"
				+ "感謝您的合作，<br>"
				+ "聚點時刻";
		
		MimeMessage message = mailSender.createMimeMessage();
//		MimeMessageHelper helper = new MimeMessageHelper(message);
		MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");
		
		helper.setFrom(fromAddress, senderName);
		helper.setTo(toAddress);
		helper.setSubject(subject);
		
//		content = content.replace("[[name]]", user.getFullName());
		content = content.replace("[[name]]", user.getFullname());
		String verifyURL = siteURL + "/verify?code=" + user.getVerificationCode();
		
		content = content.replace("[[URL]]", verifyURL);
		
		helper.setText(content, true);
		
		mailSender.send(message);
		
		System.out.println("Email has been sent");
	}
	
	public boolean verify(String verificationCode) {
//		User user = repo.findByVerificationCode(verificationCode);
		Member user = registerMemberRepo.findByVerificationCode(verificationCode);
		
//		if (user == null || user.isEnabled()) {
		if (user == null || user.getEnabled()) {
			return false;
		} else {
			user.setVerificationCode(null);
			user.setEnabled(true);
//			repo.save(user);
			registerMemberRepo.save(user);
			
			return true;
		}
	}
	
	// 檢查是否已經註冊過email
	public Member findByEmail(String email) {
//	public User findByEmail(String email) {
		return registerMemberRepo.findByEmail(email);
//		return repo.findByEmail(email);
	};
			
	//--------------------------------------------------------------------------------------
	

	
}
