package service;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import dto.EmailCertification;
import dto.IdEmailJsonObject;
import repository.emailcertification.EmailCertificationRepository;
import repository.emailcertification.EmailCertificationRepositoryImpl;
import util.MailUtil;

public class EmailSendService {

	
	
	private static EmailCertificationRepository emailCertificationRepository = new EmailCertificationRepositoryImpl();
	private static Gson gson = new Gson();
	
	
	public String logic(String data) {
		
		try {
			
			IdEmailJsonObject idEmailJsonObject = getMailSendJsonObject(data);
			
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
	
	public static IdEmailJsonObject getMailSendJsonObject(String data) {
		
		if(!data.startsWith("{")) {
			String[] pairs = data.split("&");
			JSONObject json = new JSONObject();
			
			for (String pair : pairs) {
	            // 각 쌍을 =로 분리
	            String[] keyValue = pair.split("=");
	            if (keyValue.length == 2) {
	                String key = keyValue[0];
	                String value = keyValue[1];
	                // JSON 객체에 키와 값 추가
	                json.put(key, value);
	            }
	        }
			
			
			
			return gson.fromJson(json.toString(), IdEmailJsonObject.class);
		}else {
			return gson.fromJson(data, IdEmailJsonObject.class);
		}
		
	}

}
