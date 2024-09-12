package service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;

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
		String[] pairs = jsonData.split("&");
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
	}

}
