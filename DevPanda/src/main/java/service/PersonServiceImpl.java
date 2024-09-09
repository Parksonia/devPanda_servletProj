package service;

import dto.Person;
import repository.person.PersonRepository;
import repository.person.PersonRepositoryImpl;

public class PersonServiceImpl implements PersonService {

	private PersonRepository personRepository = new PersonRepositoryImpl();

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


}
