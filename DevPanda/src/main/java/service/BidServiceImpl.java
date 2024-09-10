package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Auction;
import dto.Bid;
import repository.bid.BidRepository;
import repository.bid.BidRepositoryImpl;
import util.PageInfo;

public class BidServiceImpl implements BidService {

	private BidRepository bidRepository;
	public BidServiceImpl() {
		this.bidRepository = new BidRepositoryImpl();
	}
	
	//전체 리스트 출력 서비스
	@Override
	public List<Map> bidListAll(PageInfo pageInfo,String id) throws Exception {		
		

		//**bidState 업데이트를 먼저 진행하고 리스트를 호출해야함**(1:진행중/0: 종료/2: 기간종료낙찰/ 3:즉시 낙찰)
		bidRepository.updateBidState(id);
		
		//더보기 기능 위한maxPage 계산
		HashMap<String,Object>pageinfo = new HashMap<>();
		pageinfo.put("id", id);
		//리스트 총 행의 수 리턴 
		int maxCnt =bidRepository.selectBuyBidCnt(pageinfo); 
		int allPage = (int)Math.ceil((double)maxCnt/6);
		//끝페이지 정보 저장 
		pageInfo.setAllPage(allPage); 
		
		if(pageInfo.getCurPage() > allPage ) return null;
		int row = (pageInfo.getCurPage()-1)*6;
		
		 List<Map> buyBidList = bidRepository.selectBuyBidList(row,id);
		 // 프론트에서 처리하지만 buybidList.size() 가 <6 작은경우 allPage를 1로 고정해도 좋을 것 같다..
		 if(buyBidList.size()<6) {
			 pageInfo.setAllPage(1);
		 }
		 
		
		return buyBidList;
	}

	//전체 리스트 날짜 계산된 리스트 출력 서비스
	@Override
	public List<Map> bidListAllWithCalDate(PageInfo pageInfo,String id, String nowStr, String pastDateStr) throws Exception {

		//**bidState 업데이트를 먼저 진행하고 리스트를 호출해야함**  (1:진행중/0: 종료/2: 기간종료낙찰/ 3:즉시 낙찰)
		bidRepository.updateBidState(id);
		
		//더보기 기능 위한maxPage 계산
		HashMap<String,Object>pageinfo = new HashMap<>();
		pageinfo.put("id", id);
		pageinfo.put("nowDate", nowStr);
		pageinfo.put("pastDate", pastDateStr);
		//리스트 총 행의 수 리턴 
		int maxCnt = bidRepository.selectBuyBidCnt(pageinfo); 
		
		int allPage = (int)Math.ceil((double)maxCnt/6);
		//끝페이지 정보 저장 

		pageInfo.setAllPage(allPage);
		
		if(pageInfo.getCurPage() > allPage ) return null;
		int row = (pageInfo.getCurPage()-1)*6;
		
		 List<Map> buyBidList = bidRepository.selectBuyBidWithCalDate(row,id,nowStr,pastDateStr);
		 // 프론트에서 처리하지만 buybidList.size() 가 <6 작은경우 allPage를 1로 고정해도 좋을 것 같다..
		 if(buyBidList.size()<=6) {
			 
			 pageInfo.setAllPage(1);
			//끝페이지 정보 저장 

		 }
		 
		 
		return buyBidList;
	}

	// 한 경매에 참여한 모든 구매자 정보 조회
	@Override
	public List<Bid> bidAllBuyer(Integer auctionNum) throws Exception {
			
		List<Bid> allbuyers = bidRepository.selectAllBuyer(auctionNum);
		
		return allbuyers;
	}

}
