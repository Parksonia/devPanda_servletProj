package repository.auction;

import dto.Auction;
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

}
