package repository.transaction;

import java.util.List;
import java.util.Map;

public interface PersonBuyTransactionListRepository {
	
	List<Map> selectPBTransactionList(String buyerId) throws Exception;
	List<Map> selectPBTransactionListByDate(String buyerId, String filterDate) throws Exception;
	List<Map> selectPBTransactionListByDateRange(String buyerId, String startDate, String endDate) throws Exception;	
	
	
}
