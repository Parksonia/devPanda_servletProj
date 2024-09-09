package service;

import dto.Auction;
import repository.auction.AuctionRepository;
import repository.auction.AuctionRepositoryImpl;
import java.util.List;

public class AuctionServiceImpl implements AuctionService {
	private AuctionRepository auctionRepository;

	public AuctionServiceImpl() {
		this.auctionRepository = new AuctionRepositoryImpl();
	}

//	@Override
//	public List<Auction> getAllAuctions() {
//		// MyBatis 쿼리 실행 로직 확인
//		List<Auction> auctions = auctionRepository.selectAllAuctions();
//		return auctions;
//	}
	@Override
	public List<Auction> getAllAuctions(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return auctionRepository.getAuctionsWithPagination(offset, pageSize);
	}

}
