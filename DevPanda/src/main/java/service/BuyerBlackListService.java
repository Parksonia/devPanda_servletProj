package service;

import java.util.List;
import java.util.Map;

import dto.BlackList;
import util.PageInfo;

public interface BuyerBlackListService {
	
	void insertBuyerPersonBlack(Map<String, Object> blistMap) throws Exception;
	void insertBuyerComBlack(Map<String, Object> blistMap) throws Exception;
	
	List<Map>buyerPersonSellerBlackList(String id,PageInfo pageInfo) throws Exception;
	
	boolean buyerPersonDeleteSellerBlack(Integer blackNum) throws Exception;
	
	
}
