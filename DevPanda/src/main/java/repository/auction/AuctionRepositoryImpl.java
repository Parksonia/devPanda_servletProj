package repository.auction;

import org.apache.ibatis.session.SqlSession;

public class AuctionRepositoryImpl implements AuctionRepository {

	private SqlSession sqlSession;
	
	@Override
	public Integer selectAuctionNum() throws Exception {
		return sqlSession.selectOne("maaper.auction.selectAuctionNum");
	}

}
