package com.kh.dao;

import java.util.List;

import com.kh.vo.MarketDTO;

public interface MarketDAO {

	List<MarketDTO> selectAll() throws Exception;

	List<MarketDTO> selectByDistrict(String district) throws Exception;

	String returnDistrict(String bd_codename) throws Exception;
	
	List<MarketDTO> selectDataByDYQ(String district, int marketyear, int marketquarter) throws Exception;

	List<MarketDTO> selectRData(String district) throws Exception;

}
