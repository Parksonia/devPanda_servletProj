package repository.transaction;

import java.util.List;
import java.util.Map;

public interface TransactionRepository {
	List<Map> findTransactionsByCompanyId(String companyId, String startDate, String endDate) throws Exception;
	Map<String, Object> getAuctionMaxByCompanyId(String companyId) throws Exception;
	
}
