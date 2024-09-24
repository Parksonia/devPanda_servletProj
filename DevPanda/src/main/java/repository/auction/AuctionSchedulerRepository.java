package repository.auction;

import java.util.List;

import dto.Transaction;
import dto.Bid;

public interface AuctionSchedulerRepository {
    void updateAuctionStatusToSuccess(String currentDate);
    void updateBidStateToTwo(String currentDate);
    void updateWinningBidState(int auctionNum);
    void updateLosingBiddersState(int auctionNum);
    
    List<Integer> getFinishedAuctions(String currentDate);
    
    void insertTransaction(Bid bid); 
	List<Bid> getWinningBids(Integer auctionNum);

  

}
