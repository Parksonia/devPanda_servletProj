package repository.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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
			return sqlSession.selectOne("mapper.transaction.getAuctionMaxByCompanyId", companyId);
		}
	}

}
