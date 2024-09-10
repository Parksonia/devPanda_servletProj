package service;

import java.util.List;

import dto.IdEmailJsonObject;
import dto.Person;

public interface PersonService {
	void registerPerson(Person person);

	boolean isIdExists(String id);

	
	
	
	String findPasswordByIdAndEmail(String id,String email);
	
	
	List<Person> findPersonByEmail(String email);
	
	
	
	

	

	
	
}
