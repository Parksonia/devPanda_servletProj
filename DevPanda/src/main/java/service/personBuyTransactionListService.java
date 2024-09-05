package service;

import java.util.List;

import dto.Transaction;
import util.PageInfo;

public interface personBuyTransactionListService {
	
	List<Transaction> transactionList(PageInfo page) throws Exception;

}
