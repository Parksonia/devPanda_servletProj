package repository.person;

import dto.Person;

public interface PersonRepository {
	void registerPerson(Person person);

	// ID 중복 확인 메서드
	boolean isIdExists(String id);
	
	
	
	
	
	 //Person findById(String id);
}
