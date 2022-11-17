package com.kh.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.service.HistoryService;
import com.kh.vo.HistoryDTO;
import com.kh.vo.MemberVO;

@Controller
public class MyInfoController {
	@Resource(name = "historyService")
	private HistoryService historyService;

	@RequestMapping(value = "SignUp/myInformation", method = RequestMethod.GET)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		return "SignUp/myInformation";
	}

	@ResponseBody
	@RequestMapping(value = "/myInfo/getHistory", method = RequestMethod.GET)
	public List<HistoryDTO> getHistory(HttpServletRequest request, Model model) throws Exception {

		HttpSession session = request.getSession();
		int member_no = (int) session.getAttribute("member_no");
		System.out.println("myInfoHistory: " + member_no);

		List<HistoryDTO> historyList = historyService.selectAllRecentHistory(member_no);
		model.addAttribute("historyList", historyList);
		
		System.out.println(historyList);

		return historyList;
	}
}
