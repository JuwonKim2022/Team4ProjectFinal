package com.kh.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.service.MemberService;
import com.kh.vo.MemberVO;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	@Autowired
	BCryptPasswordEncoder Encoder;
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("get login");

		return "/member/login";
	}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String loginP(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");

		HttpSession session = req.getSession();
		
		try {
			// ID로 DB에 유저검색
			MemberVO login = service.login(vo.getId());
			// 검색한 유저 정보 중 비밀번호를 저장
			String DBPassword = login.getPw();
			// JSP에 입력한 비밀번호 저장
			String password = vo.getPw();
			logger.info("데이터베이스저장된 비밀번호" + DBPassword);
			logger.info("JPS화면에 입력한 비밓번호" + password);
			logger.info("login.getPw()" + login.getPw());
			
			String id = login.getId();
			if(id==null) {
				session.setAttribute("member", "noId");
				return "redirect:/member/login";
			} else {
			
				if (Encoder.matches(password, DBPassword)) {
					logger.info("로그인 성공");
					session.setAttribute("member", login);
					session.setAttribute("member_no", login.getMember_no());
					System.out.println(login);
					return "redirect:/";
				} else {
					session.setAttribute("member", null);
					rttr.addFlashAttribute("msg", false);
					logger.info("로그인 실패");
					return "redirect:/member/login";
				}	
			}
			
		}catch(NullPointerException e){
			e.printStackTrace();
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			logger.info("아이디없음");
			return "redirect:/member/login";
		}
		
		
	}
		
		

	/*
	String address1 = req.getParameter("sample6_address"); //주소1
	   String postcode = req.getParameter("sample6_postcode");  //주소2
	   String detailAddress = req.getParameter("sample6_detailAddress");  //주소3
	   String address = postcode+"/"+ address1+"/"+detailAddress; //주소 하나로 합침

	   userVO.setAddress(address);  //주소등록
	
	String  pw = req.getParameter("pw");
	String  EncoderPw= "";
	EncoderPw = Encoder.encode(pw);
	userVO.setPw(EncoderPw);
		if(Encoder.matches(pw, EncoderPw)){
		 service.insertSignUp(userVO); 
			l.info("유저등록 완료");
	*/
	
	
	
	
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}
}