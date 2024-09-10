package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import dto.EmailCertification;
import dto.IdEmailJsonObject;
import dto.Person;
import repository.person.PersonRepository;
import repository.person.PersonRepositoryImpl;
import util.MailUtil;

public class PersonServiceImpl implements PersonService {

	private PersonRepository personRepository = new PersonRepositoryImpl();
	private static Gson gson = new Gson();
	
	

	@Override
	public boolean isIdExists(String id) {
		return personRepository.isIdExists(id);
	}

	@Override
	public void registerPerson(Person person) {

		// ID 중복 체크
		if (personRepository.isIdExists(person.getId())) {
			throw new IllegalArgumentException("이미 존재하는 ID입니다.");
		}

		// 추가 비즈니스 로직을 여기에 구현할 수 있습니다.
		personRepository.registerPerson(person);
	}

	@Override
	public String findPasswordByIdAndEmail(String id, String email) {
		// TODO Auto-generated method stub
		
		Map<String,String> parameterMap = new HashMap<String, String>();
		parameterMap.put("id", id);
		parameterMap.put("email", email);
		String password = personRepository.findPasswordByIdAndEmail(parameterMap);
		
		
		return password;
	}

	@Override
	public List<Person> findPersonByEmail(String email) {
		// TODO Auto-generated method stub
		List<Person> personList = personRepository.findPersonListByEmail(email);
		return personList;
	}

	

	
	
	
	
	
	
	
	
	


}
