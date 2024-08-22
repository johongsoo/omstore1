package com.web.spring.mainController;



import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.spring.mainService.MainService;
import com.web.spring.productsService.ProductsService;
import com.web.spring.vo.MangbungStore;
import com.web.spring.vo.OdungStore;
import com.web.spring.vo.Users;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired(required=false)
	private MainService service;
	@Autowired(required=false)
	private ProductsService service2;
	

	
	
	//http://localhost:8080/odung
	@RequestMapping("odung")
	public String odung() {
		return "WEB-INF\\products\\odung.jsp";
	}
	
	@RequestMapping("userlist")
	public String userlist(Users user, Model model) {
		model.addAttribute("userlist", service.userlist(user));
		return "";
	}
	
	@GetMapping("loginPage")
	public String loginPage(HttpSession session) {
	    session.removeAttribute("users");
	    return "WEB-INF\\mainpage\\login.jsp";
	}

	@PostMapping("/loginPage")
	public String login(Users users, Model model, HttpSession session, 
	        RedirectAttributes redirectAttributes) {
	    Users loguser = service.login(users);
	    if (loguser != null) {
	        session.setAttribute("users", loguser); // 사용자 정보를 세션에 저장
	        System.out.println("User added to session: " + loguser); // 디버깅용 로그
	        redirectAttributes.addFlashAttribute("msg", "로그인 성공");
	        return "redirect:/MainPage";
	    } else {
	        model.addAttribute("msg", "로그인 실패");
	        return "WEB-INF/mainpage/login.jsp";
	    }
	}
	
	@GetMapping("/checkSession")
	public String checkSession(HttpSession session) {
	    String userId = (String) session.getAttribute("userId");
	    System.out.println("Session userId: " + userId);
	    return "redirect:/MainPage";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
	    session.invalidate(); // 세션을 무효화하여 모든 세션 데이터 삭제
	    redirectAttributes.addFlashAttribute("msg", "로그아웃 성공"); 
	    return "redirect:/MainPage"; // 로그아웃 후 리다이렉트
	}
	
	
	//http://localhost:8080/MainPage
	@GetMapping("MainPage")
	public String MainPage(MangbungStore mangbung, OdungStore odung , Model model) {
		model.addAttribute("odung", service2.odunglist(odung));
		model.addAttribute("mangbung", service2.mangbunglist(mangbung));
		return "WEB-INF\\mainpage\\mainpage.jsp";
	}
	
	

	
    @PostMapping("/ConfirmId")
    @ResponseBody
    public boolean confirmId(@RequestParam("userid") String userid) {
        // 사용자 ID 확인 로직
        return service.checkUserIdAvailability(userid);
    }

    @PostMapping("/sendVerificationEmail")
    @ResponseBody
    public ResponseEntity<String> sendVerificationEmail(@RequestBody Map<String, String> request, HttpServletResponse response) {
        String email = request.get("email");

        if (email == null || email.isEmpty()) {
            return ResponseEntity.badRequest().body("이메일 주소를 입력해 주세요.");
        }

        boolean result = service.sendVerificationEmail(email, response);

        if (result) {
            return ResponseEntity.ok("인증 코드가 성공적으로 발송되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("이메일 발송 실패. 다시 시도해 주세요.");
        }
    }

    @PostMapping("/verifyEmailCode")
    @ResponseBody
    public ResponseEntity<String> verifyEmailCode(@RequestBody Map<String, String> request, HttpServletRequest httpRequest) {
        String email = request.get("email");
        String code = request.get("code");

        if (email == null || email.isEmpty() || code == null || code.isEmpty()) {
            return ResponseEntity.badRequest().body("이메일 주소와 인증 코드를 입력해 주세요.");
        }

        boolean result = service.verifyCode(email, code);

        if (result) {
            HttpSession session = httpRequest.getSession();
            session.setAttribute("emailVerified", true);
            return ResponseEntity.ok("인증 코드가 확인되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("인증 코드가 유효하지 않습니다.");
        }
    }

    @RequestMapping("/register")
    public ModelAndView register() {
        return new ModelAndView("WEB-INF/mainpage/register.jsp");
    }

    @PostMapping("/registerUser")
    @ResponseBody
    public ResponseEntity<String> registerUser(@RequestBody Users user, HttpSession session) {
        // 이메일 인증 코드 검증  
    	//   "VALUES (#{userid}, #{name}, #{pwd}, #{email}, #{birthdate}, #{address},
    	//    #{address1}, #{address2}, #{phone}, #{rating}, #{point})")
        Boolean isVerified = (Boolean) session.getAttribute("emailVerified");
        if (isVerified == null || !isVerified) {
            return ResponseEntity.badRequest().body("이메일 인증을 완료해주세요.");
        }

        try {
            //service.registerUser(user); // 실제 사용자 등록
            session.removeAttribute("emailVerified"); // 인증 상태 제거

            return ResponseEntity.ok(service.registerUser(user));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("회원가입 중 오류 발생: " + e.getMessage());
        }
    }
}
