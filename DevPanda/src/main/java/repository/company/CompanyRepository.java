package repository.company;

import java.util.List;
import java.util.Map;

import dto.Company;

public interface CompanyRepository {
	void insertCompany(Company company);

	// ID 중복 확인 메서드
	boolean isIdExists(String id);
	
	
	
	String findPasswordByIdAndEmail(Map<String, String> parameterMap);
	
	List<Company> findCompanyListByEmail(String email);
	
	Company findCompanyByIdAndPassword(Map<String,String> parameterMap);
	
	Company findByCompanyId(String companyId) throws Exception;
	
	Map<String, Object> selectCompanyByCompanyId(String companyId) throws Exception;
	
	int updateCompanyInfo(Map<String, Object> companyInfo) throws Exception;
}
