package service;

import java.util.List;
import java.util.Map;

import util.PageInfo;

public interface PersonBuyTransactionListService {
	
	List<Map> personBuyTransactionList(String buyerId, int limit, int offset) throws Exception;
	List<Map> personBuyTransactionListByDate(String buyerId, String filterDate, int limit, int offset) throws Exception;
	List<Map> personBuyTransactionListByDateRange(String buyerId, String startDate, String endDate, int limit, int offset) throws Exception;
	int countTransactionListByBuyerId(String id) throws Exception;
}
