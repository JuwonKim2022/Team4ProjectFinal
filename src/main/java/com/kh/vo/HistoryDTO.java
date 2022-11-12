package com.kh.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HistoryDTO {
	private int historynumber;
	private int signnumber;
	private int marketyear;
	private int marketquarter;
	private String bd_codename;
	private String district;
	private Timestamp search_date;

	public HistoryDTO() {
	}

	public HistoryDTO(int historynumber, int signnumber, int marketyear, int marketquarter, String bd_codename, String district, Timestamp search_date) {
		this.historynumber = historynumber;
		this.signnumber = signnumber;
		this.marketyear = marketyear;
		this.marketquarter = marketquarter;
		this.bd_codename = bd_codename;
		this.district = district;
		this.search_date = search_date;
	}

	public int getHistorynumber() {
		return historynumber;
	}

	public void setHistorynumber(int historynumber) {
		this.historynumber = historynumber;
	}

	public int getSignnumber() {
		return signnumber;
	}

	public void setSignnumber(int signnumber) {
		this.signnumber = signnumber;
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

	public String getBd_codename() {
		return bd_codename;
	}

	public void setBd_codename(String bd_codename) {
		this.bd_codename = bd_codename;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public Timestamp getSearch_date() {
		return search_date;
	}

	public void setSearch_date(Timestamp search_date) {
		this.search_date = search_date;
	}

}
