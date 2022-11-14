package com.kh.component;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Component;

@Component
public class RManager {
	public void rGraph() {
		try {
			RConnection rc = new RConnection();
			System.out.println("RConnection 실행");
			
			rc.voidEval("library(rJava)");

			rc.voidEval("barGraphData <- read.csv(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/csv/bargraph.csv\",header=T,sep=\",\")");
			
			rc.voidEval("QuarterlyByYear <- paste(barGraphData$marketyear, barGraphData$marketquarter)");
			rc.voidEval("marketquartersales <- barGraphData[3]");
			rc.voidEval("marketquartercount <- barGraphData[4]");
			rc.voidEval("marketofstores <- barGraphData[5]");
			
			//bar
			rc.voidEval("resultMQS <- cbind(QuarterlyByYear, marketquartersales)");
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/graph/QuarterlySales.png\")");
			rc.voidEval("barplot(resultMQS$marketquartersales/10000, names.arg = resultMQS$QuarterlyByYear, main=\"Quarterly Sales\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Amount of Sales(Unit: 10,000won)\", las = 1, space = 1)");
			rc.voidEval("dev.off()");

			rc.voidEval("resultMQC <- cbind(QuarterlyByYear, marketquartercount)");
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/graph/QuarterlySalesVol.png\")");
			rc.voidEval("barplot(resultMQC$marketquartercount/1000, names.arg = resultMQC$QuarterlyByYear, main=\"Quarterly Sales Volume\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Sales Volume(Unit: 1,000ea)\", las = 1, space = 1)");
			rc.voidEval("dev.off()");

			rc.voidEval("resultMOS <- cbind(QuarterlyByYear, marketofstores)");
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/graph/NumOfStorePerQuarter.png\")");
			rc.voidEval("barplot(resultMOS$marketofstores, names.arg = resultMOS$QuarterlyByYear, main=\"Number Of Stores Per Quarter\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Number of Stores\", las = 1, space = 1)");
			rc.voidEval("dev.off()");
			
			//pie
			rc.voidEval("pieGraphData <- read.csv(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/csv/piegraph.csv\",header=T,sep=\",\")");
			rc.voidEval("sumOC <- apply(pieGraphData[2:3], 1, sum)");
			rc.voidEval("pieGraphData$marketofstores <- pieGraphData$marketofstores - sumOC");
			
			rc.voidEval("totalMarketOpen <- sum(pieGraphData$marketopen)");
			rc.voidEval("openPercent <- round(pieGraphData$marketopen/totalMarketOpen, 3)");
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/graph/marketopen.png\")");
			rc.voidEval("pie(x = pieGraphData$marketopen, labels = paste(pieGraphData$marketyear, \"Years\", round(openPercent*100,1),\"%\"), clockwise = TRUE, col = rainbow(8), main = \"Opening Rate By Year\")");
			rc.voidEval("dev.off()");
			
			rc.voidEval("totalMarketClose <- sum(pieGraphData$marketclose)");
			rc.voidEval("closePercent <- round(pieGraphData$marketclose/totalMarketClose, 3)");
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/graph/marketclose.png\")");
			rc.voidEval("pie(x = pieGraphData$marketclose, labels = paste(pieGraphData$marketyear, \"Years\", round(closePercent*100,1),\"%\"), clockwise = TRUE, col = rainbow(8), main = \"Closure Rate By Year\")");
			rc.voidEval("dev.off()");
			
			rc.voidEval("totalMarketKeep <- sum(pieGraphData$marketofstores)");
			rc.voidEval("keepPercent <- round(pieGraphData$marketofstores/totalMarketKeep, 3)");
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/graph/marketstores.png\")");
			rc.voidEval("pie(x = pieGraphData$marketofstores, labels = paste(pieGraphData$marketyear, \"Years\", round(keepPercent*100,1),\"%\"), clockwise = TRUE, col = rainbow(8), main = \"Operating Rate By Year\")");
			rc.voidEval("dev.off()");
			
			rc.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
