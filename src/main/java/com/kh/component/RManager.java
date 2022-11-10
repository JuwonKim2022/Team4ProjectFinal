package com.kh.component;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Component;

@Component
public class RManager {
	public void rGraph() {
		try {
//        	System.out.println("rGraph의 R연결시도");
//            RConnection rc = new RConnection();
//            System.out.println("R연결완료");
//            rc.voidEval("library(rJava)"); //Rserve에 R명령어 전송
//            rc.voidEval("data<-read.csv(\"C:/Users/GangJu/Desktop/Spring3/workspace/MarketAnalysis2/src/main/webapp/resources/csv/r.csv\",header=T,sep=\",\")");
//            rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/MarketAnalysis2/src/main/webapp/resources/png/rgp.png\")");
//            rc.voidEval("barplot(data$marketquartersales/1000, names=data$marketyear, col=rainbow(15))");
//            rc.voidEval("dev.off()");
//            rc.close();
			System.out.println("rGraph의 R연결시도");
			RConnection rc = new RConnection();
			System.out.println("R연결완료");
			rc.voidEval("library(rJava)");
			rc.voidEval("library(Rserve)");
			rc.voidEval("Rserve(args=\"--no-save\")");
			rc.voidEval("library(ggplot2)");
			rc.voidEval("data<-read.csv(\"C:/Users/GangJu/Desktop/Spring3/workspace/MarketAnalysis2/src/main/webapp/resources/csv/r.csv\",header=T,sep=\",\")");
			
			rc.voidEval("yq <- data[0:2]");
			rc.voidEval("sumYQ <- paste(yq$marketyear, yq$marketquarter)");
			rc.voidEval("marketquartersales <-data[3]");
			rc.voidEval("marketquartercount <- data[4]");
			rc.voidEval("marketofstores <- data[5]");
			
			rc.voidEval("resultMS <- cbind(sumYQ, marketquartersales)");
			rc.voidEval("resultMC <- cbind(sumYQ, marketquartercount)");
			rc.voidEval("resultMS <- cbind(sumYQ, marketofstores)");
			
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/MarketAnalysis2/src/main/webapp/resources/png/taos.png\")");
			rc.voidEval("ggplot(resultMS, aes(x=sumYQ, y=marketquartersales))+\r\n" + 
						"geom_bar(stat=\"identity\")+\r\n" + 
						"labs(title = \"연도 및 분기별 총 판매액\", x = \"Quarterly by Year\", y = \"Total Amount of Sales\")+\r\n" + 
						"theme(axis.text.x = element_text(angle = 45, size = 15), plot.title = element_text(hjust = 0.5, size = 15))+\r\n" + 
						"scale_y_continuous(labels = scales ::comma)");
			rc.voidEval("dev.off()");
			
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/MarketAnalysis2/src/main/webapp/resources/png/tvos.png\")");
			rc.voidEval("ggplot(resultMC, aes(x=sumYQ, y=marketquartercount))+\r\n" + 
						"geom_bar(stat=\"identity\")+\r\n" + 
						"labs(title = \"연도 및 분기별 총 판매수량\", x = \"Quarterly by Year\", y = \"Total Volume of Sales\")+\r\n" + 
						"theme(axis.text.x = element_text(angle = 45, size = 15), plot.title = element_text(hjust = 0.5, size = 15))+\r\n" + 
						"scale_y_continuous(labels = scales ::comma)");
			rc.voidEval("dev.off()");
			
			rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/MarketAnalysis2/src/main/webapp/resources/png/tnos.png\")");
			rc.voidEval("ggplot(resultMS, aes(x=sumYQ, y=marketofstores))+\r\n" + 
						"geom_bar(stat=\"identity\")+\r\n" + 
						"labs(title = \"연도 및 분기별 총 점포수\", x = \"Quarterly by Year\", y = \"Total Number of Stores\")+\r\n" + 
						"theme(axis.text.x = element_text(angle = 45, size = 15), plot.title = element_text(hjust = 0.5, size = 15))+\r\n" + 
						"scale_y_continuous(labels = scales ::comma)");
			rc.voidEval("dev.off()");
			
			rc.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
