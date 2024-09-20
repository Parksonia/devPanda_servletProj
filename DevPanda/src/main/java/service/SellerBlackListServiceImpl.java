package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import repository.blacklist.BlacklistRepository;
import repository.blacklist.BlacklistRepositoryImpl;

public class SellerBlackListServiceImpl implements SellerBlackListService {
	private BlacklistRepository blRepo = new BlacklistRepositoryImpl();
	
	@Override
	public void insertSellerBlack(Map<String, Object> blistMap) throws Exception {
		blRepo.insertSellerBlack(blistMap);
	}

	@Override
	public List<Map> selectBlacklistById(String id, int page, int pageSize) throws Exception {
		Map<String, Object> blistMap = new HashMap<>();
		int offset = (page -1) * pageSize;

		blistMap.put("id", id);
		blistMap.put("offset", offset);
		blistMap.put("limit", pageSize);

		List<Map> blacklist = blRepo.selectBlacklistById(blistMap);
		return blacklist;
	}

	@Override
	public void deleteSellerBlack(Integer blackNum) throws Exception {
		blRepo.deleteBlacklistByNum(blackNum);	
	}

	@Override
	public int countBlacklistById(String id) throws Exception {
		return blRepo.countBlacklistById(id);
	}

}
