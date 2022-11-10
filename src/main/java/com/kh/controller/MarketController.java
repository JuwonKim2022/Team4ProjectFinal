package com.kh.controller;

import java.io.FileWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.component.RManager;
import com.kh.service.HistoryService;
import com.kh.service.MarketService;
import com.kh.vo.HistoryDTO;
import com.kh.vo.MarketDTO;

@Controller
public class MarketController {
	boolean searchTrigger = false;

	@Resource(name = "marketService")
	private MarketService marketService;

	@Resource(name = "historyService")
	private HistoryService historyService;

	@Autowired
	private RManager rm;

	@RequestMapping(value = "/MarketMapPage", method = RequestMethod.GET)
	public String MapGet() {
		return "MarketMapPage";
	}

	// 작동: 검색 및 검색기록 조회 / 회원번호, 년도, 분기 설정 필요
	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/SearchInsertHistory", method = RequestMethod.POST)
	public List<HistoryDTO> SearchInsertHistory(Model model, @RequestParam String searchText, HistoryDTO historyDTO) throws Exception {

		int membernumber = 1;
		int marketyear = 2021;
		int marketquarter = 1;

		if (searchText.contains("구")) {
			historyDTO.setMembernumber(membernumber); // 회원번호
			historyDTO.setMarketyear(marketyear); // 년도
			historyDTO.setMarketquarter(marketquarter); // 분기
			historyDTO.setDistrict(searchText);
			historyDTO.setSearch_date(Timestamp.valueOf(LocalDateTime.now()));
			historyService.insertSearchBox(historyDTO);
		} else {
			String returnDistrict = marketService.returnDistrict(searchText);
			historyDTO.setMembernumber(membernumber); // 회원번호
			historyDTO.setMarketyear(marketyear); // 년도
			historyDTO.setMarketquarter(marketquarter); // 분기
			historyDTO.setBd_codename(searchText);
			historyDTO.setDistrict(returnDistrict);
			historyDTO.setSearch_date(Timestamp.valueOf(LocalDateTime.now()));
			historyService.insertSearchBox(historyDTO);
		}

		List<HistoryDTO> historyList = historyService.selectRecentHistory(membernumber);
		model.addAttribute("historyList", historyList);
		
		return historyList;
	}

	// 작동: 정보 조회 / 회원번호, 년도, 분기 설정 필요
	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/marketAnalysis", method = RequestMethod.POST)
	public List<MarketDTO> marketAnalysis(Model model, @RequestParam String searchText) throws Exception {

		if (searchText.contains("구")) {
			List<MarketDTO> marketList = marketService.selectDataByDYQ(searchText);
			model.addAttribute("marketList", marketList);
			return marketList;
		} else {
			String returnDistrict = marketService.returnDistrict(searchText);
			List<MarketDTO> marketList = marketService.selectDataByDYQ(returnDistrict);
			model.addAttribute("marketList", marketList);
			return marketList;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/RTest", method = RequestMethod.POST)
	public void modal(HttpServletRequest request, @RequestParam String bd_codename) throws Exception {
		ServletContext context = request.getSession().getServletContext();
		String csvPath = context.getRealPath("/resources/csv/");
		String district = null;
		if (searchTrigger == true)
			district = marketService.returnDistrict(bd_codename);
		else
			district = bd_codename;

		System.out.println("*********************" + district + "*********************");

		List<MarketDTO> marketList = marketService.selectRData(district);
		String csv = "marketyear, marketquarter, marketquartersales, marketquartercount, marketofstores\n";
		for (MarketDTO marketDTO : marketList)
			csv += marketDTO.getMarketyear() + "," + marketDTO.getMarketquarter() + ","
					+ marketDTO.getMarketquartersales() + "," + marketDTO.getMarketquartercount() + ","
					+ marketDTO.getMarketofstores() + "\n";
		try {
			FileWriter fw = new FileWriter(csvPath + "r.csv");
			fw.write(csv);
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("R연결 시도");
		rm.rGraph();
		System.out.println("R연결 종료");
	}
}
