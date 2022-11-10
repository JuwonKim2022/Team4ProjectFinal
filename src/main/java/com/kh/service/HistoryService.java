package com.kh.service;

import java.util.List;

import com.kh.vo.HistoryDTO;

public interface HistoryService {
	public List<HistoryDTO> selectAll() throws Exception;

	public List<HistoryDTO> selectRecentHistory(int membernumber) throws Exception;
	
	int insertSearchBox(HistoryDTO historyDTO) throws Exception;

	int insertPolygon(HistoryDTO historyDTO) throws Exception;
}
