package repository.transaction;

import java.util.List;
import java.util.Map;

import dto.Company;

public interface PersonSellTransactionListRepository {
	List<Map> selectPSTransactionList(String sellerId) throws Exception;
	List<Map> selectPSTransactionListByDate(String sellerId, String filterDate) throws Exception;
	List<Map> selectPSTransactionListByDateRange(String sellerId, String startDate, String endDate) throws Exception;
	Company selectOneId(String id) throws Exception;
	void updateStateTransactionState(Integer auctionNum) throws Exception; 
}
