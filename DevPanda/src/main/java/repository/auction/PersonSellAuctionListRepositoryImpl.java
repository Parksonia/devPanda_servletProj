package repository.auction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class PersonSellAuctionListRepositoryImpl implements PersonSellAuctionListRepository {
	
	private SqlSession sqlSession;
	public PersonSellAuctionListRepositoryImpl() {
		this.sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public List<Map> selectPSAuctionList(String sellerId) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionList", params);
		return result;
	}

	@Override
	public List<Map> selectPSAuctionListByDate(String sellerId, String filterDate) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		params.put("filterDate", filterDate);
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionListByDate", params);
		return result;
	}

	@Override
	public List<Map> selectPSAuctionListByDateRange(String sellerId, String startDate, String endDate) {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionListByDateRange", params);
		return result;
	}

}
