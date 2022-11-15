//package com.kh.controller;
//
//import java.net.URLEncoder;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//@RequestMapping("/login")
//public class LoginController {
//	@GetMapping("/login")
//	public String loginForm() {
//		return "loginForm";
//	}
//	
//	@PostMapping("/login")
//	public String login(String id, String pwd, String rememberId) throws Exception{
//		if(!loginCheck(id,pwd)) {
//			String msg = URLEncoder.encode("아이디 또는 패스워드가 일치하지 않습니다.", "utf-8");
//			return "redirect:/login/login?msg="+msg;
//		}
//		return "redirect:/";
//	}
//
//	private boolean loginCheck(String id, String pwd) {
//		return "asdf".equals(id) && "1234".equals(pwd);
//	}
//}


