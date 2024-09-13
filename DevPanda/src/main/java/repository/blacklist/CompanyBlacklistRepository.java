package repository.blacklist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.BlackList;
import util.MybatisSqlSessionFactory;

public class CompanyBlacklistRepository {

    public Map<String, Object> getComAuctionDetailsByAuctionNum(int auctionNum) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            return session.selectOne("mapper.blacklist.getComAuctionDetailsByAuctionNum", auctionNum);
        }
    }

    public boolean addToComBlacklist(BlackList blacklist) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            int result = session.insert("mapper.blacklist.addToComBlacklist", blacklist);
            session.commit();
            return result > 0;
        }
    }
    public List<Map<String, Object>> getComBlackListByBlackNum(String blackNum) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            return session.selectList("mapper.blacklist.getComBlackListByBlackNum", blackNum); // selectList로 변경
        }
    }
    
}
