package service;

import java.util.Map;

import dto.BlackList;
import repository.blacklist.BlacklistRepository;
import repository.blacklist.BlacklistRepositoryImpl;

public class BuyerBlackListServiceImpl implements BuyerBlackListService {
	private BlacklistRepository blRepo;
	
	public BuyerBlackListServiceImpl() {
		this.blRepo = new BlacklistRepositoryImpl();
	}

	@Override
	public void insertBuyerPersonBlack(Map<String, Object> blistMap) throws Exception {
		blRepo.insertBuyerPersonBlack(blistMap);
	}

	@Override
	public void insertBuyerComBlack(Map<String, Object> blistMap) throws Exception {
		blRepo.insertBuyerComblack(blistMap);
	}

	
}
