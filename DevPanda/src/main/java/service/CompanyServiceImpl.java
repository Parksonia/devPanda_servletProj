package service;

import dto.Company;
import repository.company.CompanyRepository;
import repository.company.CompanyRepositoryImpl;

public class CompanyServiceImpl implements CompanyService {
	
	private CompanyRepository companyRepository = new CompanyRepositoryImpl();

	@Override
	public void registerCompany(Company company) {
		// ID 중복 체크
		if (companyRepository.isIdExists(company.getId())) {
			throw new IllegalArgumentException("이미 존재하는 ID입니다.");
		}

		// 추가 비즈니스 로직을 여기에 구현할 수 있습니다.

		companyRepository.insertCompany(company);
	}

	@Override
	public boolean isIdExists(String id) {
		return companyRepository.isIdExists(id);
	}
}
