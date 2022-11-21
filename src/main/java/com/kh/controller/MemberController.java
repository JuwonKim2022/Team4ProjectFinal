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
			if (id == null) {
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

		} catch (NullPointerException e) {
			e.printStackTrace();
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			logger.info("아이디없음");
			return "redirect:/member/login";
		}

	}

	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// 아이디 찾기 GET
	@RequestMapping(value = "/member/findId", method = RequestMethod.GET)
	public String findId(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("Find Id Page");
		return "/member/findId";
	}

	// 아이디 찾기 POST
	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
	public String findIdAction(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		MemberVO memberVO = service.findId(vo);
		logger.info("Find Id Page Execution");
		if (memberVO == null) {
			rttr.addFlashAttribute("check", 1);
		} else {
			rttr.addFlashAttribute("check", 0);
			rttr.addFlashAttribute("id", memberVO.getId());
		}
		return "redirect:/member/findId";
	}

}