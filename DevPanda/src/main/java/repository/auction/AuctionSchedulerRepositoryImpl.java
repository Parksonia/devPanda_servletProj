package repository.auction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.ibatis.session.SqlSession;

import dto.Bid;
import dto.Transaction;
import util.MybatisSqlSessionFactory;

public class AuctionSchedulerRepositoryImpl implements AuctionSchedulerRepository {

    @Override
    public void updateAuctionStatusToSuccess(String currentDate) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            System.out.println("Updating auction status to 'unprocessing' where endDate <= " + currentDate);

            session.update("mapper.auction.updateAuctionStatusToSuccess", currentDate);
            session.commit();
        }
    }
    @Override
    public void updateBidStateToTwo(String currentDate) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            
            session.update("mapper.auction.updateBidStateToTwo", currentDate);
            session.commit();
        }
    


    }
    @Override
    public void updateWinningBidState(int auctionNum) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            session.update("mapper.auction.updateWinningBidState", auctionNum);
            session.commit();
        }
    }

    @Override
    public void updateLosingBiddersState(int auctionNum) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            session.update("mapper.auction.updateLosingBiddersState", auctionNum);
            session.commit();
        }
    }
    @Override
    public List<Integer> getFinishedAuctions(String currentDate) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            return session.selectList("mapper.auction.getFinishedAuctions", currentDate);
        }
    }
    
//    @Override
//    public void insertTransaction(Transaction transaction) {
//        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
//            session.insert("mapper.auction.insertTransaction", transaction);
//            session.commit();
//        }
//    }
    public void insertTransaction(Bid winningBid) {
    	// winningBid에서 buyPersonId를 추출하여 트랜잭션에 삽입하는 로직
        if (winningBid.getBuyPersonId() == null && winningBid.getBuyerId() == null) {
            System.out.println("Both Buyer ID and Buy Person ID are null. Cannot insert transaction.");
            return; // 또는 예외 처리
        }

        // Transaction 객체 생성
        Transaction transaction = new Transaction();
        transaction.setSellerId(winningBid.getSellerId());
        
        // Long을 Integer로 변환하여 설정
        transaction.setAuctionNum(winningBid.getAuctionNum() != null ? winningBid.getAuctionNum().intValue() : null);
        transaction.setBidNum(winningBid.getBidNum() != null ? winningBid.getBidNum().intValue() : null);
       
     // buyerId와 buyPersonId 중 하나만 설정
        if (winningBid.getBuyerId() != null) {
            transaction.setBuyerId(winningBid.getBuyerId()); // winningBid에서 buyerId 가져오기
        } else {
            transaction.setBuyerId(winningBid.getBuyPersonId()); // winningBid에서 buyPersonId 가져오기
        }
       
        transaction.setPrice(winningBid.getBidPrice());
        transaction.setState("i"); // 계약 상태 초기값 설정
        transaction.setMemType(winningBid.getMemType());

        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            session.insert("mapper.auction.insertTransaction", transaction);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
        }
    }



    @Override
    public List<Bid> getWinningBids(Integer auctionNum) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            return session.selectList("mapper.auction.getWinningBids", auctionNum);
        }
    }

    @Override
    public boolean checkIfTransactionExists(Integer auctionNum) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            // 파라미터로 전달할 정보
            Map<String, Object> params = new HashMap<>();
            params.put("auctionNum", auctionNum); // auctionNum을 파라미터로 사용

            // 쿼리 실행 후 결과 받기
            int count = session.selectOne("mapper.auction.checkIfTransactionExists", params);
            System.out.println("checkIfTransactionExists 호출: auctionNum = " + auctionNum);

            return count > 0;  // 0보다 크면 이미 트랜잭션이 존재
        }
    }

}
