package repository.transaction;

import java.util.List;
import java.util.Map;

public interface PersonSellTransactionListRepository {
	List<Map> selectPSTransactionList(String sellerId) throws Exception;
	List<Map> selectPSTransactionListByDate(String sellerId, String filterDate) throws Exception;
	List<Map> selectPSTransactionListByDateRange(String sellerId, String startDate, String endDate) throws Exception;

}
