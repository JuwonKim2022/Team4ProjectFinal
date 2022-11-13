package com.kh.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.dao.MarketDAO;
import com.kh.vo.MarketDTO;
import com.kh.vo.MarketOpenCloseDTO;

@Service("marketService")
public class MarketServiceImpl implements MarketService {
	@Resource(name = "marketDAO")
	private MarketDAO marketDAO;

	@Override
	public List<MarketDTO> selectAll() throws Exception {
		return marketDAO.selectAll();
	}

	@Override
	public List<MarketDTO> selectByDistrict(String district) throws Exception {
		return marketDAO.selectByDistrict(district);
	}

	@Override
	public String returnDistrict(String bd_codename) throws Exception {
		return marketDAO.returnDistrict(bd_codename);
	}
	
	@Override
	public List<MarketDTO> selectDataByDYQ(String district, int marketyear, int marketquarter) throws Exception {
		return marketDAO.selectDataByDYQ(district, marketyear, marketquarter);
	}
	
	@Override
	public List<MarketDTO> selectRbargraphData(String district) throws Exception {
		return marketDAO.selectRbargraphData(district);
	}
	
	@Override
	public List<MarketOpenCloseDTO> selectRpiegraphData(String district) throws Exception {
		return marketDAO.selectRpiegraphData(district);
	}
	
}
