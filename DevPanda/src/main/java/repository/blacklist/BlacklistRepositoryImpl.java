package repository.blacklist;

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

}
