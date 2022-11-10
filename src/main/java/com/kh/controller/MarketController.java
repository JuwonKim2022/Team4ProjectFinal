package com.kh.controller;

import java.io.FileWriter;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.component.RManager;
import com.kh.service.MarketService;
import com.kh.vo.MarketDTO;

@Controller
public class MarketController {
	@Resource(name = "marketService")
	private MarketService marketService;
	
	@Autowired
	private RManager rm;
	
	@RequestMapping(value = "/MarketMapPage", method = RequestMethod.GET)
	public String MapGet() {
		return "MarketMapPage";
	}

	// 작동
	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/map/search", method = RequestMethod.POST)
	public List<MarketDTO> marketSearch(Model model, @RequestParam String bd_codename) throws Exception {
		String returnDistrict = marketService.returnDistrict(bd_codename);
		List<MarketDTO> marketList = marketService.selectDataByDYQ(returnDistrict);
		model.addAttribute("marketList", marketList);
		return marketList;
	}

	// 작동
	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/map/analysis", method = RequestMethod.POST)
	public List<MarketDTO> marketAnalysis(Model model, @RequestParam String district) throws Exception {
		List<MarketDTO> marketList = marketService.selectDataByDYQ(district);
		model.addAttribute("marketList", marketList);
		return marketList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/RTest", method = RequestMethod.GET)
	public String modal(Model model) throws Exception {
		String district = "종로구";
		List<MarketDTO> marketList = marketService.selectRData(district);
		String csv = "marketyear, marketquarter, marketquartersales, marketquartercount, marketofstores\n";
		for(MarketDTO marketDTO : marketList)
			csv += marketDTO.getMarketyear() + "," + marketDTO.getMarketquarter() + "," + marketDTO.getMarketquartersales() + "," + marketDTO.getMarketquartercount() + "," + marketDTO.getMarketofstores()+"\n";
		try {
			FileWriter fw = new FileWriter("C:/Users/GangJu/Desktop/Spring3/workspace/MarketAnalysis2/src/main/webapp/resources/csv/r.csv");
			fw.write(csv);
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("R연결 시도");
		rm.rGraph();
		System.out.println("R연결 종료");
		model.addAttribute("marketList", marketList);
		return "RTest";
	}
}
