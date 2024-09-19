package service;

import java.util.List;
import java.util.Map;

import repository.auction.PersonSellAuctionListRepository;
import repository.auction.PersonSellAuctionListRepositoryImpl;

public class PersonSellAuctionListServiceImpl implements PersonSellAuctionListService {
	
	private PersonSellAuctionListRepository saRepo;
	
	public PersonSellAuctionListServiceImpl() {
		this.saRepo = new PersonSellAuctionListRepositoryImpl();
	}

	@Override
	public List<Map> personSellAuctionList(String sellerId, int limit, int offset) throws Exception {
		List<Map> sellAuctionList = saRepo.selectPSAuctionList(sellerId, limit, offset);
		return sellAuctionList;
	}

	@Override
	public List<Map> personSellAuctionListByDate(String sellerId, String filterDate, int limit, int offset) throws Exception {
		List<Map> sellAuctionList = saRepo.selectPSAuctionListByDate(sellerId, filterDate, limit, offset);
		return sellAuctionList;
	}

	@Override
	public List<Map> personSellAuctionListByDateRange(String sellerId, String startDate, String endDate, int limit, int offset) throws Exception {
		List<Map> sellAuctionList = saRepo.selectPSAuctionListByDateRange(sellerId, startDate, endDate, limit, offset);
		return sellAuctionList;
	}

	@Override
	public int countPSAuctionListBySellerId(String id) throws Exception {
		return saRepo.countPSAuctionListBySellerId(id);
	}

}
