package repository.person;

import dto.Person;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.MybatisSqlSessionFactory;

public class PersonRepositoryImpl implements PersonRepository {

	private final SqlSessionFactory sqlSessionFactory;

	public PersonRepositoryImpl() {
		this.sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	}

	private SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}

	@Override
	public void registerPerson(Person person) {
		try (SqlSession session = getSqlSession()) {
			session.insert("mapper.PersonMapper.signUpPerson", person);
			session.commit();
		}
	}

	@Override
	public boolean isIdExists(String id) {
		try (SqlSession session = getSqlSession()) {
			Integer count = session.selectOne("mapper.PersonMapper.isIdExists", id);
			return count != null && count > 0;
		} catch (Exception e) {
			e.printStackTrace(); // 에러 로그를 출력하여 디버깅
			return false; // 예외 발생 시 false 반환
		}
	}
	
	
//	@Override
//    public Person findById(String id) {
//        // 데이터베이스에서 Person 정보를 조회하는 로직
//        // SQL 쿼리 실행 및 결과를 Person 객체로 반환
//        // (예: MyBatis 또는 JDBC 사용)
//    }

}
