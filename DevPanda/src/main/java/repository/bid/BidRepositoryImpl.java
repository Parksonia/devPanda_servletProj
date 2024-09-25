package repository.bid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Bid;
import dto.Transaction;
import util.MybatisSqlSessionFactory;

public class BidRepositoryImpl implements BidRepository {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	// 이미 session getSession 메서드가 util 패키지의 MybatisSqlSessionFactory에 존재, 객체 생성함
	private SqlSession getSqlSession() {
		return MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public void insertBid(Bid bid,SqlSession sqlSession) {
		// TODO Auto-generated method stub
		
		
		String statement = "mapper.bid.insertBid";
		sqlSession.insert(statement,bid);
		
		
		
		
	}
	
	
	@Override
	public Integer selectCount(Map<String, Object> map, SqlSession sqlSession) {
		String statement = "mapper.bid.selectCount";
		return sqlSession.selectOne(statement, map);
		
	}


	
	
	
	@Override
	public void updateBid(Map<String, Object> map, SqlSession sqlSession) {
		String statement = "mapper.bid.updateBid";
		sqlSession.update(statement,map);
	}


	
	
	
	@Override
	public void updateBidState(Integer auctionNum, SqlSession sqlSession) {
		String statement = "mapper.bid.updateBidState";
		sqlSession.update(statement,auctionNum);
		sqlSession.commit();
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

	


	//즉시구매 transaction처리
	@Override
	public boolean updateBidToTransaction(Transaction transaction,Integer bidNum,Integer auctionNum,Integer newBidPrice) throws Exception {
		HashMap<String,Object> param = new HashMap<>();
		param.put("bidNum", bidNum);
		param.put("auctionNum", auctionNum);
		param.put("newBidPrice", newBidPrice);
		
		try {
			
			//1-1.mybid 수정
			sqlSession.update("mapper.bid.updateMyBid",param);
			//1-2.allbuyers state=0 update
			sqlSession.update("mapper.bid.updateAllbuersState",param);
			//2.Auction수정
			sqlSession.update("mapper.bid.updateAuctionStatus",param);
			//3.Transaction 추가(nowAuction에서 즉시구매하는 경우) 
			sqlSession.insert("mapper.bid.insertNewTransaction",transaction);
		
			//성공 시 commit 진행
			sqlSession.commit();
			
			
		} catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
				throw e;
		}
		return true;
	}
	//입찰변경 transaction
	@Override
	public boolean updateMyBid(Integer auctionNum,Integer bidNum,Integer newBidPrice) throws Exception {
		
		HashMap<String,Object> param = new HashMap<>();
		param.put("bidNum", bidNum);
		param.put("auctionNum", auctionNum);
		param.put("newBidPrice", newBidPrice);

		
		try {
			
			//1.mybid 수정
			sqlSession.update("mapper.bid.updateMyBidprice",param);
			//2.Auction 수정 
			sqlSession.update("mapper.bid.updateAuctionMaxPrice",param);
			//성공 시 commit 진행
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			throw e;
		}
		return true;
	}








}