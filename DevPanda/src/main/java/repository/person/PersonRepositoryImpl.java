package repository.person;

import dto.Person;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

public class PersonRepositoryImpl implements PersonRepository {

	private SqlSession getSqlSession() {
		return MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

	@Override
	public void registerPerson(Person person) {
		try (SqlSession session = getSqlSession()) {
			session.insert("mapper.PersonMapper.signUpPerson", person);
			session.commit();
		}
	}

	@Override
	public boolean isIdExists(String id) {
	    try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
	        int count = session.selectOne("mapper.PersonMapper.isIdExists", id);
	        return count > 0;
	    }
	}

}
