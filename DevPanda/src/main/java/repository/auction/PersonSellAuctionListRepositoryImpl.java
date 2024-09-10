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
	public List<Map> selectPSAuctionList() throws Exception {
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionList");
		return result;
	}

	@Override
	public List<Map> selectPSAuctionListByDate(String filterDate) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("filterDate", filterDate);
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionListByDate", params);
		return result;
	}

	@Override
	public List<Map> selectPSAuctionListByDateRange(String startDate, String endDate) {
		Map<String, Object> params = new HashMap<>();
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		List<Map> result = sqlSession.selectList("mapper.auction.selectPSAuctionListByDateRange", params);
		return result;
	}

}
