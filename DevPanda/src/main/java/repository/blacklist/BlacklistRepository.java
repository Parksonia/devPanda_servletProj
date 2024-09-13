package repository.blacklist;

import java.util.Map;

import dto.BlackList;

public interface BlacklistRepository {
	
	void insertBuyerPersonBlack(Map<String, Object> blistMap) throws Exception;
	void insertBuyerComblack(Map<String, Object> blistMap) throws Exception;
	
}
