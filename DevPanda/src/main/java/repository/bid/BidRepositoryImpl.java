package repository.bid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Bid;
import util.MybatisSqlSessionFactory;

public class BidRepositoryImpl implements BidRepository {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	// 이미 session getSession 메서드가 util 패키지의 MybatisSqlSessionFactory에 존재, 객체 생성함
	private SqlSession getSqlSession() {
		return MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public int insertBid(Bid bid) {
		
		SqlSession sqlSession = getSqlSession();
		int result = 0;

		try {
			String statement = "mapper.bid.insertBid";
			result = sqlSession.insert(statement, bid);
			if (result > 0)
				sqlSession.commit();

		} finally {
			sqlSession.close();

		}

		return result;
	}

	public static void main(String[] args) {
		// bid insert test!!
		BidRepository bidRepository = new BidRepositoryImpl();
		Bid bid = new Bid();
		bid.setBuyerId("a");
		bid.setBuyPersonId(null);
		bid.setAuctionNum(1L);
		bid.setSellerId("c");
		bid.setBidDate("2020-01-01");
		bid.setBidPrice(10000);
		bid.setBidState(1);
		bid.setMemType("type");

		int result = bidRepository.insertBid(bid);
		//System.out.println(result);

	}
	
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 페이지 계산을 위한 Buyer의 BidList 전체 수 조회
	@Override
	public Integer selectBuyBidCnt(HashMap<String, Object> pageInfo) throws Exception {

		return sqlSession.selectOne("mapper.bid.selectBuyBidCnt", pageInfo);

	}
	@Override
	public List<Map> selectBuyBidList(Integer row, String id,String userType) throws Exception {
		HashMap<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("row", row);
		param.put("memType", userType);
		List<Map> result = sqlSession.selectList("mapper.bid.selectBuyBidList", param);
		return result;
	}

	// 날짜 범위에 따라 게산된 리스트 조회 
	@Override
	public List<Map> selectBuyBidWithCalDate(Integer row, String id, String nowStr, String pastDateStr,String memType)
			throws Exception {
		HashMap<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("row", row);
		param.put("nowDate", nowStr);
		param.put("pastDate", pastDateStr);
		param.put("memType", memType);
		List<Map> result = sqlSession.selectList("mapper.bid.selectBuyBidList", param);

		return result;
	}

	// 입찰 상태 업데이트 (입찰-> 낙찰/ 입찰도 진행중과 실패로 나윔)
	@Override
	public void updateBidState(String id) throws Exception {
		try {
			sqlSession.getConnection().setAutoCommit(false);
			sqlSession.update("mapper.bid.updateBuyerBidState", id);
			sqlSession.commit();

		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}
	}

	//상세 페이지의 모든 입찰 참여자 리스트 조회 
	@Override
	public List<Bid> selectAllBuyer(Integer auctionNum) throws Exception {
		return sqlSession.selectList("mapper.bid.selectAllBuyer", auctionNum);
	}
}