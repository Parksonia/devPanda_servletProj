package service;

import dto.Person;

public interface PersonService {
	void registerPerson(Person person);

	boolean isIdExists(String id);
	
	Person selectPersonInfo(String id) throws Exception;
	
}
