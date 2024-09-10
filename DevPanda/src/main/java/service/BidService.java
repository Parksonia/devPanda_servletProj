package service;

import java.util.List;
import java.util.Map;

import dto.Bid;
import util.PageInfo;

public interface BidService {

	List<Map>bidListAll(PageInfo pageInfo,String id) throws Exception;
	
	List<Map>bidListAllWithCalDate(PageInfo pageInfo,String id,String nowStr,String pastDateStr)throws Exception;
	
	List<Bid> bidAllBuyer(Integer auctionNum) throws Exception;
	
	
}
