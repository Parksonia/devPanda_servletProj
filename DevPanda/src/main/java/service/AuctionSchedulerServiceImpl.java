package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import dto.Bid;
import repository.auction.AuctionSchedulerRepository;
import repository.auction.AuctionSchedulerRepositoryImpl;

public class AuctionSchedulerServiceImpl implements AuctionSchedulerService {

    private AuctionSchedulerRepository auctionSchedulerRepository = new AuctionSchedulerRepositoryImpl();
    
    // 이미 처리된 경매 번호를 저장하는 Set
    private Set<Integer> processedAuctions = new HashSet<>();
    
    @Override
    public void startScheduler() {
        Timer timer = new Timer();
        TimerTask task = new TimerTask() {
        	@Override
        	public void run() {
        	    String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        	    System.out.println("Scheduler running at: " + currentDate);

        	    try {
        	        // 경매 상태 업데이트
        	        auctionSchedulerRepository.updateAuctionStatusToSuccess(currentDate);
        	        // 종료된 경매 가져오기
        	        List<Integer> finishedAuctions = auctionSchedulerRepository.getFinishedAuctions(currentDate);
        	        for (Integer auctionNum : finishedAuctions) {
        	            // 이미 처리된 경매는 건너뜀
        	            if (processedAuctions.contains(auctionNum)) {
        	                System.out.println("Auction " + auctionNum + " already processed, skipping.");
        	                continue; // 이미 처리된 경매는 생략
        	            }

        	            // 낙찰자 상태 업데이트
        	            auctionSchedulerRepository.updateWinningBidState(auctionNum);

        	            // bidState가 2인 Bid 정보를 가져오기
        	            List<Bid> winningBids = auctionSchedulerRepository.getWinningBids(auctionNum);
        	            for (Bid winningBid : winningBids) {
        	                // Buy Person ID가 null인 경우
        	                if (winningBid.getBuyPersonId() == null) {
        	                    // buyerId가 null이 아닌 경우에 Buy Person ID로 설정
        	                    if (winningBid.getBuyerId() != null) {
        	                        System.out.println("Setting Buy Person ID to Buyer ID for auctionNum: " + auctionNum);
        	                        winningBid.setBuyPersonId(winningBid.getBuyerId());
        	                    } else {
        	                        System.out.println("Both Buy Person ID and Buyer ID are null for auctionNum: " + auctionNum);
        	                        continue; 
        	                    }
        	                }

        	                // 이미 트랜잭션 테이블에 해당 경매의 트랜잭션이 존재하는지 확인
        	                boolean transactionExists = auctionSchedulerRepository.checkIfTransactionExists(winningBid.getAuctionNum().intValue());
        	                if (!transactionExists) {
        	                    // Bid 객체를 사용하여 Transaction을 삽입
        	                    auctionSchedulerRepository.insertTransaction(winningBid); // Bid 객체를 사용하여 트랜잭션 삽입
        	                } else {
        	                    System.out.println("Transaction already exists for auctionNum: " + auctionNum);
        	                }
        	            }
        	            // 낙찰에 실패한 입찰자 상태 업데이트
        	            auctionSchedulerRepository.updateLosingBiddersState(auctionNum);
        	            
        	            // 처리된 경매 번호를 추가
        	            processedAuctions.add(auctionNum);
        	        }
        	        System.out.println("Updated auction and bid states for date: " + currentDate);
        	    } catch (Exception e) {
        	        e.printStackTrace();
        	    }
        	}

        };

        // 스케줄러가 매일 자정(00:00:00)에 실행되도록 설정
        // timer.scheduleAtFixedRate(task, 0, 24 * 60 * 60 * 1000);
        // 스케줄러가 1분마다 실행되도록 설정
        timer.scheduleAtFixedRate(task, 0, 60 * 1000);
    }
}