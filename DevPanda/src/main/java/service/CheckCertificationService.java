package service;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import dto.EmailCertification;
import dto.IdEmailJsonObject;
import repository.emailcertification.EmailCertificationRepository;
import repository.emailcertification.EmailCertificationRepositoryImpl;
import util.MailUtil;

public class CheckCertificationService {
	
	
	private static EmailCertificationRepository emailCertificationRepository = new EmailCertificationRepositoryImpl();
	private static Gson gson = new Gson();
	
	
	public String logic(String jsonData) {
		
		
		
		
		try {
			
			IdEmailJsonObject idEmailJsonObject = getMailSendJsonObject(jsonData);
			
			String certification = null;
			
			if(idEmailJsonObject.getId() == null) {
				certification = emailCertificationRepository.findCertificationByEmail(idEmailJsonObject.getEmail());
				
			}else {
				Map<String, String> parameterMap = new HashMap<String, String>();
				parameterMap.put("id", idEmailJsonObject.getId());
				parameterMap.put("email", idEmailJsonObject.getEmail());
				certification = emailCertificationRepository.findCertificationByIdAndEmail(parameterMap);
			}
			
			
			return certification;
			
			
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}
		
		
		
		
	}
	
	public static IdEmailJsonObject getMailSendJsonObject(String jsonData) {
		return gson.fromJson(jsonData, IdEmailJsonObject.class);
	}

}
