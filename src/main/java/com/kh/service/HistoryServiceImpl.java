package com.kh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.dao.HistoryDAO;
import com.kh.vo.HistoryDTO;

@Service("historyService")
public class HistoryServiceImpl implements HistoryService {
	@Resource(name = "historyDAO")
	private HistoryDAO historyDAO;

	@Override
	public List<HistoryDTO> selectAll() throws Exception {
		return historyDAO.selectAll();
	}
	
	@Override
	public List<HistoryDTO> selectRecentHistory(int member_no) throws Exception {
		return historyDAO.selectRecentHistory(member_no);
	}
	
	@Override
	public List<HistoryDTO> selectAllRecentHistory(int member_no) throws Exception {
		return historyDAO.selectAllRecentHistory(member_no);
	}
	
	@Override
	public int insertSearchBox(HistoryDTO historyDTO) throws Exception {
		return historyDAO.insertSearchBox(historyDTO);
	}
	
	@Override
	public int insertPolygon(HistoryDTO historyDTO) throws Exception {
		return historyDAO.insertPolygon(historyDTO);
	}

}
