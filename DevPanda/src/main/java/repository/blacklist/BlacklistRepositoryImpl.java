package repository.blacklist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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

}
