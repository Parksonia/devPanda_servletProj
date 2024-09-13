package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Bid;
import dto.Transaction;
import repository.bid.BidRepository;
import repository.bid.BidRepositoryImpl;
import repository.company.CompanyRepository;
import repository.company.CompanyRepositoryImpl;
import repository.person.PersonRepository;
import repository.person.PersonRepositoryImpl;
import util.PageInfo;

public class BidServiceImpl implements BidService {

	private BidRepository bidRepository;
	public BidServiceImpl() {
		this.bidRepository = new BidRepositoryImpl();
	}
	
	//전체 리스트 출력 서비스
	@Override
	public List<Map> bidListAll(PageInfo pageInfo,String id,String memType) throws Exception {		
		

		//**bidState 업데이트를 먼저 진행하고 리스트를 호출해야함**(1:진행중/0: 종료/2: 기간종료낙찰/ 3:즉시 낙찰)
		//bidRepository.updateBidState(id);
		
		//더보기 기능 위한maxPage 계산
		HashMap<String,Object>pageinfo = new HashMap<>();
		pageinfo.put("id", id);
		pageinfo.put("memType", memType);
		
		//리스트 총 행의 수 리턴
		int maxCnt =bidRepository.selectBuyBidCnt(pageinfo); 
		int allPage = (int)Math.ceil((double)maxCnt/6);
		
		//끝페이지 정보 저장 
		pageInfo.setAllPage(allPage); 
		
		if(pageInfo.getCurPage() > allPage ) return null;
		int row = (pageInfo.getCurPage() - 1) * 6;
		
		 List<Map> buyBidList = bidRepository.selectBuyBidList(row,id,memType);
		 // 프론트에서 처리하지만 buybidList.size() 가 <6 작은경우 allPage를 1로 고정해도 좋을 것 같다..
		 if(buyBidList.size()<6) {
			 pageInfo.setAllPage(1);
		 }
		 
		
		return buyBidList;
	}

	//전체 리스트 날짜 계산된 리스트 출력 서비스
	@Override
	public List<Map> bidListAllWithCalDate(PageInfo pageInfo,String id, String nowStr, String pastDateStr,String memType) throws Exception {

		//**bidState 업데이트를 먼저 진행하고 리스트를 호출해야함**  (1:진행중/0: 종료/2: 기간종료낙찰/ 3:즉시 낙찰)
		//bidRepository.updateBidState(id);
		
		//더보기 기능 위한maxPage 계산
		 HashMap<String, Object> pageinfo = new HashMap<>();
		    pageinfo.put("id", id);
		    pageinfo.put("nowDate", nowStr);
		    pageinfo.put("pastDate", pastDateStr);
		    pageinfo.put("memType", memType);
		//리스트 총 행의 수 리턴 
		int maxCnt =  bidRepository.selectBuyBidCnt(pageinfo);
		
		int allPage = (int) Math.ceil((double) maxCnt / 6);
		//끝페이지 정보 저장 

		pageInfo.setAllPage(allPage);
		
		if (pageInfo.getCurPage() > allPage) return null;
		int row = (pageInfo.getCurPage() - 1) * 6;
		
		 List<Map> buyBidList = bidRepository.selectBuyBidWithCalDate(row,id,nowStr,pastDateStr,memType);
		 // 프론트에서 처리하지만 buybidList.size() 가 <6 작은경우 allPage를 1로 고정해도 좋을 것 같다..
		 if (buyBidList.size() < 6 && pageInfo.getCurPage() == allPage) {
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
	
	// company repository, person repository호출 하여 존재하는 아이디인지 확인하여 memType String 반환 
	@Override
	public String getUserType(String userId) throws Exception {

		CompanyRepository cRepo = new CompanyRepositoryImpl();
		PersonRepository pRepo = new PersonRepositoryImpl();
		
		
		if(cRepo.isIdExists(userId)) {
			return "company";
		}else if(pRepo.isIdExists(userId)) {
			return "person";
		}		
		
		return null;
	}
	//nowAuction에서 BidPrice를 변경함 
	@Override
	public boolean updateMyBidPrice(Integer auctionNum,Integer bidNum,Integer newBidPrice,Integer maxSalary,String sellerId,String myId,String userType) throws Exception {
		boolean result = false;
		try {
			// 조건을 디버깅 로그로 확인
	        System.out.println("newBidPrice: " + newBidPrice + ", maxSalary: " + maxSalary +"auctionNum" +auctionNum +"bidNum :" +bidNum);
	        
			
			//즉시낙찰
			if(newBidPrice.equals(maxSalary)) {  // Integer객체 비교는 같은 주소값 참조하니 equals로 비교했어야 함
				Transaction transaction = new Transaction();
				transaction.setSellerId(sellerId);
				transaction.setAuctionNum(auctionNum);
				transaction.setBidNum(bidNum);
				transaction.setBuyerId(myId);
				transaction.setPrice(newBidPrice);
				transaction.setState("i");
				if(userType.equals("company")) {
					transaction.setMemType("C");
				}else {
					transaction.setMemType("P");
				}
	
				result = bidRepository.updateBidToTransaction(transaction,bidNum,auctionNum,newBidPrice);
				   System.out.println("즉시 낙찰 처리 결과: " + result);
				return result;
				
			//입찰금액변경
			}else {
				result = bidRepository.updateMyBid(auctionNum,bidNum,newBidPrice);
				System.out.println("입찰 변경 처리 결과: " + result);
				return result;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
}
