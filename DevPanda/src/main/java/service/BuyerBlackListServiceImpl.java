package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dto.BlackList;
import repository.blacklist.BlacklistRepository;
import repository.blacklist.BlacklistRepositoryImpl;
import util.PageInfo;

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

	@Override
	public List<Map> buyerPersonSellerBlackList(String id,PageInfo pageInfo) throws Exception {
		Integer sellerBkCnt = blRepo.buyerPersontSellerBlackListCnt(id);
	
		Integer allPage = (int)Math.ceil((double)sellerBkCnt/10);
		//startButton 1,11,21....
		Integer startPage = (pageInfo.getCurPage()-1)/10*10+1; //1,11,21,31....
		//endButton
		Integer endPage = startPage+10-1;
		if(endPage > allPage) endPage = allPage;
		
		pageInfo.setTotalCnt(sellerBkCnt);
		pageInfo.setAllPage(allPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage); 
		//페이지 의 시작하는  로우를 계산
		Integer row = (pageInfo.getCurPage()-1) *10; // "1"~10/ "11"~20/ "21"~30....  
		
		
		List<Map>sellerAllList = new ArrayList<>();
		sellerAllList = blRepo.allBuyerPersonSellerBlackList(id,row); 
		
		
		return sellerAllList;
	}

	@Override
	public boolean buyerPersonDeleteSellerBlack(Integer blackNum) throws Exception {
		Integer result = blRepo.deleteSellerBlackForBuyerPerson(blackNum);
		if(result>0) {
			return true;
		}
		return false;
		
	}

}
