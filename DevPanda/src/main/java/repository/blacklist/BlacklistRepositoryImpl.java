package repository.blacklist;

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
	public void insertSellerBlack(Map<String, Object> blistMap) throws Exception {
		sqlSession.insert("mapper.blacklist.insertSellerBlack", blistMap);
		sqlSession.commit();		
	}

	@Override
	public List<Map> selectBlacklistById(Map<String, Object> blistMap) throws Exception {
		return sqlSession.selectList("mapper.blacklist.selectBlacklistById",blistMap);
	}

	@Override
	public void deleteBlacklistByNum(Integer blackNum) throws Exception {
		sqlSession.delete("mapper.blacklist.deleteBlacklistByNum", blackNum);
		sqlSession.commit();
		
	}

	@Override
	public int countBlacklistById(String id) throws Exception {
		return sqlSession.selectOne("mapper.blacklist.countBlacklistById", id);
	}

}
