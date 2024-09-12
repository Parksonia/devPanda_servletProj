package repository.transaction;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Transaction;

public interface TransactionRepository {
	List<Map> findTransactionsByCompanyId(String companyId, String startDate, String endDate) throws Exception;
	Map<String, Object> getAuctionMaxByCompanyId(String companyId) throws Exception;
	void insertTransaction(Transaction transaction,SqlSession sqlSession);
}
