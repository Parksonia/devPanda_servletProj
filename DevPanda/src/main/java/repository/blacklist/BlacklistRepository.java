package repository.blacklist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.BlackList;


public interface BlacklistRepository {
	
	void insertBuyerPersonBlack(Map<String, Object> blistMap) throws Exception;
	void insertBuyerComblack(Map<String, Object> blistMap) throws Exception;
	void insertSellerBlack(Map<String, Object> blistMap) throws Exception;
	List<Map> selectBlacklistById(Map<String, Object> blistMap) throws Exception;
	int countBlacklistById(String id) throws Exception;
	void deleteBlacklistByNum(Integer blackNum) throws Exception;
	
	//buyerPersonSellerBlackList 조회
	List<Map>allBuyerPersonSellerBlackList(String id,int row) throws Exception;
	//buyerPersonSellerBlackList TotalCnt 전체 신고 수  
	Integer buyerPersontSellerBlackListCnt(String id) throws Exception;
	//buyerPersonSellerBlackList블랙 해제 
	Integer deleteSellerBlackForBuyerPerson(Integer blackNum);

	List<BlackList> selectBlackList() throws Exception;

	//이미 신고된 블랙리스트 조회 
	boolean isAlreadyReported(HashMap<String,Object>param) throws Exception;


}
