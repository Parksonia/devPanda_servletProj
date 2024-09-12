package repository.bid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Bid;

public interface BidRepository {

	void insertBid(Bid bid,SqlSession sqlSession);

	Integer selectBuyBidCnt(HashMap<String, Object> pageInfo) throws Exception;

	List<Map> selectBuyBidList(Integer row, String id,String memType) throws Exception;

	void updateBidState(String id) throws Exception;

	List<Bid> selectAllBuyer(Integer auctionNum) throws Exception;
	
	List<Map> selectBuyBidWithCalDate(Integer row, String id, String nowStr, String pastDateStr, String memType)
			throws Exception;
}
