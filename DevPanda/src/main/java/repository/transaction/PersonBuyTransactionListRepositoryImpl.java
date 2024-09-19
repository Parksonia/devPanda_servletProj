package repository.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class PersonBuyTransactionListRepositoryImpl implements PersonBuyTransactionListRepository {
	
	private SqlSession sqlSession;
	
	public PersonBuyTransactionListRepositoryImpl() {
		this.sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public List<Map> selectPBTransactionList(String buyerId, int limit, int offset) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("buyerId", buyerId);
		params.put("limit", limit);
		params.put("offset", offset);
		List<Map> result = sqlSession.selectList("mapper.transaction.selectPBTransactionList", params);
		return result;
	}
	
	@Override
	public List<Map> selectPBTransactionListByDate(String buyerId, String filterDateStr, int limit, int offset) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("buyerId", buyerId);
		params.put("filterDate", filterDateStr);
		params.put("limit", limit);
		params.put("offset", offset);
		List<Map> result = sqlSession.selectList("mapper.transaction.selectPBTransactionList", params);
		return result;
	}	
	
	@Override
	public List<Map> selectPBTransactionListByDateRange(String buyerId, String startDate, String endDate, int limit, int offset) {
		Map<String, Object> params = new HashMap<>();
		params.put("buyerId", buyerId);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		params.put("limit", limit);
		params.put("offset", offset);
		List<Map> result = sqlSession.selectList("mapper.transaction.selectPBTransactionList", params);
		return result;
	}

	@Override
	public int countTransactionListByBuyerId(String id) throws Exception {
		return sqlSession.selectOne("mapper.transaction.countTransactionListByBuyerId", id);
	}

	
	

}
