package repository.bid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Bid;
import dto.Transaction;

public interface BidRepository {

	
	void updateBidState(Integer auctionNum, SqlSession sqlSession);
	
	void insertBid(Bid bid,SqlSession sqlSession);
	
	Integer selectCount(Map<String,Object> map,SqlSession sqlSession);
	
	
	
	void updateBid(Map<String,Object> map,SqlSession sqlSession);
	
	

	Integer selectBuyBidCnt(HashMap<String, Object> pageInfo) throws Exception;

	List<Map> selectBuyBidList(Integer row, String id,String memType) throws Exception;

	void updateBidState(String id) throws Exception;

	List<Bid> selectAllBuyer(Integer auctionNum) throws Exception;
	
	List<Map> selectBuyBidWithCalDate(Integer row, String id, String nowStr, String pastDateStr, String memType)
			throws Exception;
	
	boolean updateBidToTransaction(Transaction transaction,Integer bidNum,Integer auctionNum,Integer newBidPrice)throws Exception;
	boolean updateMyBid(Integer auctionNum,Integer bidNum,Integer newBidPrice) throws Exception;
}
