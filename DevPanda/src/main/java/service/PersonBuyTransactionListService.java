package service;

import java.util.List;
import java.util.Map;

import util.PageInfo;

public interface PersonBuyTransactionListService {
	
	List<Map> personBuyTransactionList(String buyerId) throws Exception;
	List<Map> personBuyTransactionListByDate(String buyerId, String filterDate) throws Exception;
	List<Map> personBuyTransactionListByDateRange(String buyerId, String startDate, String endDate) throws Exception;
	//void calcuatePaging(PageInfo page, Integer count) throws Exception;

}
