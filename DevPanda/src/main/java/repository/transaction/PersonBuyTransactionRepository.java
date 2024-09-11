package repository.transaction;

import java.util.List;
import java.util.Map;

public interface PersonBuyTransactionRepository {
	
	List<Map> selectPBTransactionList(String buyerId) throws Exception;
	List<Map> selectPBTransactionListByDate(String buyerId, String filterDate) throws Exception;
	List<Map> selectPBTransactionListByDateRange(String buyerId, String startDate, String endDate);	
	Integer selectPBTransactionCount() throws Exception;
	
}
