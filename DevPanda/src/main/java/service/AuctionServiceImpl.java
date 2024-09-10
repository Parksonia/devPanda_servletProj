package service;

import dto.Auction;
import repository.auction.AuctionRepository;
import repository.auction.AuctionRepositoryImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AuctionServiceImpl implements AuctionService {
	private AuctionRepository auctionRepository;

	public AuctionServiceImpl() {
		this.auctionRepository = new AuctionRepositoryImpl();
	}

	@Override
	public List<Auction> getAllAuctions(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> params = new HashMap<>();
		params.put("limit", pageSize);
		params.put("offset", offset);

		return auctionRepository.getAuctionsWithPagination(params);
	}
}
