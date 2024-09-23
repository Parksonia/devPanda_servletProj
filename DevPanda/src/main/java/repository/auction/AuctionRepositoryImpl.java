package repository.auction;

import dto.Auction;
import dto.AuctionAndPerson;
import dto.MapperSearchCondition;
import dto.Person;
import dto.SearchCondition;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import util.MybatisSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AuctionRepositoryImpl implements AuctionRepository {

	private final SqlSessionFactory sqlSessionFactory;

	public AuctionRepositoryImpl() {
		this.sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	}

	@Override
	public List<AuctionAndPerson> getFilteredAuctionsWithPersonInfo(int offset, int pageSize,
			 String[] location, String[] stack, String[] Occupation, String[] period, String[] education, String[] Certification, String[] employmentType) {
	    try (SqlSession session = sqlSessionFactory.openSession()) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("offset", offset);
	        params.put("pageSize", pageSize);
	        params.put("location", (location != null && location.length > 0) ? location : null);
	        params.put("stack", (stack != null && stack.length > 0) ? stack : null);
	        params.put("Occupation", (Occupation != null && Occupation.length > 0) ? Occupation : null);
	        params.put("period", (period != null && period.length > 0) ? period : null);
	        params.put("education", (education != null && education.length > 0) ? education : null);
	        params.put("Certification", (Certification != null && Certification.length > 0) ? Certification : null);
	        params.put("employmentType", (employmentType != null && employmentType.length > 0) ? employmentType : null);

	        System.out.println("Fetching auctions with offset: " + offset + ", pageSize: " + pageSize);

	        List<AuctionAndPerson> auctions = session.selectList("mapper.auction.getFilteredAuctionsWithPersonInfo", params);
	        
	        // 결과 로그
	        System.out.println("Query result: " + auctions);

	        return auctions;
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new RuntimeException("Error fetching auctions", e);
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

		} finally {

		}
		return auctionAndPerson;
	}

	@Override
	public List<AuctionAndPerson> findAllAuctionWithOffset(MapperSearchCondition mapperSearchCondition) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<AuctionAndPerson> list = null;
		try {
			String statement = "mapper.auction.findAllAuctionWithOffset";
			list = sqlSession.selectList(statement, mapperSearchCondition);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			return list;
		}
		
		finally {
			
		}
		return list;
	}

	@Override
	public void updateAuction(Auction auction, SqlSession sqlSession) {
		// TODO Auto-generated method stub

		String statement = "mapper.auction.updateAuction";
		sqlSession.update(statement, auction);

	}
	
	
	public static void main(String[] args) {
		SearchCondition searchCondition = new SearchCondition();
		searchCondition.setStack("Java,UML");
		MapperSearchCondition mapperSearchCondition = MapperSearchCondition.extractMapperSearchCondition(searchCondition);
		mapperSearchCondition.setOffset(0);
		
		
		AuctionRepositoryImpl auctionRepositoryImpl = new AuctionRepositoryImpl();
		
		List<AuctionAndPerson> list = auctionRepositoryImpl.findAllAuctionWithOffset(mapperSearchCondition);
		
	}
	
	@Override
	   public void updateAuctionSuccess(Auction auction, SqlSession sqlSession) {
	      // TODO Auto-generated method stub
	      String statement = "mapper.auction.updateAuctionSuccess";
	      sqlSession.update(statement, auction);
	   }
	

}
