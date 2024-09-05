package repository.transaction;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Transaction;
import util.MybatisSqlSessionFactory;

public class personBuyTransactionRepositoryImpl implements personBuyTransactionRepository {
	
	private SqlSession sqlSession;
	
	public personBuyTransactionRepositoryImpl() {
		this.sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public List<Transaction> selectTransactionList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.transaction.selectTransactionList", row);
	}

	@Override
	public Integer selectTransactionCount() throws Exception {
		return sqlSession.selectOne("mapper.transaction.selectTransactionCount");
	}
	
	

}
