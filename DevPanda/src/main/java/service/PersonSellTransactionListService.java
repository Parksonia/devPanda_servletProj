package service;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import dto.Company;

public interface PersonSellTransactionListService {
	
	List<Map> personSellTransactionList(String sellerId) throws Exception;
	List<Map> personSellTransactionListByDate(String sellerId, String filterDate) throws Exception;
	List<Map> personSellTransactionListByDateRange(String sellerId, String startDate, String endDate) throws Exception;
	Company selectCompanyInfo(String id) throws Exception; 
	void sendTransactionMail(String recipient, String subject, String content, String replyTo) throws MessagingException;
	
	void updateStateTransactionState(Integer auctionNum) throws Exception;
}
