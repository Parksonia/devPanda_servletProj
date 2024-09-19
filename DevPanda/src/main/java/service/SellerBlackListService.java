package service;

import java.util.List;
import java.util.Map;


public interface SellerBlackListService {
	void insertSellerBlack(Map<String, Object> blistMap) throws Exception;
	List<Map> selectBlacklistById(String id, int page, int pageSize) throws Exception;
	int countBlacklistById(String id) throws Exception;
	void deleteSellerBlack(Integer blackNum) throws Exception;

}
