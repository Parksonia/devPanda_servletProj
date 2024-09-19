package util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisSqlSessionFactory {

	private static SqlSessionFactory sqlSessionFactory;

	static {
		String resource = "resource/mybatis-config.xml";
		try (InputStream inputStream = Resources.getResourceAsStream(resource)) {
			if (inputStream == null) {
				throw new RuntimeException("Resource not found: " + resource);
			}
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			throw new RuntimeException("Error initializing SqlSessionFactory", e);
		}
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
	// SqlSession을 직접 열 수 있는 메서드 추가
		public static SqlSession getSession() {
			return sqlSessionFactory.openSession();
		}
}
