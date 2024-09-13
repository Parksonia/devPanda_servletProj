package service;

import java.util.Map;

import dto.BlackList;

public interface BuyerBlackListService {
	
	void insertBuyerPersonBlack(Map<String, Object> blistMap) throws Exception;
	void insertBuyerComBlack(Map<String, Object> blistMap) throws Exception;

}
