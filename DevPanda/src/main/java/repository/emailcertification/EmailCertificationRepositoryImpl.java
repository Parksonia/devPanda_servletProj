package repository.emailcertification;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.EmailCertification;
import util.MybatisSqlSessionFactory;

public class EmailCertificationRepositoryImpl implements EmailCertificationRepository{
	
	
	private SqlSession getSqlSession() {
		return MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	
	
	@Override
	public int insertEmailCertification(EmailCertification emailCertification) {
		
		
		SqlSession sqlSession = getSqlSession();
		int result=0;
		
		try {
			String statement = "mapper.emailCertification.insertEmailCertification";
			result = sqlSession.insert(statement,emailCertification);
			if(result>0) sqlSession.commit();
		
		
		}finally {
			sqlSession.close();
			
		}	
		
		return result;
	}


	@Override
	public String findCertificationByEmail(Map<String, String> parameterMap) {
		SqlSession sqlSession = getSqlSession();
		String password = null;
		
		try {
			String statement = "mapper.emailCertification.findCertificationByEmailRecent";
			password = sqlSession.selectOne(statement, parameterMap);
			
			
		}finally {
			
		}
		
		
		return password;
	}

	
	
	//테스트용 메인함수(db에 쿼리 잘 날라가는지 확인)
	public static void main(String[] args) {
		
		
		//insertEmailCertification Test
		EmailCertification emailCertification = new EmailCertification();
		emailCertification.setId("ab11");
		emailCertification.setEmail("abc11@gmail.com");
		emailCertification.setCertification("1134");	
		EmailCertificationRepositoryImpl emailCertificationRepositoryImpl = new EmailCertificationRepositoryImpl();
		int result = emailCertificationRepositoryImpl.insertEmailCertification(emailCertification);
		System.out.println(result);
		
		
		
		//findCertificationByEmail Test
		Map<String,String> parameterMap = new HashMap<String, String>();
		parameterMap.put("id", "a");
		parameterMap.put("email", "aaa@gmail.com");
		String certification = emailCertificationRepositoryImpl.findCertificationByEmail(parameterMap);
		System.out.print(certification);
		
		
		
		
	}



	

}
