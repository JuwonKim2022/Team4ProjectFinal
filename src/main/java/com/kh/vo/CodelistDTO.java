package com.kh.vo;

import lombok.Data;

@Data
public class CodelistDTO {
	private int bd_code;
	private String district;

	public CodelistDTO() {
	}

	public CodelistDTO(int bd_code, String district) {
		this.bd_code = bd_code;
		this.district = district;
	}

	public int getBd_code() {
		return bd_code;
	}

	public void setBd_code(int bd_code) {
		this.bd_code = bd_code;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

}
