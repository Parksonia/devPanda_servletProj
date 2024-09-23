package repository.auction;

import dto.Auction;
import dto.AuctionAndPerson;
import dto.MapperSearchCondition;
import dto.Person;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface AuctionRepository {
	 List<AuctionAndPerson> getFilteredAuctionsWithPersonInfo(int offset, int pageSize,
	 String[] location, String[] stack, String[] Occupation, String[] period, String[] education, String[] Certification, String[] employmentType);
	
	// 개인 옥션정보 상세보기 조회
	Auction selectOneAuction(Integer auctionNum) throws Exception;
	
	AuctionAndPerson findAuctionAndPersonById(Integer auctionNum);
	
	
	List<AuctionAndPerson> findAllAuctionWithOffset(MapperSearchCondition mapperSearchCondition);
	
	void updateAuction(Auction auction,SqlSession sqlSession);
	
	void updateAuctionSuccess(Auction auction,SqlSession sqlSession);
}