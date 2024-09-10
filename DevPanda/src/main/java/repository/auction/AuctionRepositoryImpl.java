package repository.auction;

import dto.Auction;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.MybatisSqlSessionFactory;

import java.util.List;
import java.util.Map;

public class AuctionRepositoryImpl implements AuctionRepository {

	private final SqlSessionFactory sqlSessionFactory;

	public AuctionRepositoryImpl() {
		this.sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	}

	@Override
	public List<Auction> getAuctionsWithPagination(Map<String, Object> params) {
		// try-with-resources를 사용하여 세션을 자동으로 닫음
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			// MyBatis의 selectList 메서드를 사용하여 데이터베이스에서 데이터 조회
			return sqlSession.selectList("mapper.auction.getAuctionsWithPagination", params);
		}
	}
	
	//selectOne 경매 하나 조회 
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public Auction selectOneAuction(Integer auctionNum) throws Exception {
		return sqlSession.selectOne("mapper.auction.selectOneAuction", auctionNum);
	}
	
	
}
