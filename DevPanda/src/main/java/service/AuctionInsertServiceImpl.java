package service;

import repository.auction.AuctionInsertRepository;
import repository.auction.AuctionInsertRepositoryImpl;

import dto.Auction;

public class AuctionInsertServiceImpl implements AuctionInsertService {
    private AuctionInsertRepository auctionInsertRepository = new AuctionInsertRepositoryImpl();

    @Override
    public void insertAuction(Auction auction) {
        auctionInsertRepository.insertAuction(auction);
    }
}
