package repository.transaction;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class TransactionRepositoryImpl implements TransactionRepository {

	@Override
	public List<Map> findTransactionsByCompanyId(String companyId) { // 회사 ID를 기준으로 거래 정보를 조회하는 메서드
		List<Map> transactionList = null;
		// MyBatis SqlSession을 통해 데이터베이스와 연결
		try (SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
			transactionList = sqlSession.selectList("mapper.transaction.selectTransactionsByCompanyId", companyId);
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
