package repository.person;

import java.util.List;
import java.util.Map;

import dto.Person;

public interface PersonRepository {
	void registerPerson(Person person);

	// ID 중복 확인 메서드
	boolean isIdExists(String id);
	
	
	String findPasswordByIdAndEmail(Map<String, String> parameterMap);
	
	List<Person> findPersonListByEmail(String email);
	
	Person findPersonByIdAndPassword(Map<String,String> parameterMap);
	
	Person selectOneId(String id) throws Exception;
	
	//마이페이지 개인 정보 수정
	void updatePersonInfo(Person person,String id) throws Exception;
	
	//마이페이지 개인 계정탈퇴
	Integer updatePersonStatus(String id) throws Exception;
	
}
