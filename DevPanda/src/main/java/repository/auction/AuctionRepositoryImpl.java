package repository.auction;

import dto.Auction;
import dto.AuctionAndPerson;
import dto.Person;
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
	public List<Map<String, Object>> getAuctionsWithPersonInfo(int pageSize, int offset) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("getAuctionsWithPersonInfo", Map.of("pageSize", pageSize, "offset", offset));
		}
	}

	// selectOne 경매 하나 조회
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public Auction selectOneAuction(Integer auctionNum) throws Exception {
		return sqlSession.selectOne("mapper.auction.selectOneAuction", auctionNum);
	}
	
	
	@Override
	public AuctionAndPerson findAuctionAndPersonById(Integer auctionNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		AuctionAndPerson auctionAndPerson = null;
		try {
			String statement = "mapper.auction.findAuctionById";
			auctionAndPerson = sqlSession.selectOne(statement, auctionNum);
			
			
		}finally {
			
		}
		return auctionAndPerson;
	}

	@Override
	public List<AuctionAndPerson> findAllAuctionWithOffset(Integer offset) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<AuctionAndPerson> list = null;
		try {
			String statement = "mapper.auction.findAllAuctionWithOffset";
			list = sqlSession.selectList(statement, offset);
			
			
		}finally {
			
		}
		return list;
	}
	
	
	@Override
	public void updateAuction(Auction auction,SqlSession sqlSession) {
		// TODO Auto-generated method stub
		
		
		String statement = "mapper.auction.updateAuction";
		sqlSession.update(statement,auction);
	
	}

}
