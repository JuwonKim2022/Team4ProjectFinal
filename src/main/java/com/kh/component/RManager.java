package com.kh.component;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Component;

@Component
public class RManager {
	public void rGraph() {
		System.out.println("rGraph의 R연결시도");
		RConnection rc = null;
		try {
			rc = new RConnection();
			System.out.println("R연결완료");
			
			rc.voidEval("library(rJava)");
			
			rc.voidEval("data<-read.csv(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4MarketAnalysis/resources/csv/r.csv\",header=T,sep=\",\")");
			System.out.println("CSV로부터 데이터 전달 완료");
			
			rc.voidEval("yq <- data[0:2]");
			rc.voidEval("sumYQ <- paste(yq$marketyear, yq$marketquarter)");
			rc.voidEval("marketquartersales <-data[3]");
			rc.voidEval("marketquartercount <- data[4]");
			rc.voidEval("marketofstores <- data[5]");
			rc.voidEval("resultMQS <- cbind(sumYQ, marketquartersales)");
			rc.voidEval("resultMQC <- cbind(sumYQ, marketquartercount)");
			rc.voidEval("resultMOS <- cbind(sumYQ, marketofstores)");
			
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4MarketAnalysis/resources/png/taos.png\")");
			rc.voidEval("barplot(resultMQS$marketquartersales/10000, names.arg = resultMQS$sumYQ, main=\"Quarterly Sales\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Amount of Sales(Unit: 10,000won)\", las = 1, space = 1)");
			rc.voidEval("dev.off()");
			
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4MarketAnalysis/resources/png/tvos.png\")");
			rc.voidEval("barplot(resultMQC$marketquartercount/1000, names.arg = resultMQC$sumYQ, main=\"Quarterly Sales Volume\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Sales Volume(Unit: 1,000ea)\", las = 1, space = 1)");
			rc.voidEval("dev.off()");
			
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4MarketAnalysis/resources/png/tnos.png\")");
			rc.voidEval("barplot(resultMOS$marketofstores, names.arg = resultMOS$sumYQ, main=\"Number Of Stores Per Quarter\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Number of Stores\", las = 1, space = 1)");
			rc.voidEval("dev.off()");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rc != null)
				rc.close();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*
		 * try { // rc.voidEval("library(Rserve)\r\n");
		rc.voidEval("Rserve(args=\"--no-save\")");
		rc.voidEval("Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_333')");
		rc.voidEval("library(RJDBC)"); rc.voidEval("library(DBI)");
		rc.voidEval("library(rJava)"); rc.voidEval("library(ggplot2)");
		System.out.println("R연결완료");

		rc.voidEval("data<-read.csv(\"/resources/csv/r.csv\",header=T,sep=\",\")");
 
		rc.voidEval("yq <- data[0:2]");
		rc.voidEval("sumYQ <- paste(yq$marketyear, yq$marketquarter)");
		rc.voidEval("marketquartersales <-data[3]");
		rc.voidEval("marketquartercount <- data[4]");
		rc.voidEval("marketofstores <- data[5]");

		rc.voidEval("resultMQS <- cbind(sumYQ, marketquartersales)");
		rc.voidEval("resultMQC <- cbind(sumYQ, marketquartercount)");
		rc.voidEval("resultMOS <- cbind(sumYQ, marketofstores)");
 
		rc.voidEval("png(\"/resources/png/taos.png\")");
		rc.voidEval("barplot(resultMQS$marketquartersales/1000, names=resultMQS$sumYQ)");
		rc.voidEval("dev.off()");
	
		rc.voidEval("png(\"/resources/png/tvos.png\")");
		rc.voidEval("barplot(resultMQC$marketquartercount, names=resultMQC$sumYQ)");
		rc.voidEval("dev.off()");
		
		rc.voidEval("png(\"/resources/png/tnos.png\")");
		rc.voidEval("barplot(resultMOS$marketofstores, names=resultMOS$sumYQ)");
		rc.voidEval("dev.off()");
		
		rc.close(); } catch (Exception e) { e.printStackTrace(); }
		 */
	}
}
