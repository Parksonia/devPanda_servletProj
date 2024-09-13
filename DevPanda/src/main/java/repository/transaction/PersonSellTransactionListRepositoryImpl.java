package repository.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Company;
import util.MybatisSqlSessionFactory;

public class PersonSellTransactionListRepositoryImpl implements PersonSellTransactionListRepository {
	private SqlSession sqlSession;
	public PersonSellTransactionListRepositoryImpl() {
		this.sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
 
	@Override
	public List<Map> selectPSTransactionList(String sellerId) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		List<Map> result = sqlSession.selectList("mapper.transaction.selectPSTransactionList", params);
		return result;
	}

	@Override
	public List<Map> selectPSTransactionListByDate(String sellerId, String filterDate) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		params.put("filterDate", filterDate);
		List<Map> result = sqlSession.selectList("mapper.transaction.selectPSTransactionList", params);
		return result;
	}

	@Override
	public List<Map> selectPSTransactionListByDateRange(String sellerId, String startDate, String endDate)
			throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		List<Map> result = sqlSession.selectList("mapper.transaction.selectPSTransactionList", params);
		return result;
	}
	
	@Override
	public Company selectOneId(String id) throws Exception {
		return sqlSession.selectOne("mapper.CompanyMapper.selectOneCompany", id);
	}

	@Override
	public void updateStateTransactionState(Integer auctionNum) throws Exception {
		sqlSession.update("mapper.transaction.updateStateTransactionState", auctionNum);
		sqlSession.commit();
		
	}

}
