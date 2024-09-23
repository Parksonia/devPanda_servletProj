package repository.auction;

import org.apache.ibatis.session.SqlSession;
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
    

//    @Override
//    public void deleteNonProcessingAuctions() {
//        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
//            System.out.println("Deleting non-processing auctions");
//
//            session.delete("mapper.auction.deleteNonProcessingAuctions");
//            session.commit();
//        }
//    }
    }
}
