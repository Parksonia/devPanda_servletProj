package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dto.Company;
import repository.blacklist.BlacklistRepository;
import repository.blacklist.BlacklistRepositoryImpl;
import repository.transaction.PersonSellTransactionListRepository;
import repository.transaction.PersonSellTransactionListRepositoryImpl;

public class PersonSellTransactionListServiceImpl implements PersonSellTransactionListService {
	private PersonSellTransactionListRepository psRepo;

	public PersonSellTransactionListServiceImpl() {
		this.psRepo = new PersonSellTransactionListRepositoryImpl();
	}
 
	@Override
	public List<Map> personSellTransactionList(String sellerId, int limit, int offset) throws Exception {
		List<Map> transactionList = psRepo.selectPSTransactionList(sellerId, limit, offset);
		return transactionList;
	}

	@Override
	public List<Map> personSellTransactionListByDate(String sellerId, String filterDate, int limit, int offset) throws Exception {
		List<Map> transactionList = psRepo.selectPSTransactionListByDate(sellerId, filterDate, limit, offset);
		return transactionList;
	}

	@Override
	public List<Map> personSellTransactionListByDateRange(String sellerId, String startDate, String endDate, int limit, int offset)
			throws Exception {
		List<Map> transactionList = psRepo.selectPSTransactionListByDateRange(sellerId, startDate, endDate, limit, offset);
		return transactionList;
	}
	
	@Override
	public Company selectCompanyInfo(String id) throws Exception { //거래 상세보기에서 id로 company정보 조회
		Company company = psRepo.selectOneId(id);
		return company;
	}

	@Override
	public void updateStateTransactionState(Integer auctionNum) throws Exception {
		psRepo.updateStateTransactionState(auctionNum);
	}
	

	@Override
	//SMTP 설정을 통해 메일을 전송
	public void sendTransactionMail(String recipient, String subject, String content, String replyTo) throws MessagingException {
		
		if(recipient == null || recipient.isEmpty()) {
			throw new MessagingException("수신자 이메일 주소가 없습니다.");
		}
		
		Properties properties = new Properties();
	    properties.put("mail.smtp.host", "smtp.gmail.com"); 
	    properties.put("mail.smtp.port", "587");  //TLS 포트
	    properties.put("mail.smtp.auth", "true");
	    properties.put("mail.smtp.starttls.enable", "true"); // TLS 사용 활성화
	    properties.put("mail.smtp.ssl.trust", "smtp.gmail.com"); // SSL 신뢰 설정
	    properties.put("mail.smtp.ssl.protocols", "TLSv1.2"); // TLS 버전 지정
        
        final String username = "";
        final String password = "";
        
        // 세션 생성
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
    	// 메일 작성
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject(subject);
        message.setText(content);
        
        if (replyTo != null && !replyTo.isEmpty()) {
        	message.setReplyTo(new InternetAddress[] {new InternetAddress(replyTo)});
        }
        
        // 메일 전송
        Transport.send(message);
		
	}

	@Override
	public int countTransactionListBySellerId(String id) throws Exception {
		return psRepo.countTransactionListBySellerId(id);
	}

	//transaction detail에서 필요한 블랙리스트 신고여부를 위한 메서드
	@Override
	public boolean isAlreadyReportedBlack(String sellerId, Integer transactionNum, String userType, String roleType)
			throws Exception {
		System.out.println("Params: sellerId=" + sellerId + ", transactionNum=" + transactionNum + ", userType=" + userType + ", roleType=" + roleType);
		BlacklistRepository bkRepo = new BlacklistRepositoryImpl();
		HashMap<String,Object> param = new HashMap<>();
		param.put("declId", sellerId);
		param.put("transactionNum", transactionNum);
		param.put("userType", userType);
		param.put("roleType", roleType);
		boolean result = bkRepo.isAlreadyReported(param);  // true,false 반환
		
		return result;
	}

}
