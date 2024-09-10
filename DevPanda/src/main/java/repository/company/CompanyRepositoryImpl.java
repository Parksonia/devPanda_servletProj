package repository.company;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Company;
import util.MybatisSqlSessionFactory;

public class CompanyRepositoryImpl implements CompanyRepository {
	
	private SqlSession sqlSession;

	private final SqlSessionFactory sqlSessionFactory;

	public CompanyRepositoryImpl() {
		this.sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	}

	private SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}

	@Override
	public void insertCompany(Company company) {
		try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
			session.insert("mapper.CompanyMapper.insertCompany", company);
			session.commit();
		}
	}

	@Override
	public boolean isIdExists(String id) {
		try (SqlSession session = getSqlSession()) {
			Integer count = session.selectOne("mapper.CompanyMapper.isIdExists", id);
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
			String statement = "mapper.Company.findPasswordByIdAndEmail";
			password = sqlSession.selectOne(statement, parameterMap);

		} finally {

		}
		return password;
	}

	@Override
	public List<Company> findCompanyListByEmail(String email) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = getSqlSession();
		List<Company> list = null;
		try {
			String statement = "mapper.PersonMapper.findCompanyListByEmail";
			list = sqlSession.selectList(statement, email);

		} finally {

		}
		return list;
	}

	

	// companyId로 회사 정보를 가져오는 메서드
	public Company findByCompanyId(String companyId) {
		return sqlSession.selectOne("mapper.company.selectCompanyById", companyId);
	}
}
