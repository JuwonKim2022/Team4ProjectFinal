package com.kh.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.service.HistoryService;
import com.kh.vo.HistoryDTO;

@Controller
public class HistoryController {
	@Resource(name = "historyService")
	private HistoryService historyService;

	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String history(Model model) throws Exception {
		List<HistoryDTO> historyList = historyService.selectAll();
		model.addAttribute("historyList", historyList);
		return "history";
	}

	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/history/SearchBoxInsertAndList", method = RequestMethod.POST)
	public List<HistoryDTO> historySearchBoxInsertAndList(Model model, @ModelAttribute HistoryDTO historyDTO) throws Exception {
		int membernumber = 2;
		historyDTO.setMembernumber(membernumber);
		
		historyDTO.setSearch_date(Timestamp.valueOf(LocalDateTime.now()));
		historyService.insertSearchBox(historyDTO);

		List<HistoryDTO> historyList = historyService.selectRecentHistory(membernumber);
		model.addAttribute("historyList", historyList);
		System.out.println(historyList);
		return historyList;
	}

	// 다각형 검색 기록 삽입 및 불러오기 작동
	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/history/PolygonInsertAndList", method = RequestMethod.POST)
	public List<HistoryDTO> historyPolygonInsertAndList(Model model, @ModelAttribute HistoryDTO historyDTO) throws Exception {
		int membernumber = 1;
		historyDTO.setMembernumber(membernumber);
		
		historyDTO.setSearch_date(Timestamp.valueOf(LocalDateTime.now()));
		historyService.insertPolygon(historyDTO);

		List<HistoryDTO> historyList = historyService.selectRecentHistory(membernumber);
		model.addAttribute("historyList", historyList);
		System.out.println(historyList);
		return historyList;
	}

}
