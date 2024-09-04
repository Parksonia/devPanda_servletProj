package util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisSqlSessionFactory {
	
	

	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		
		try {
			String resource = "resource/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			// SqlSessionFactory 완성 서버 실행하고 문제 없는지 확인해보기
			sqlSessionFactory = builder.build(inputStream);  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//생성된 SqlSessionFactory 사용 메서드
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
}
