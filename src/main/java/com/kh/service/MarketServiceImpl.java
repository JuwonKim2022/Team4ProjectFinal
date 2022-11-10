package com.kh.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.dao.MarketDAO;
import com.kh.vo.MarketDTO;

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
	public List<MarketDTO> selectDataByDYQ(String district) throws Exception {
		return marketDAO.selectDataByDYQ(district);
	}
	
	@Override
	public List<MarketDTO> selectRData(String district) throws Exception {
		return marketDAO.selectRData(district);
	}
}
