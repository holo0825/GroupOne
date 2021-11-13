package com.GroupOne.Albert.forgotPassword;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.GroupOne.Albert.members.Member;

import net.bytebuddy.utility.RandomString;

@Controller
public class ForgotPasswordController {

	private JavaMailSender mailSender;
     
    private ForgotPasswordServices forgotPasswordServices;
    
    @Autowired
    public ForgotPasswordController(JavaMailSender mailSender, ForgotPasswordServices forgotPasswordServices) {
		this.mailSender = mailSender;
		this.forgotPasswordServices = forgotPasswordServices;
	}

	// 顯示忘記密碼表單
    @GetMapping("/forgot_password")
    public String showForgotPasswordForm() {
//    	return "forgot_password_form";
    	return "Members/_new_forgot_password_form";
    }

    /*
     * a random String is generated as reset password token using the RandomString class from the net.bytebuddy.utility package. 
     * ByteBuddy is a library comes with Spring Boot so you don’t have to declare any new dependency.
     * */
    // 處理忘記密碼請求，並寄送忘記密碼的email
    @PostMapping("/forgot_password")
    public String processForgotPassword(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String token = RandomString.make(30);
         
        try {
            forgotPasswordServices.updateResetPasswordToken(token, email);
            String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
            sendEmail(email, resetPasswordLink);
//            model.addAttribute("message", "We have sent a reset password link to your email. Please check.");
            model.addAttribute("message", "我們已將重設密碼連結寄出，請至您的信箱確認。");
             
        } catch (MemberNotFoundException ex) {
            model.addAttribute("error", ex.getMessage());
        } catch (UnsupportedEncodingException | MessagingException e) {
//            model.addAttribute("error", "Error while sending email");
            model.addAttribute("error", "寄出e-mail時發生錯誤");
        }
             
//        return "forgot_password_form";
        return "Members/_new_forgot_password_form";
    }
     
    // 寄送重設密碼請求email的Controller方法
    public void sendEmail(String recipientEmail, String link)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = mailSender.createMimeMessage();              
        MimeMessageHelper helper = new MimeMessageHelper(message);
         
//        helper.setFrom("contact@shopme.com", "Shopme Support");
        helper.setFrom("littleel218@gmail.com", "聚點時刻 客服");
        helper.setTo(recipientEmail);
         
//        String subject = "Here's the link to reset your password";
        String subject = "專屬您的重設密碼連結已送到";
         
//        String content = "<p>Hello,</p>"
//        		+ "<p>You have requested to reset your password.</p>"
//        		+ "<p>Click the link below to change your password:</p>"
//        		+ "<p><a href=\"" + link + "\">Change my password</a></p>"
//        		+ "<br>"
//        		+ "<p>Ignore this email if you do remember your password, "
//        		+ "or you have not made the request.</p>";
        String content = "<p>您好，</p>"
                + "<p>您已申請重設密碼。</p>"
                + "<p>請點擊以下連結開始重設您的密碼：</p>"
                + "<p><a href=\"" + link + "\">重設密碼</a></p>"
                + "<br>"
                + "<p>如果您記得密碼，或沒有申請重設密碼， "
                + "請忽略這封e-mail。</p>";
         
        helper.setSubject(subject);
         
        helper.setText(content, true);
         
        mailSender.send(message);
    }  
     
    // 顯示重設密碼表單 
    @GetMapping("/reset_password")
    public String showResetPasswordForm(@Param(value = "token") String token, Model model) {
    	// added to prevent empty token and javax.persistence.NonUniqueResultException
    	if (token==null) {
			return "redirect:/";
		}
    	//=============================================================================
    	Member member = forgotPasswordServices.getByResetPasswordToken(token);
        model.addAttribute("token", token);
         
        if (member == null) {
//            model.addAttribute("message", "Invalid Token");
            model.addAttribute("message", "密碼重設連結無效");
//            return "message";
            return "Members/message";
        }
         
//        return "reset_password_form";
        return "Members/_new_reset_password_form";
    }
     
    // 處理重設密碼表單
    @PostMapping("/reset_password")
    public String processResetPassword(HttpServletRequest request, Model model) {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
         
        Member member = forgotPasswordServices.getByResetPasswordToken(token);
//        model.addAttribute("title", "Reset your password");
        model.addAttribute("title", "請重設您的密碼");
         
        if (member == null) {
//            model.addAttribute("message", "Invalid Token");
            model.addAttribute("message", "密碼重設連結無效");
//            return "message";
            return "Members/message";
        } else {           
            forgotPasswordServices.updatePassword(member, password);
             
//            model.addAttribute("message", "You have successfully changed your password.");
            model.addAttribute("message", "您已成功變更密碼。");
        }
         
//        return "message";
        return "Members/message";
    }
}