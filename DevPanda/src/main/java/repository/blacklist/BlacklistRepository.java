package repository.blacklist;

import java.util.List;
import java.util.Map;

public interface BlacklistRepository {
	
	void insertBuyerPersonBlack(Map<String, Object> blistMap) throws Exception;
	void insertBuyerComblack(Map<String, Object> blistMap) throws Exception;
	
	//buyerPersonSellerBlackList
	List<Map>allBuyerPersonSellerBlackList(String id,int row) throws Exception;
	////buyerPersonSellerBlackList Total Cnt
	Integer buyerPersontSellerBlackListCnt(String id) throws Exception;
	Integer deleteSellerBlackForBuyerPerson(Integer blackNum);
	
}
