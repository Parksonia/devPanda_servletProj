package service;

import com.google.gson.Gson;

import dto.EmailCertification;
import dto.MailSendJsonObject;
import repository.emailcertification.EmailCertificationRepository;
import repository.emailcertification.EmailCertificationRepositoryImpl;
import util.MailUtil;

public class EmailSendService {

	
	
	private static EmailCertificationRepository emailCertificationRepository = new EmailCertificationRepositoryImpl();
	private static Gson gson = new Gson();
	
	
	public String logic(String jsonData) {
		
		try {
			
			MailSendJsonObject mailSendJsonObject = getMailSendJsonObject(jsonData);
			String certification = MailUtil.send(mailSendJsonObject.getEmail());
			
			EmailCertification emailCertification = new EmailCertification();
			emailCertification.setCertification(certification);
			emailCertification.setEmail(mailSendJsonObject.getEmail());
			emailCertification.setId(mailSendJsonObject.getId());
			
			emailCertificationRepository.insertEmailCertification(emailCertification);
			return "success";
			
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
			
		}
		
		
		
		
	}
	
	public static MailSendJsonObject getMailSendJsonObject(String jsonData) {
		return gson.fromJson(jsonData, MailSendJsonObject.class);
	}

}
