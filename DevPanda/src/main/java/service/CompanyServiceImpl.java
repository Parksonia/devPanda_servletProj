package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	@Override
	public String findPasswordByIdAndEmail(String id, String email) {
		// TODO Auto-generated method stub
		Map<String,String> parameterMap = new HashMap<String, String>();
		parameterMap.put("id", id);
		parameterMap.put("email", email);
		String password = companyRepository.findPasswordByIdAndEmail(parameterMap);
		
		
		return password;
	}

	@Override
	public List<Company> findCompanyByEmail(String email) {
		// TODO Auto-generated method stub
		List<Company> companyList = companyRepository.findCompanyListByEmail(email);
		return companyList;
	}
}
