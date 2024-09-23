package repository.auction;

public interface AuctionSchedulerRepository {
    void updateAuctionStatusToSuccess(String currentDate);
//    void deleteNonProcessingAuctions();
}
