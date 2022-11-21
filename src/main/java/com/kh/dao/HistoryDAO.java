package com.kh.dao;

import java.util.List;

import com.kh.vo.HistoryDTO;

public interface HistoryDAO {

	public List<HistoryDTO> selectRecentHistory(int membernumber) throws Exception;

	public List<HistoryDTO> selectAllRecentHistory(int member_no) throws Exception;

	public int insertSearchBox(HistoryDTO historyDTO) throws Exception;

}
