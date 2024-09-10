package service;

import com.google.gson.Gson;

import dto.EmailCertification;
import dto.IdEmailJsonObject;
import repository.emailcertification.EmailCertificationRepository;
import repository.emailcertification.EmailCertificationRepositoryImpl;
import util.MailUtil;

public class EmailSendService {

	
	
	private static EmailCertificationRepository emailCertificationRepository = new EmailCertificationRepositoryImpl();
	private static Gson gson = new Gson();
	
	
	public String logic(String jsonData) {
		
		try {
			
			IdEmailJsonObject idEmailJsonObject = getMailSendJsonObject(jsonData);
			String certification = MailUtil.send(idEmailJsonObject.getEmail());
			
			EmailCertification emailCertification = new EmailCertification();
			emailCertification.setCertification(certification);
			emailCertification.setEmail(idEmailJsonObject.getEmail());
			emailCertification.setId(idEmailJsonObject.getId());
			
			emailCertificationRepository.insertEmailCertification(emailCertification);
			return "success";
			
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
			
		}
		
		
		
		
	}
	
	public static IdEmailJsonObject getMailSendJsonObject(String jsonData) {
		return gson.fromJson(jsonData, IdEmailJsonObject.class);
	}

}
