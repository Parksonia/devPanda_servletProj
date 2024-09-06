package repository.company;

import dto.Company;

public interface CompanyRepository {
	void insertCompany(Company company);

	// ID 중복 확인 메서드
	boolean isIdExists(String id);
}
