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
	public List<Map> personSellAuctionList() throws Exception {
		List<Map> sellAuctionList = saRepo.selectPSAuctionList();
		return sellAuctionList;
	}

	@Override
	public List<Map> personSellAuctionListByDate(String filterDate) throws Exception {
		List<Map> sellAuctionList = saRepo.selectPSAuctionListByDate(filterDate);
		return sellAuctionList;
	}

	@Override
	public List<Map> personSellAuctionListByDateRange(String startDate, String endDate) throws Exception {
		List<Map> sellAuctionList = saRepo.selectPSAuctionListByDateRange(startDate, endDate);
		return sellAuctionList;
	}

}
