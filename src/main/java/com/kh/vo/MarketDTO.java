package com.kh.vo;

import lombok.Data;

@Data
public class MarketDTO {
	private int marketyear;
	private int marketquarter;
	private int bd_code;
	private String bd_codename;
	private String service_code;
	private String service_codename;
	private long marketquartersales;
	private int marketquartercount;
	private double marketofstores;
	private CodelistDTO codelistDTO;
	
	public MarketDTO() {
	}

	public MarketDTO(int marketyear, int marketquarter, int bd_code, String bd_codename, String service_code,
			String service_codename, long marketquartersales, int marketquartercount, double marketofstores,
			CodelistDTO codelistDTO) {
		this.marketyear = marketyear;
		this.marketquarter = marketquarter;
		this.bd_code = bd_code;
		this.bd_codename = bd_codename;
		this.service_code = service_code;
		this.service_codename = service_codename;
		this.marketquartersales = marketquartersales;
		this.marketquartercount = marketquartercount;
		this.marketofstores = marketofstores;
		this.codelistDTO = codelistDTO;
	}

	public int getMarketyear() {
		return marketyear;
	}

	public void setMarketyear(int marketyear) {
		this.marketyear = marketyear;
	}

	public int getMarketquarter() {
		return marketquarter;
	}

	public void setMarketquarter(int marketquarter) {
		this.marketquarter = marketquarter;
	}

	public int getBd_code() {
		return bd_code;
	}

	public void setBd_code(int bd_code) {
		this.bd_code = bd_code;
	}

	public String getBd_codename() {
		return bd_codename;
	}

	public void setBd_codename(String bd_codename) {
		this.bd_codename = bd_codename;
	}

	public String getService_code() {
		return service_code;
	}

	public void setService_code(String service_code) {
		this.service_code = service_code;
	}

	public String getService_codename() {
		return service_codename;
	}

	public void setService_codename(String service_codename) {
		this.service_codename = service_codename;
	}

	public long getMarketquartersales() {
		return marketquartersales;
	}

	public void setMarketquartersales(long marketquartersales) {
		this.marketquartersales = marketquartersales;
	}

	public int getMarketquartercount() {
		return marketquartercount;
	}

	public void setMarketquartercount(int marketquartercount) {
		this.marketquartercount = marketquartercount;
	}

	public double getMarketofstores() {
		return marketofstores;
	}

	public void setMarketofstores(double marketofstores) {
		this.marketofstores = marketofstores;
	}

	public CodelistDTO getCodelistDTO() {
		return codelistDTO;
	}

	public void setCodelistDTO(CodelistDTO codelistDTO) {
		this.codelistDTO = codelistDTO;
	}
	
	
}
