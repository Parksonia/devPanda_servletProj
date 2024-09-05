package repository.transaction;

import java.util.List;

import dto.Transaction;

public interface personBuyTransactionRepository {
	
	List<Transaction> selectTransactionList(Integer row) throws Exception;
	Integer selectTransactionCount() throws Exception;
	
}
