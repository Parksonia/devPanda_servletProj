package repository.emailcertification;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.EmailCertification;
import util.MybatisSqlSessionFactory;

public class EmailCertificationRepositoryImpl implements EmailCertificationRepository{
	
	
	
	
	

	
	
	@Override
	public int insertEmailCertification(EmailCertification emailCertification) {
		
		
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		int result=0;
		
		try {
			String statement = "mapper.emailCertification.insertEmailCertification";
			result = sqlSession.insert(statement,emailCertification);
			if(result>0) {
				
				sqlSession.commit();
			}
		
		
		}finally {
			sqlSession.close();
			
		}	
		
		return result;
	}


	@Override
	public String findCertificationByIdAndEmail(Map<String, String> parameterMap) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		String password = null;
		
		try {
			String statement = "mapper.emailCertification.findCertificationByIdAndEmailRecent";
			password = sqlSession.selectOne(statement, parameterMap);
			
			
		}finally {
			
		}
		
		
		return password;
	}
	
	
	@Override
	public String findCertificationByEmail(String email) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		String password = null;
		
		try {
			String statement = "mapper.emailCertification.findCertificationByEmailRecent";
			password = sqlSession.selectOne(statement, email);
			
			
		}finally {
			
		}
		
		
		return password;
	}

	
	
	//테스트용 메인함수(db에 쿼리 잘 날라가는지 확인)
	public static void main(String[] args) {
		
		
		//insertEmailCertification Test
//		EmailCertification emailCertification = new EmailCertification();
//		emailCertification.setId("ab1111111122");
//		emailCertification.setEmail("abc11@gmail.com");
//		emailCertification.setCertification("1154");	
//		EmailCertificationRepositoryImpl emailCertificationRepositoryImpl = new EmailCertificationRepositoryImpl();
//		int result = emailCertificationRepositoryImpl.insertEmailCertification(emailCertification);
//		System.out.println(result);
		
		EmailCertificationRepositoryImpl emailCertificationRepositoryImpl = new EmailCertificationRepositoryImpl();
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", "ab1111111122");
		param.put("email", "abc11@gmail.com");
		String num = emailCertificationRepositoryImpl.findCertificationByEmail("abc11@gmail.com");
		String num1 = emailCertificationRepositoryImpl.findCertificationByIdAndEmail(param);
		
		System.out.println(num);
		System.out.println(num1);
		
		
	
		
		
		
	}



	



	

}
