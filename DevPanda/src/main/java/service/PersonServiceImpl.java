package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Person;
import repository.person.PersonRepository;
import repository.person.PersonRepositoryImpl;

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
	public Person selectPersonInfo(String id) throws Exception { //거래 상세보기에서 id로 person정보 조회
		return personRepository.selectOneId(id);
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
	
	
	//personInfo수정
	@Override
	public void modifyPersonInfo(HttpServletRequest request) throws Exception {

	    HttpSession session = request.getSession();
	    Person sessionPerson = (Person) session.getAttribute("person");
	    
	    if (sessionPerson == null) {
	        throw new Exception("로그인된 사용자를 찾을 수 없습니다.");
	    }

	    String id = sessionPerson.getId();

		//String id ="abc001";
		String path = request.getServletContext().getRealPath("upload");

		int size = 10 * 1024 * 1024; // 크기지정 10MB

		MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());

		Person person = new Person();
		  // db에 존재하는 파일 명 찾아서 업데이트( 파일이 존재한다면  수정 )
		  if(multi.getFile("personImage")!=null) {
			  person.setPersonImage(multi.getFilesystemName("personImage"));
		  }
		  person.setPassword(multi.getParameter("password"));
		  person.setNickName(multi.getParameter("nickName"));
		  person.setAddress(multi.getParameter("address"));

		  personRepository.updatePersonInfo(person,id);
	}
	
	//personAccount inactive 업데이트
	@Override
	public boolean inactivePersonAccount(String id) throws Exception {
		
		Integer result = personRepository.updatePersonStatus(id);
		if(result>0) {
			return true;
		}
		return false;
	}
	

	
	
	
	
	
	
	
	
	


}
