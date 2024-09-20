package repository.person;

import dto.Person;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	

	@Override
	public String findPasswordByIdAndEmail(Map<String, String> parameterMap) {
		SqlSession sqlSession = getSqlSession();
		String password = null;
		
		try {
			String statement = "mapper.PersonMapper.findPasswordByIdAndEmail";
			password = sqlSession.selectOne(statement, parameterMap);
			
			
		}finally {
			
		}
		return password;
	}
	
	@Override
	public List<Person> findPersonListByEmail(String email) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = getSqlSession();
		List<Person> list = null;
		try {
			String statement = "mapper.PersonMapper.findPersonListByEmail";
			list = sqlSession.selectList(statement, email);
			
			
		}finally {
			
		}
		return list;
	}
	
	@Override
	public Person findPersonByIdAndPassword(Map<String,String> parameterMap) {
		SqlSession sqlSession = getSqlSession();
		Person person = null;
		try {
			String statement = "mapper.PersonMapper.findPersonByIdAndPassword";
			person = sqlSession.selectOne(statement, parameterMap);
			
			
		}finally {
			
		}
		return person;
	}
	
	
	
	//테스트용 메인함수(db에 쿼리 잘 날라가는지 확인)
	public static void main(String[] args) {
		
//		findPasswordByIdAndEmail test!!
//		Map<String,String> parameterMap = new HashMap();
//		
//		parameterMap.put("id", "a");
//		parameterMap.put("email", "aaa@gmail.com");
//		
		PersonRepositoryImpl personRepositoryImpl = new PersonRepositoryImpl();
//		String password = personRepositoryImpl.findPasswordByIdAndEmail(parameterMap);
//		System.out.println(password);
		
		//findIdListByEmail test!
//		String email = "aaa@gma111il.com";
//		List<Person> list = personRepositoryImpl.findPersonListByEmail(email);
//		
//		
//		for(Person person : list) {
//			System.out.println(person);
//		}
		
		
		//findPersonByIdAndPassword
		Map<String,String> parameterMap1 = new HashMap();
		parameterMap1.put("id", "a");
		parameterMap1.put("password", "password");
		Person person = personRepositoryImpl.findPersonByIdAndPassword(parameterMap1);
		System.out.println(person);
		
	}
	
	
	@Override
	public Person selectOneId(String id) { // 거래 상세보기에서 Id로 조회하는 person정보
		SqlSession session = getSqlSession();
		return session.selectOne("mapper.PersonMapper.selectOnePerson", id);
	}

	//마이페이지 개인 정보 수정
	@Override
	public void updatePersonInfo(Person person,String id) throws Exception {
		SqlSession session = getSqlSession();
		HashMap<String,Object> param = new HashMap<>();
		try{
			param.put("person", person);
			param.put("id", id);
			int result = session.update("mapper.PersonMapper.updatePersonInfo", param);
			session.commit();
			if (result == 0) {
	            throw new Exception("업데이트된 행이 없습니다.");
	        }
	       
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
	}
	//마이페이지 개인 계정탈퇴
	@Override
	public Integer updatePersonStatus(String id) throws Exception {
		SqlSession session = getSqlSession();
		
		try{
			
			int result = session.update("mapper.PersonMapper.updatePersonStatus", id);
	        if (result == 0) {
	            throw new Exception("업데이트된 행이 없습니다.");
	        }
	        session.commit();
	        return result;
	        
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return 0;
	}
}
