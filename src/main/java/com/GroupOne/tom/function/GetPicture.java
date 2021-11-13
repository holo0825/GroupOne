package com.GroupOne.tom.function;

import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.GroupOne.tom.model.SellerProductBean;
import com.GroupOne.tom.seller.service.SellerService;

@Controller
public class GetPicture {
	
	SellerService sellerService;
	ServletContext servletContext;
	
	@Autowired
	public GetPicture(SellerService sellerService,ServletContext servletContext) {
		super();
		this.sellerService = sellerService;
		this.servletContext = servletContext;
	}
	
	@GetMapping("/getPictureSeller/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp,
			@ModelAttribute("pro") SellerProductBean Seller) {
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		// 用ID找到所有資料
		System.out.println("----------------getProductImage------>" );
		
		Optional<SellerProductBean> bean2 = sellerService.findById(Seller.getId());
		System.out.println("----------------getProductImage2------>" + bean2.get().getProductImage());
		
		SellerProductBean  bean=bean2.get();
		System.out.println("----------------getProductImage3------>" + bean2.get().getProductImage());
		
		
//			
				try { // 找長度
//					len = (int) blob.length();
//					media = blob.getBytes(1, len); // 地1個位元組(JDBC都是從1開始 0會掛掉)-最後一個取出放入
					media=bean.getPicture();
					System.out.println("----------------有圖片哦------------filename--->" + filename);
				} catch (Exception e) {
					System.out.println("----------------圖片錯誤-------------");
					throw new RuntimeException("MemberController的getPicture()發生SQLException: " + e.getMessage());
				}
		
		// 不要放去快取區
		System.out.println("----------------快取前-------------");
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		System.out.println("----------------快取後-------------");

		MediaType mediaType;
		
			mediaType = MediaType.valueOf("image/jpg");
		
		System.out.println("----------------getMimeType 轉MediaType後-------------");
		System.out.println("mediaTypeForm member =" + mediaType);

		headers.setContentType(mediaType);
		// 開始建立
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
}
