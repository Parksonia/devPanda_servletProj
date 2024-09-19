package repository.blacklist;

import java.util.List;
import java.util.Map;

public interface BlacklistRepository {
	
	void insertBuyerPersonBlack(Map<String, Object> blistMap) throws Exception;
	void insertBuyerComblack(Map<String, Object> blistMap) throws Exception;
	void insertSellerBlack(Map<String, Object> blistMap) throws Exception;
	List<Map> selectBlacklistById(Map<String, Object> blistMap) throws Exception;
	int countBlacklistById(String id) throws Exception;
	void deleteBlacklistByNum(Integer blackNum) throws Exception;
	
}
