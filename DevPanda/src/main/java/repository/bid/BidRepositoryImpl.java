package repository.bid;

import org.apache.ibatis.session.SqlSession;

import dto.Bid;
import util.MybatisSqlSessionFactory;

public class BidRepositoryImpl implements BidRepository {
	
	private SqlSession getSqlSession() {
		return MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public int insertBid(Bid bid) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = getSqlSession();
		int result=0;
		
		try {
			String statement = "mapper.bid.insertBid";
			result = sqlSession.insert(statement,bid);
			if(result>0) sqlSession.commit();
		
		
		}finally {
			sqlSession.close();
			
		}	
		
		return result;
	}
	
	
	
	
	
	
	public static void main(String[] args) {
		//bid insert test!!
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
		System.out.println(result);
		

	}

	

}
