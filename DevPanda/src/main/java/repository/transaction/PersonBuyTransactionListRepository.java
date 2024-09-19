package repository.transaction;

import java.util.List;
import java.util.Map;

public interface PersonBuyTransactionListRepository {
	
	List<Map> selectPBTransactionList(String buyerId, int limit, int offset) throws Exception;
	List<Map> selectPBTransactionListByDate(String buyerId, String filterDate, int limit, int offset) throws Exception;
	List<Map> selectPBTransactionListByDateRange(String buyerId, String startDate, String endDate, int limit, int offset) throws Exception;	
	int countTransactionListByBuyerId(String id) throws Exception;
	
}
