package com.kh.service;

import java.util.List;

import com.kh.vo.MarketDTO;

public interface MarketService {
	public List<MarketDTO> selectAll() throws Exception;

	List<MarketDTO> selectByDistrict(String district) throws Exception;
	
	String returnDistrict(String bd_codename) throws Exception;
	
	List<MarketDTO> selectDataByDYQ(String district) throws Exception;

	List<MarketDTO> selectRData(String district) throws Exception;

}
