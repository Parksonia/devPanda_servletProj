package repository.blacklist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.BlackList;
import util.MybatisSqlSessionFactory;

public class BlacklistRepositoryImpl implements BlacklistRepository {
	private SqlSession sqlSession;
	public BlacklistRepositoryImpl() {
		this.sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public void insertBuyerPersonBlack(Map<String, Object> blistMap)
			throws Exception {		
		sqlSession.insert("mapper.blacklist.insertBuyerPersonBlack", blistMap);
		sqlSession.commit();
		
	}

	@Override
	public void insertBuyerComblack(Map<String, Object> blistMap) throws Exception {
		sqlSession.insert("mapper.blacklist.insertBuyerComBlack", blistMap);
		sqlSession.commit();
		
	}

	@Override
	public void insertSellerBlack(Map<String, Object> blistMap) throws Exception {
		sqlSession.insert("mapper.blacklist.insertSellerBlack", blistMap);
		sqlSession.commit();
		
	}

	@Override
	public List<Map> selectBlacklistById(Map<String, Object> blistMap) throws Exception {
		return sqlSession.selectList("mapper.blacklist.selectBlacklistById",blistMap);
	}

	@Override
	public int countBlacklistById(String id) throws Exception {
		return sqlSession.selectOne("mapper.blacklist.countBlacklistById", id);
	}

	@Override
	public void deleteBlacklistByNum(Integer blackNum) throws Exception {
		sqlSession.delete("mapper.blacklist.deleteBlacklistByNum", blackNum);
		sqlSession.commit();
		
	}

	@Override
	public List<Map> allBuyerPersonSellerBlackList(String id, int row) throws Exception {
		HashMap<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("row",row);
		
		return sqlSession.selectList("mapper.blacklist.selectAllSellerBlackOfPersonBuyer",param);
	}

	@Override
	public Integer buyerPersontSellerBlackListCnt(String id) throws Exception {
		return sqlSession.selectOne("mapper.blacklist.selectBuyerPersontSellerBlackListCnt",id);
	}

	@Override
	public Integer deleteSellerBlackForBuyerPerson(Integer blackNum) {
		int result = sqlSession.delete("mapper.blacklist.deleteSellerBlackForBuyerPerson",blackNum);
		sqlSession.commit();
		return result;
	}

	@Override

	public List<BlackList> selectBlackList() throws Exception {
		return sqlSession.selectList("mapper.blacklist.selectBlackList");
	}
	public boolean isAlreadyReported(HashMap<String,Object>param) throws Exception {
		
		Integer result = sqlSession.selectOne("mapper.blacklist.isAlreadyReportedBlackList",param);
		System.out.println("Query result: " + result);
		 return result != null && result > 0;

	}

	

}
