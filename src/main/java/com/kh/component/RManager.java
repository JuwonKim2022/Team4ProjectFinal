package com.kh.component;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Component;

@Component
public class RManager {
	//	@Autowired(required = true)
	//	private HttpServletRequest request;

	public static void rGraph() throws Exception {
		System.out.println("rGraph의 R연결시도");
		RConnection rc = null;

		//		String uploadPath = request.getSession().getServletContext().getRealPath("/").concat("resources");
		//		String csvUploadPath = uploadPath + File.separator + "csv" + File.separator;
		//		System.out.println(csvUploadPath);

		rc = new RConnection();
		System.out.println("R연결완료");
		
		rc.voidEval("Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_333')");
//		rc.voidEval("data <- read.csv(\"C:\\\\Users\\\\GangJu\\\\Desktop\\\\Spring3\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp0\\\\wtpwebapps\\\\Team4ProjectFinal\\\\resources\\\\csv\\\\bargraph.csv\",header=T,sep=\",\")");
		rc.voidEval("data <- read.csv(\"/resources/csv/bargraph.csv\",header=T,sep=\",\")");
		rc.voidEval("yq <- data[0:2]");
		rc.voidEval("sumYQ <- paste(yq$marketyear, yq$marketquarter)");
		rc.voidEval("marketquartersales <-data[3]");
		rc.voidEval("marketquartercount <- data[4]");
		rc.voidEval("marketofstores <- data[5]");
		rc.voidEval("resultMQS <- cbind(sumYQ, marketquartersales)");
		rc.voidEval("resultMQC <- cbind(sumYQ, marketquartercount)");
		rc.voidEval("resultMOS <- cbind(sumYQ, marketofstores)");
		
//		rc.voidEval("png(\"C:\\\\Users\\\\GangJu\\\\Desktop\\\\Spring3\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp0\\\\wtpwebapps\\\\Team4ProjectFinal\\\\resources\\\\png\\\\taos.png\")");
//		rc.voidEval("png(\"C:/Users/GangJu/Desktop/Spring3/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Team4ProjectFinal/resources/png/taos.png\")");
		rc.voidEval("png(\"/resources/graph/taos.png\")");
		rc.voidEval("barplot(resultMQS$marketquartersales/10000, names.arg = resultMQS$sumYQ, main=\"Quarterly Sales\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Amount of Sales(Unit: 10,000won)\", las = 1, space = 1)");
		rc.voidEval("dev.off()");
		
//		rc.voidEval("png(\"C:\\\\Users\\\\GangJu\\\\Desktop\\\\Spring3\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp0\\\\wtpwebapps\\\\Team4ProjectFinal\\\\resources\\\\png\\\\tvos.png\")");
		rc.voidEval("png(\"/resources/graph/tvos.png\")");
		rc.voidEval("barplot(resultMQC$marketquartercount/1000, names.arg = resultMQC$sumYQ, main=\"Quarterly Sales Volume\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Sales Volume(Unit: 1,000ea)\", las = 1, space = 1)");
		rc.voidEval("dev.off()");
		
//		rc.voidEval("png(\"C:\\\\Users\\\\GangJu\\\\Desktop\\\\Spring3\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp0\\\\wtpwebapps\\\\Team4ProjectFinal\\\\resources\\\\png\\\\tnos.png\")");
		rc.voidEval("png(\"/resources/graph/tnos.png\")");
		rc.voidEval("barplot(resultMOS$marketofstores, names.arg = resultMOS$sumYQ, main=\"Number Of Stores Per Quarter\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Number of Stores\", las = 1, space = 1)");
		rc.voidEval("dev.off()");

		// 원그래프
		rc.voidEval("data <- read.csv(\"C:\\\\Users\\\\GangJu\\\\Desktop\\\\Spring3\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp0\\\\wtpwebapps\\\\Team4ProjectFinal\\\\resources\\\\csv\\\\r.csv\",header=T,sep=\",\")");
		
		rc.voidEval("png(\"C:\\\\Users\\\\GangJu\\\\Desktop\\\\Spring3\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp0\\\\wtpwebapps\\\\Team4ProjectFinal\\\\resources\\\\png\\\\open.png\")");
		rc.voidEval("barplot(resultMOS$marketofstores, names.arg = resultMOS$sumYQ, main=\"Number Of Stores Per Quarter\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Number of Stores\", las = 1, space = 1)");
		rc.voidEval("dev.off()");
		
		rc.voidEval("png(\"C:\\\\Users\\\\GangJu\\\\Desktop\\\\Spring3\\\\workspace\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp0\\\\wtpwebapps\\\\Team4ProjectFinal\\\\resources\\\\png\\\\close.png\")");
		rc.voidEval("barplot(resultMOS$marketofstores, names.arg = resultMOS$sumYQ, main=\"Number Of Stores Per Quarter\", cex.names = 0.7, xlab = \"Quarterly by Year\", ylab = \"Total Number of Stores\", las = 1, space = 1)");
		rc.voidEval("dev.off()");
		
		rc.close();
	}
}
