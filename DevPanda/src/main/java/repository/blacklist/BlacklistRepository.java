package repository.blacklist;

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
	
	//buyerPersonSellerBlackList
	List<Map>allBuyerPersonSellerBlackList(String id,int row) throws Exception;
	////buyerPersonSellerBlackList Total Cnt
	Integer buyerPersontSellerBlackListCnt(String id) throws Exception;
	Integer deleteSellerBlackForBuyerPerson(Integer blackNum);
	List<BlackList> selectBlackList() throws Exception;
}
