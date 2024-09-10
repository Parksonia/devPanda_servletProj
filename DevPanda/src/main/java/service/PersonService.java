package service;

import dto.IdEmailJsonObject;
import dto.Person;

public interface PersonService {
	void registerPerson(Person person);

	boolean isIdExists(String id);

	String searchPassword(String jsonData);
	
	
	
	String searchid(String jsonData);
	
	
	
	

	

	
	
}
