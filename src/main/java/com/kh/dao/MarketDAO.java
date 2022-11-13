package com.kh.dao;

import java.util.List;

import com.kh.vo.MarketDTO;
import com.kh.vo.MarketOpenCloseDTO;

public interface MarketDAO {

	List<MarketDTO> selectAll() throws Exception;

	List<MarketDTO> selectByDistrict(String district) throws Exception;

	String returnDistrict(String bd_codename) throws Exception;
	
	List<MarketDTO> selectDataByDYQ(String district, int marketyear, int marketquarter) throws Exception;

	List<MarketDTO> selectRbargraphData(String district) throws Exception;

	List<MarketOpenCloseDTO> selectRpiegraphData(String district) throws Exception;

}
