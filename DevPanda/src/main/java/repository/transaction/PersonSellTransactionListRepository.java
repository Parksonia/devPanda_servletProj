package repository.transaction;

import java.util.List;
import java.util.Map;

import dto.Company;

public interface PersonSellTransactionListRepository {
	List<Map> selectPSTransactionList(String sellerId, int limit, int offset) throws Exception;
	List<Map> selectPSTransactionListByDate(String sellerId, String filterDate, int limit, int offset) throws Exception;
	List<Map> selectPSTransactionListByDateRange(String sellerId, String startDate, String endDate, int limit, int offset) throws Exception;
	Company selectOneId(String id) throws Exception;
	void updateStateTransactionState(Integer auctionNum) throws Exception; 
	int countTransactionListBySellerId(String id) throws Exception;
}
