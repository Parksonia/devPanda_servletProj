package service;

import java.util.HashMap;
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
	public String searchPassword(String jsonData) {
		try {
			
			IdEmailJsonObject idEmailJsonObject = getMailSendJsonObject(jsonData);
			
			Map<String,String> parameterMap = new HashMap();
			parameterMap.put("id", idEmailJsonObject.getId());
			parameterMap.put("email", idEmailJsonObject.getEmail());
			
			String password = personRepository.findPasswordByIdAndEmail(parameterMap);
			return "password";
			
		}catch (Exception e) {
			return null;
			
		}
		
	}

	@Override
	public String searchid(String jsonData) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	public static IdEmailJsonObject getMailSendJsonObject(String jsonData) {
		return gson.fromJson(jsonData, IdEmailJsonObject.class);
	}
	
	
	
	


}
