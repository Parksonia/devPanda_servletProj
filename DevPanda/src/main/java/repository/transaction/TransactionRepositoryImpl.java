package repository.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Transaction;
import util.MybatisSqlSessionFactory;

public class TransactionRepositoryImpl implements TransactionRepository {

	@Override
	public List<Map> findTransactionsByCompanyId(String companyId, String startDate, String endDate) { // 회사 ID를 기준으로 거래 정보를 조회하는 메서드
		List<Map> transactionList = null;
		Map<String, Object> params = new HashMap<>();
		params.put("companyId", companyId);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		//params.put("row", row);
		try (SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
			transactionList = sqlSession.selectList("mapper.transaction.selectTransactionsByCompanyId", params);
		}

		return transactionList;
	}
	
	@Override
	public Map<String, Object> getAuctionMaxByCompanyId(String companyId) {
		try (SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
			return sqlSession.selectMap("mapper.transaction.getAuctionMaxByCompanyId", companyId);
		}
	}
	
	
	@Override
	public void insertTransaction(Transaction transaction,SqlSession sqlSession) {
		// TODO Auto-generated method stub
		
	
		String statement = "mapper.transaction.insertTransaction";
		sqlSession.insert(statement,transaction);
	
		
		
		
		
	}
	
	 private SqlSession sqlSession; //추가한 부분
	 public TransactionRepositoryImpl() {
	        this.sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	    }
	
	
	@Override
	 public List<Map<String, Object>> getTransactionListByDate(String companyId, String startDate, String endDate, int offset, int pageSize) {
	     Map<String, Object> params = new HashMap<>();
	     params.put("companyId", companyId);
	     params.put("startDate", startDate);
	     params.put("endDate", endDate);
	     params.put("offset", offset);
	     params.put("pageSize", pageSize);
	     System.out.println(params);
	     List<Map<String, Object>> res = sqlSession.selectList("mapper.transaction.selectTransactionsByDate", params);
	     System.out.println(res);
	     return res;
	 }


}
