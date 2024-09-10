package repository.transaction;

import java.util.List;
import java.util.Map;

public interface TransactionRepository {
	List<Map> findTransactionsByCompanyId(String companyId) throws Exception;
	Map<String, Object> getAuctionMaxByCompanyId(String companyId) throws Exception;
	
}
