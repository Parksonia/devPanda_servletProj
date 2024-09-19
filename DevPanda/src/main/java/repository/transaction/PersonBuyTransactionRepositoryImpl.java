package repository.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class PersonBuyTransactionRepositoryImpl implements PersonBuyTransactionRepository {
	
	private SqlSession sqlSession;
	
	public PersonBuyTransactionRepositoryImpl() {
		this.sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public List<Map> selectPBTransactionList(String buyerId, int limit, int offset) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("buyerId", buyerId);
		params.put("limit", limit);
		params.put("offset", offset);
		List<Map> result = sqlSession.selectList("mapper.transaction.selectPBTransactionList", params);
		//System.out.println(result);
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
	public Integer selectPBTransactionCount() throws Exception {
		return sqlSession.selectOne("mapper.transaction.selectPBTransactionCount");
	}

	
	

}
