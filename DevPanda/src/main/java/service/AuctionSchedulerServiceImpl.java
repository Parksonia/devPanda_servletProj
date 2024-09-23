package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

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
                //String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
                System.out.println("Scheduler running at: " + currentDate);

                // 경매 상태를 'unprocessing'으로 업데이트
                try {
                    auctionSchedulerRepository.updateAuctionStatusToSuccess(currentDate);
                    auctionSchedulerRepository.updateBidStateToTwo(currentDate);
                    System.out.println("Updated auction status to success for date: " + currentDate);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // processing 상태가 아닌 경매 삭제
//                try {
//                    auctionSchedulerRepository.deleteNonProcessingAuctions();
//                    System.out.println("Deleted non-processing auctions");
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
            }
        };
        
        // 스케줄러가 매일 자정(00:00:00)에 실행되도록 설정
        //timer.scheduleAtFixedRate(task, 0, 24 * 60 * 60 * 1000);
        // 스케줄러가 1분마다 실행되도록 설정
        timer.scheduleAtFixedRate(task, 0, 60 * 1000);
    }
}
