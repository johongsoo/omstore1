package com.web.spring.mainService;





import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Service;

import com.web.spring.mainDao.MainDao;
import com.web.spring.vo.Users;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;




@Service
public class MainService {

	@Autowired(required=false)
	private MainDao dao;
	
	public List<Users> userlist(Users user) {
		if(user.getUserid()==null) user.setUserid("");
		if(user.getPwd()==null) user.setPwd("");
		if(user.getRating()==null) user.setRating("");
		
		user.setUserid("%"+user.getUserid()+"%");
		user.setPwd("%"+user.getPwd()+"%");
		user.setRating("%"+user.getRating()+"%");
		return dao.userlist(user);
	}
	
	public Users login(Users users) {
		return dao.login(users);
	}
	
    public boolean checkUserIdAvailability(String userid) {
        // 사용자 ID 존재 여부를 확인
        return dao.countUserId(userid) == 0; // ID가 존재하지 않으면 true를 반환
    }

    @Autowired
    private JavaMailSender mailSender;

    private final Map<String, String> verificationCodes = new ConcurrentHashMap<>();

    public String generateVerificationCode() {
        Random random = new Random();
        return String.valueOf(100000 + random.nextInt(900000)); // 6자리 인증 코드 생성
    }

    public boolean sendVerificationEmail(String email, HttpServletResponse response) {
        String code = generateVerificationCode(); // 인증 코드 생성
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");

            helper.setTo(email);
            helper.setSubject("이메일 본인 인증 코드");
            helper.setText("인증 코드: " + code);

            mailSender.send(message);

            // 인증 코드 저장
            saveVerificationCode(email, code);

            return true;
        } catch (MessagingException e) {
            System.err.println("메일 발송 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            System.err.println("기타 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    private void saveVerificationCode(String email, String code) {
        verificationCodes.put(email, code); // 이메일과 코드 저장
    }

    public boolean verifyCode(String email, String code) {
        String storedCode = verificationCodes.get(email);
        return storedCode != null && storedCode.equals(code); // 저장된 코드와 비교
    }

    public String registerUser(Users user) {
        System.out.println("Registering user: " + user);  // 사용자 정보 출력
        // dao.registerUser(user); // 사용자 등록 로직 (dao 필요)
        System.out.println("User registered successfully.");  // 로그 추가
        return dao.registerUser(user)>0?"회원가입이 성공적으로 완료되었습니다!":"회원 가입 실패!";
    }
}


	

