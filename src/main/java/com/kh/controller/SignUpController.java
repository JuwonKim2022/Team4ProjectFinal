package com.kh.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.vo.UserVO;
import com.kh.service.SignUpService;

@Controller
@RequestMapping(value = "/signUp/*")
public class SignUpController {
	
	private static final Logger l = LoggerFactory.getLogger(SignUpController.class);
	
	@PostMapping("/signUp/join")
    public String insertIdPostd(UserVO userVO,HttpServletRequest req,RedirectAttributes rtt) throws SQLException {

		
		String  pw = req.getParameter("pw");
		String  EncoderPw= "";
		EncoderPw = Encoder.encode(pw);
		userVO.setPw(EncoderPw);
			if(Encoder.matches(pw, EncoderPw)){
			 service.insertSignUp(userVO); 
				l.info("유저등록 완료");
		}else {
					
			l.info("유저등록 실패");
			
		}
			return "index";
	
      }
	
	   // AJAX 아이디 체크
	   @RequestMapping(value = "/signUp/UserIdChk", method = RequestMethod.GET)
	   @ResponseBody
	   public String Id(HttpServletRequest req,UserVO userVo) throws Exception {
	      l.info("ajax 아이디 중복 검사");
	      
	        //jsp에 있는 id-input을 받음
	      String id = req.getParameter("memberId");
	      //sql 실행해서 데이터를 저장
	      UserVO user = service.readSignUp(id);   
	      //ajax에 리턴할 변수
	      //id가 이미 있는지 if을 통하여 다른 결과값을 jsp로 리턴!
	      String result;
	      if (user == null) {
	         l.info("userid null");
	         result = "0";

	      } else {
	         l.info("userid not null");
	         result = "1";
	      }
	      return result;
	   }

	   
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	//3-1. 서비스 처리 객체를 주입(DI)
		@Inject
		private SignUpService service;
		@Autowired
		BCryptPasswordEncoder Encoder;
	
	/* 회원가입 처리하는 동작 */
	//insert라는 하나의 주소로 get과 post방식 즉 입력과 출력 둘 다 처리 가능

	// http://localhost:8088/test/insert
	// http://localhost:8088/test/signUp/insert
	// http://localhost:8088/signUp/insert
	
		 @RequestMapping(value = "/signUp", method = RequestMethod.GET)
		   // value="/signUp/insert"에서 member를 빼도 됨
		   public String insertGET() throws Exception {
		      l.info("C: 회원가입 입력페이지 GET");
		      return "/signUp/signUp";
		   }
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	//value="/signUpr/insertPro"에서 member를 빼도 됨
	public String insertPOST(UserVO userVo) throws Exception{
		
		//1. 한글처리 : request객체가 없다 => web.xml에서 filter태그로 인코딩해야한다.
		
		//2. 전달된 파라미터 받기
		//request.getParameter라는 내장객체가 없다. 따라서 메서드의 매개변수를 통해 가져올 수 있다.
		//l.info("C: "+ request.getParameter()); 에러발생
		l.info("C: "+ userVo);
		
		//3. 서비스객체 생성(직접생성안하고 의존주입)
		//3-2. 서비스객체호출
		service.insertSignUp(userVo);		
		l.info("C: 회원가입 처리페이지 POST");
		
		//4. 로그인페이지로 이동(주소줄과 view페이지 동시에 insert->login 변경되어야함)
		return "redirect:/login";
	}
	
	
	
	
	
	/* 로그인 기능 */
	// http://localhost:8088/signUp/login

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception{
		l.info("C: 로그인 입력페이지 GET");
		return "signUp/loginForm";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	//public String loginPOST(@ModelAttribute("userid") String id, @ModelAttribute("userpw") String pw) throws Exception{
	public String loginPOST(UserVO userVo, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception{
		l.info("C: 로그인 처리페이지 POST");
		
		//1.한글처리 => web.xml에서 완료
		
		//2.전달받은 파라미터 저장 => loginPOST()메서드의 파라미터값으로 저장함.
		l.info("C: "+ userVo.getId() + userVo.getPw());
		
		//3.서비스객체생성 => 22번째 코드로 의존주입완료
		//4.서비스 로그인 체크 동작(HttpSession)
		UserVO returnVO = service.loginSignUp(userVo);
		l.info("C: 리턴VO결과(서비스에서 예외처리를 진행했으므로 null이 출력되면 코드에 문제있다는 의미) "+returnVO);
		
		//5.메인페이지로 이동(주소줄과 view페이지 동시에 main으로 변경되어야함)
		// 해당 정보 있는 경우 : => main페이지로 이동
		//if(returnVO.getUserid() != null) {
		//에러가 발생하는 이유:
		if(returnVO != null) {
			//5.세션값생성
			httpSession.setAttribute("id", returnVO.getId());
			
			//RedirectAttributes의 addAttribute메서드 사용해보려고 했으나 실패. 에러 발생
			//Map<String, Object> map = new HashMap<String, Object>();
			//map.put("username", returnVO.getUsername());
			//map.put("useremail", returnVO.getUseremail());
			//rttr.addAttribute("mvo", map);
			
			//addAttribute는 값을 지속적으로 사용해야할때 addFlashAttribute는 일회성으로 사용해야할때 사용해야함.
			redirectAttributes.addFlashAttribute("mvo", returnVO);
			//l.info("C: 모델에 뭐 들어있니?"+model);
			return "redirect:/index"; 
		} else {
			// 해당 정보 없는 경우 : => login페이지로 이동
			return "redirect:signUp/login";
		}
	}//end of loginPOST()
}