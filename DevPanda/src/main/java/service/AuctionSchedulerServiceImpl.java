package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import dto.Bid;
import repository.auction.AuctionSchedulerRepository;
import repository.auction.AuctionSchedulerRepositoryImpl;

public class AuctionSchedulerServiceImpl implements AuctionSchedulerService {

    private AuctionSchedulerRepository auctionSchedulerRepository = new AuctionSchedulerRepositoryImpl();
    
    @Override
    public void startScheduler() {
        Timer timer = new Timer();
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
                System.out.println("Scheduler running at: " + currentDate);

                try {
                    auctionSchedulerRepository.updateAuctionStatusToSuccess(currentDate);
                    List<Integer> finishedAuctions = auctionSchedulerRepository.getFinishedAuctions(currentDate);
                    for (Integer auctionNum : finishedAuctions) {
                        // 낙찰자 상태 업데이트
                        auctionSchedulerRepository.updateWinningBidState(auctionNum);

                        // bidState가 2인 Bid 정보를 가져오기
                        List<Bid> winningBids = auctionSchedulerRepository.getWinningBids(auctionNum);
                        for (Bid winningBid : winningBids) {
                            // Buy Person ID가 null인 경우 건너뜀
                            if (winningBid.getBuyPersonId() == null) {
                                System.out.println("Buy Person ID is null for auctionNum: " + auctionNum);
                                continue; 
                            }

                            // Bid 객체를 사용하여 Transaction을 삽입
                            auctionSchedulerRepository.insertTransaction(winningBid); // Bid 객체를 사용하여 트랜잭션 삽입
                        }

                        auctionSchedulerRepository.updateLosingBiddersState(auctionNum);
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
