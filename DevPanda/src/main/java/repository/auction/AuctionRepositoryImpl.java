package repository.auction;

import dto.Auction;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.MybatisSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AuctionRepositoryImpl implements AuctionRepository {

	private SqlSessionFactory sqlSessionFactory;

	public AuctionRepositoryImpl() {
		this.sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	}

	@Override
	public List<Auction> selectAllAuctions() {
		// try-with-resources를 사용하여 세션을 자동으로 닫음
		try (SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
			// 네임스페이스를 mapper.auction으로 맞춤
			return sqlSession.selectList("mapper.auction.selectAllAuctions");
		}
	}

	public List<Auction> getAuctionsWithPagination(int offset, int limit) {
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("limit", limit);

		try (SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
			// MyBatis의 selectList 메서드를 사용하여 데이터베이스에서 데이터 조회
			return sqlSession.selectList("mapper.auction.selectAuctionsWithPagination", params);

		}
	}

}
