package service;

import dto.Auction;
import java.util.List;

public interface AuctionService {
//    List<Auction> getAllAuctions();  
	List<Auction> getAllAuctions(int page, int pageSize);

}
