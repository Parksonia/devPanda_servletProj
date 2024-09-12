package repository.blacklist;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.MybatisSqlSessionFactory;

public class CompanyBlacklistRepository {

    private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    // auctionNum으로 트랜잭션 조회
    public Map<String, Object> getTransactionByAuctionNum(String auctionNum) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("CompanyBlacklistMapper.getTransactionByAuctionNum", auctionNum);
        }
    }

    // 블랙리스트에 추가
    public boolean addToBlacklist(int transactionNum, int bidNum, String declCom, String blackPerson, String title, String content, String roleType) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("transactionNum", transactionNum);
            params.put("bidNum", bidNum);
            params.put("declCom", declCom);
            params.put("blackPerson", blackPerson);
            params.put("title", title);
            params.put("content", content);
            params.put("roleType", roleType);

            int result = session.insert("CompanyBlacklistMapper.addToBlacklist", params);
            session.commit();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}