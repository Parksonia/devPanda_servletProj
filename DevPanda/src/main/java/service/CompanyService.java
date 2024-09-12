package service;

import java.util.List;

import dto.Company;

public interface CompanyService {
	void registerCompany(Company company);

	boolean isIdExists(String id);
	
	String findPasswordByIdAndEmail(String id,String email);
	
	
	List<Company> findCompanyByEmail(String email);
}
