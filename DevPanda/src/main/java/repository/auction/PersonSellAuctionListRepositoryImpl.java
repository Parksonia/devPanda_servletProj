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
	public List<Map> selectPSAuctionList(String sellerId, int limit, int offset) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		params.put("limit", limit);
		params.put("offset", offset);
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionList", params);
		return result;
	}

	@Override
	public List<Map> selectPSAuctionListByDate(String sellerId, String filterDate, int limit, int offset) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		params.put("filterDate", filterDate);
		params.put("limit", limit);
		params.put("offset", offset);
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionListByDate", params);
		return result;
	}

	@Override
	public List<Map> selectPSAuctionListByDateRange(String sellerId, String startDate, String endDate, int limit, int offset) {
		Map<String, Object> params = new HashMap<>();
		params.put("sellerId", sellerId);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		params.put("limit", limit);
		params.put("offset", offset);
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionListByDateRange", params);
		return result;
	}

	@Override
	public int countPSAuctionListBySellerId(String id) throws Exception {
		return sqlSession.selectOne("mapper.auction.countPSAuctionListBySellerId", id);
	}

}

