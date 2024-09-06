package service;

import dto.Company;

public interface CompanyService {
	void registerCompany(Company company);

	boolean isIdExists(String id);
}
