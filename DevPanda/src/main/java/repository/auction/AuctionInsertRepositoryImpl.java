package repository.auction;

import org.apache.ibatis.session.SqlSession;

import dto.Auction;
import util.MybatisSqlSessionFactory;

public class AuctionInsertRepositoryImpl implements AuctionInsertRepository {
	@Override
	public void insertAuction(Auction auction) {
		try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
			session.insert("mapper.auction.insertAuction", auction);
			session.commit();
		}
	}
	
	
}
