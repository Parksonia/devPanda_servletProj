package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Person;

public interface PersonService {
	void registerPerson(Person person);

	boolean isIdExists(String id);

	
	Person selectPersonInfo(String id) throws Exception;
	
	String findPasswordByIdAndEmail(String id,String email);
	
	
	List<Person> findPersonByEmail(String email);
	
	//personInfo수정
	void modifyPersonInfo(HttpServletRequest request) throws Exception;
	
	//personAccount inactive 업데이트
	boolean inactivePersonAccount(String id) throws Exception;
	
	
	

	

	
	
}
