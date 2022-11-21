package com.kh.service;

import java.util.List;

import com.kh.vo.MarketDTO;
import com.kh.vo.MarketOpenCloseDTO;

public interface MarketService {

	public String returnDistrict(String bd_codename) throws Exception;

	public List<MarketDTO> selectDataByDYQ(String district, int marketyear, int marketquarter) throws Exception;

	public List<MarketDTO> selectRbargraphData(String district) throws Exception;

	public List<MarketOpenCloseDTO> selectRpiegraphData(String district) throws Exception;

}
