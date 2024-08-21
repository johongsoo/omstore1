package com.web.spring.produtsController;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.spring.productsService.ProductsService;
import com.web.spring.vo.Cart;
import com.web.spring.vo.MangbungStore;
import com.web.spring.vo.OdungStore;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductsController {
	
	@Autowired(required=false)
	private ProductsService service;
	
	//http://localhost:8080/odunglist
	@RequestMapping("odunglist")
	public String odunglist(OdungStore odung, Model model ) {
		model.addAttribute("odunglist", service.odunglist(odung));
		return "WEB-INF\\products\\odungstore.jsp";
	}
	
	//http://localhost:8080/cart
	@RequestMapping("cart")
	public String productcart() {
		return "WEB-INF\\products\\product-cart.jsp";
	}
	
	//http://localhost:8080/mangbunglist
	@RequestMapping("mangbunglist")
	public String mangbunglist(MangbungStore mangbung, Model model) {
		model.addAttribute("mangbunglist", service.mangbunglist(mangbung));
		return "WEB-INF\\products\\mangbungstore.jsp";
	}
	
	//http://localhost:7070/odungdetail
	@GetMapping("odungdetail")
	public String odungdetail(@RequestParam("productsid") int productsid, Model model){
		model.addAttribute("odung", service.getodungdetail(productsid));
		return "WEB-INF\\products\\odung-detail.jsp";
	}
	
	//http://localhost:7070/mangbungdetail
	@GetMapping("mangbungdetail")
	public String mangbungdetail(@RequestParam("productsid") int productsid, Model model){
		model.addAttribute("mangbung", service.getmangbungdetail(productsid));
		return "WEB-INF\\products\\mangbung-detail.jsp";
	}

	
	//http://localhost:8080/ranklist
	@RequestMapping("ranklist")
	public String ranklist() {
		return "WEB-INF\\products\\ranklist.jsp";
	}
	
	
	//http://localhost:8080/cartlist
	@RequestMapping("cartlist")
	public String cartlist() {
		
		return "WEB-INF\\products\\product-cart.jsp";
	}
	
    private static final Logger logger = LoggerFactory.getLogger(ProductsController.class);

	
	   @PostMapping("/add")
	    public ResponseEntity<String> addToCart(@RequestBody Cart cart) {
	        // 수신된 데이터 확인
	        logger.info("Received Cart Data:");
	        logger.info("User ID: {}", cart.getUserid());
	        logger.info("Product img: {}", cart.getProduct_img());
	        logger.info("Product Name: {}", cart.getProduct_name());
	        logger.info("Product Price: {}", cart.getProduct_price());
	        logger.info("Quantity: {}", cart.getQuantity());

	        try {
	            BigDecimal productPrice = cart.getProduct_price();

	            if (productPrice == null) {
	                throw new IllegalArgumentException("Product price cannot be null");
	            }

	            service.addToCart(
	                cart.getUserid(),
	                cart.getProduct_img(),
	                cart.getProduct_name(),
	                productPrice,
	                cart.getQuantity()
	            );

	            // 데이터가 올바르게 전달되었는지 로그 확인
	            logger.info("Item added to cart.");

	            return ResponseEntity.ok("{\"success\": true}");

	        } catch (SQLException e) {
	            logger.error("Failed to add item to cart", e);
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body("{\"success\": false, \"message\": \"Failed to add item to cart\"}");
	        } catch (IllegalArgumentException e) {
	            logger.error("Invalid argument: {}", e.getMessage(), e);
	            return ResponseEntity.badRequest()
	                                 .body("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
	        } catch (Exception e) {
	            logger.error("Unexpected error occurred", e);
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body("{\"success\": false, \"message\": \"Unexpected error occurred\"}");
	        }
	    }
	
	
    @GetMapping("/cart")
    public String productCart(HttpSession session, Model model) {
        // 세션에서 사용자 ID 가져오기
        String userId = (String) session.getAttribute("userId");
        
        if (userId != null) {
            // 사용자 ID에 따라 장바구니 항목 조회
            List<Cart> cartItems = service.getCartByUserId(userId);
            model.addAttribute("cartItems", cartItems);
        } else {
            // 사용자 ID가 없는 경우
            model.addAttribute("errorMessage", "User not logged in.");
        }
        
        return "WEB-INF/products/product-cart.jsp";
    }
}
