package repository.emailcertification;

import java.util.Map;

import dto.EmailCertification;

public interface EmailCertificationRepository {
	
	//이메일인증번호 테이블 insert
	
	int insertEmailCertification(EmailCertification emailCertification);
	
	//아이디,이메일로 인증번호 조회
	
	String findCertificationByIdAndEmail(Map<String,String> parameterMap);
	
	
	

	
	
	//이메일로 인증번호 조회
	
	String findCertificationByEmail(String email);

}
