package repository.transaction;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.MybatisSqlSessionFactory;

public class CompanyAuctionBuyerSucRepository { // 회사 상세 페이지 데이터 가져오는 클래스
	private SqlSessionFactory sqlSessionFactory;

	public CompanyAuctionBuyerSucRepository() {
		this.sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	}

	public Map<String, Object> getCompanyByBuyerId(Integer auctionNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("getCompanyByBuyerId", auctionNum);
		}
	}

	public Map<String, Object> getPersonBySellerId(Integer auctionNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("getPersonBySellerId", auctionNum);
		}
	}

	public Map<String, Object> getAuctionByAuctionNum(Integer auctionNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("getAuctionByAuctionNum", auctionNum);
		}
	}

	public List<Map> getBidsByAuctionNum(Integer auctionNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("getBidsByAuctionNum", auctionNum);
		}
	}

	public Map<String, Object> getTransactionByAuctionNum(Integer auctionNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("getTransactionByAuctionNum", auctionNum);
		}
	}
	
	public List<Map> getAllBuyerByAuctionNum(Integer auctionNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("getAllBuyerByAuctionNum", auctionNum);
		}
	}
}
