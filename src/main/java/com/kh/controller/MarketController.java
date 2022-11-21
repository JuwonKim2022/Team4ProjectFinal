package com.kh.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.Rserve.RConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.service.HistoryService;
import com.kh.service.MarketService;
import com.kh.vo.HistoryDTO;
import com.kh.vo.MarketDTO;
import com.kh.vo.MarketOpenCloseDTO;
import com.kh.vo.MemberVO;

@Controller
public class MarketController {
	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);

	@Resource(name = "marketService")
	private MarketService marketService;

	@Resource(name = "historyService")
	private HistoryService historyService;

	@RequestMapping(value = "/MarketMapPage", method = RequestMethod.GET)
	public String MapGet(MemberVO memberVO) {
		return "MarketMapPage";
	}

	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/SearchInsertHistory", method = RequestMethod.POST)
	public List<HistoryDTO> SearchInsertHistory(HttpServletRequest request, Model model, @RequestParam String searchText, @RequestParam int marketyear, @RequestParam int marketquarter, HistoryDTO historyDTO) throws Exception {
		HttpSession session = request.getSession();
		int member_no = (int) session.getAttribute("member_no");
		System.out.println("MapPageMember_No: " + member_no);

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

	@ResponseBody
	@RequestMapping(value = "/MarketMapPage/modal", method = RequestMethod.POST)
	public void modal(@RequestParam String searchText) throws Exception {
		String district = null;

		File Folder1 = new File("C:/Temp");
		if (!Folder1.exists()) {
			try {
				Folder1.mkdir();
				logger.info("Temp생성");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

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
			//			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(csvFolder + "/bargraph.csv"), "UTF-8"));
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:\\Temp\\bargraph.csv"), "UTF-8"));
			writer.write(bargraphCSV);
			writer.flush();
			writer.close();
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		List<MarketOpenCloseDTO> marketOpenCloseList = marketService.selectRpiegraphData(district);
		String piegraphCSV = "marketyear, marketopen, marketclose , marketofstores\n";
		for (MarketOpenCloseDTO marketopencloseDTO : marketOpenCloseList)
			piegraphCSV += marketopencloseDTO.getMarketyear() + "," + marketopencloseDTO.getMarketopen() + "," + marketopencloseDTO.getMarketclose() + "," + marketopencloseDTO.getMarketofstores() + "\n";
		try {
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:\\Temp\\piegraph.csv"), "UTF-8"));
			writer.write(piegraphCSV);
			writer.flush();
			writer.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}

		RConnection connection = null;
		try {
			connection = new RConnection();
			logger.info("RConnection 연결 완료");
			connection.eval("barGraphData <- read.csv(\"C:/Temp/bargraph.csv\",header=T,sep=\",\")");
			connection.eval("QuarterlyByYear <- paste(barGraphData$marketyear, barGraphData$marketquarter)");
			connection.eval("marketquartersales <- barGraphData[3]");
			connection.eval("marketquartercount <- barGraphData[4]");
			connection.eval("marketofstores <- barGraphData[5]");

			logger.info("graph(BTAOS) 생성");
			connection.eval("resultMQS <- cbind(QuarterlyByYear, marketquartersales)");
			connection.eval("png(\"C:/Temp/QuarterlySales.png\")");
			connection.eval("barplot(resultMQS$marketquartersales/10000, names.arg = resultMQS$QuarterlyByYear, main=\"Quarterly Sales\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Amount of Sales(Unit: 10,000won)\", las = 1, space = 1)");
			connection.eval("dev.off()");

			logger.info("graph(BTSV) 생성");
			connection.eval("resultMQC <- cbind(QuarterlyByYear, marketquartercount)");
			connection.eval("png(\"C:/Temp/QuarterlySalesVol.png\")");
			connection.eval("barplot(resultMQC$marketquartercount/1000, names.arg = resultMQC$QuarterlyByYear, main=\"Quarterly Sales Volume\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Sales Volume(Unit: 1,000ea)\", las = 1, space = 1)");
			connection.eval("dev.off()");

			logger.info("graph(BNOSPQ) 생성");
			connection.eval("resultMOS <- cbind(QuarterlyByYear, marketofstores)");
			connection.eval("png(\"C:/Temp/NumOfStorePerQuarter.png\")");
			connection.eval("barplot(resultMOS$marketofstores, names.arg = resultMOS$QuarterlyByYear, main=\"Number Of Stores Per Quarter\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Number of Stores\", las = 1, space = 1)");
			connection.eval("dev.off()");

			connection.eval("pieGraphData <- read.csv(\"C:/Temp/piegraph.csv\",header=T,sep=\",\")");
			connection.eval("sumOC <- apply(pieGraphData[2:3], 1, sum)");
			connection.eval("pieGraphData$marketofstores <- pieGraphData$marketofstores - sumOC");

			logger.info("graph(PORBY) 생성");
			connection.eval("totalMarketOpen <- sum(pieGraphData$marketopen)");
			connection.eval("openPercent <- round(pieGraphData$marketopen/totalMarketOpen, 3)");
			connection.eval("png(\"C:/Temp/marketopen.png\")");
			connection.eval("pie(x = pieGraphData$marketopen, labels = paste(pieGraphData$marketyear, \"Years\", round(openPercent*100,1),\"%\"), clockwise = TRUE, col = rainbow(8), main = \"Opening Rate By Year\")");
			connection.eval("dev.off()");

			logger.info("graph(PCRBY) 생성");
			connection.eval("totalMarketClose <- sum(pieGraphData$marketclose)");
			connection.eval("closePercent <- round(pieGraphData$marketclose/totalMarketClose, 3)");
			connection.eval("png(\"C:/Temp/marketclose.png\")");
			connection.eval("pie(x = pieGraphData$marketclose, labels = paste(pieGraphData$marketyear, \"Years\", round(closePercent*100,1),\"%\"), clockwise = TRUE, col = rainbow(8), main = \"Closure Rate By Year\")");
			connection.eval("dev.off()");

			logger.info("graph(PMS) 생성");
			connection.eval("totalMarketKeep <- sum(pieGraphData$marketofstores)");
			connection.eval("keepPercent <- round(pieGraphData$marketofstores/totalMarketKeep, 3)");
			connection.eval("png(\"C:/Temp/marketstores.png\")");
			connection.eval("pie(x = pieGraphData$marketofstores, labels = paste(pieGraphData$marketyear, \"Years\", round(keepPercent*100,1),\"%\"), clockwise = TRUE, col = rainbow(8), main = \"Operating Rate By Year\")");
			connection.eval("dev.off()");

			logger.info("종료");
			connection.close();

		} catch (Exception e3) {
			e3.printStackTrace();
		}
	}
}
