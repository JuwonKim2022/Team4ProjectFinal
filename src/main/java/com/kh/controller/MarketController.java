package com.kh.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.net.URL;
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
import com.kh.vo.MarketOpenCloseDTO;

@Controller
public class MarketController {
	@Resource(name = "marketService")
	private MarketService marketService;

	@Resource(name = "historyService")
	private HistoryService historyService;

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private RManager rm;

	@RequestMapping(value = "/MarketMapPage", method = RequestMethod.GET)
	public String MapGet() {
		return "MarketMapPage";
	}

	// 작동: 검색 및 검색기록 조회 / 회원번호 설정 필요
	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/SearchInsertHistory", method = RequestMethod.POST)
	public List<HistoryDTO> SearchInsertHistory(Model model, @RequestParam String searchText, @RequestParam int marketyear, @RequestParam int marketquarter, HistoryDTO historyDTO) throws Exception {

		int member_no = 1;

		if (searchText.contains("구")) {
			historyDTO.setMember_no(member_no); // 회원번호
			historyDTO.setMarketyear(marketyear); // 년도
			historyDTO.setMarketquarter(marketquarter); // 분기
			historyDTO.setDistrict(searchText);
			historyDTO.setSearch_date(Timestamp.valueOf(LocalDateTime.now()));
			historyService.insertSearchBox(historyDTO);
		} else {
			String returnDistrict = marketService.returnDistrict(searchText);
			historyDTO.setMember_no(member_no); // 회원번호
			historyDTO.setMarketyear(marketyear); // 년도
			historyDTO.setMarketquarter(marketquarter); // 분기
			historyDTO.setBd_codename(searchText);
			historyDTO.setDistrict(returnDistrict);
			historyDTO.setSearch_date(Timestamp.valueOf(LocalDateTime.now()));
			historyService.insertSearchBox(historyDTO);
		}

		List<HistoryDTO> historyList = historyService.selectRecentHistory(member_no);
		model.addAttribute("historyList", historyList);
		
		return historyList;
	}

	// 작동: 정보 조회 / 회원번호 설정 필요
	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/marketAnalysis", method = RequestMethod.POST)
	public List<MarketDTO> marketAnalysis(Model model, @RequestParam String searchText, @RequestParam int marketyear, @RequestParam int marketquarter) throws Exception {

		if (searchText.contains("구")) {
			List<MarketDTO> marketList = marketService.selectDataByDYQ(searchText, marketyear, marketquarter);
			model.addAttribute("marketList", marketList);
			return marketList;
		} else {
			String returnDistrict = marketService.returnDistrict(searchText);
			List<MarketDTO> marketList = marketService.selectDataByDYQ(returnDistrict, marketyear, marketquarter);
			model.addAttribute("marketList", marketList);
			return marketList;
		}
	}

	// 미작동: R
	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/modal", method = RequestMethod.POST)
	public void modal(HttpServletRequest request, @RequestParam String searchText) throws Exception {
		String district = null;
		String webappRoot = servletContext.getRealPath("/");
		
		File Folder = new File(webappRoot + File.separator + "resources" + File.separator + "csv");
		if(!Folder.exists())  {
			try {
				Folder.mkdir();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		String csvFolder = webappRoot + File.separator + "resources" + File.separator + "csv" + File.separator;
		String graphFolder = webappRoot + File.separator + "resources" + File.separator + "graph" + File.separator;
		
		if (searchText.contains("구")) {
			district = searchText;
		} else {
			district = marketService.returnDistrict(searchText);
		}
		
		List<MarketDTO> marketList = marketService.selectRbargraphData(district);
		String bargraphCSV = "marketyear, marketquarter, marketquartersales, marketquartercount, marketofstores\n";
		for (MarketDTO marketDTO : marketList)
			bargraphCSV += marketDTO.getMarketyear() + "," + marketDTO.getMarketquarter() + "," + marketDTO.getMarketquartersales() + "," + marketDTO.getMarketquartercount() + "," + marketDTO.getMarketofstores() + "\n";

		try {
			FileWriter fw = new FileWriter(csvFolder + "bargraph.csv");
			fw.write(bargraphCSV);
			fw.flush();
			fw.close();
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		List<MarketOpenCloseDTO> marketOpenCloseList = marketService.selectRpiegraphData(district);
		String piegraphCSV = "marketyear, marketopen, marketclose , marketofstores\n";
		for (MarketOpenCloseDTO marketopencloseDTO : marketOpenCloseList)
			piegraphCSV += marketopencloseDTO.getMarketyear() + "," + marketopencloseDTO.getMarketopen() + "," + marketopencloseDTO.getMarketclose() + "," + marketopencloseDTO.getMarketofstores() + "\n";

		try {
			FileWriter fw = new FileWriter(csvFolder + "piegraph.csv");
			fw.write(piegraphCSV);
			fw.flush();
			fw.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}

//		rm.rGraph(csvFolder, graphFolder);
	}
}
