package service;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import dto.Company;

public interface PersonSellTransactionListService {
	
	List<Map> personSellTransactionList(String sellerId, int limit, int offset) throws Exception;
	List<Map> personSellTransactionListByDate(String sellerId, String filterDate, int limit, int offset) throws Exception;
	List<Map> personSellTransactionListByDateRange(String sellerId, String startDate, String endDate, int limit, int offset) throws Exception;
	Company selectCompanyInfo(String id) throws Exception; 
	void sendTransactionMail(String recipient, String subject, String content, String replyTo) throws MessagingException;
	void updateStateTransactionState(Integer auctionNum) throws Exception;
	int countTransactionListBySellerId(String id) throws Exception;
	
	//transaction detail에서 필요한 블랙리스트 신고여부를 위한 메서드
	boolean isAlreadyReportedBlack(String sellerId,Integer transactionNum,String userType,String roleType) throws Exception; 
}
