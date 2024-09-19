package service;
import java.util.List;
import java.util.Map;

import repository.transaction.PersonBuyTransactionListRepository;
import repository.transaction.PersonBuyTransactionListRepositoryImpl;
import util.PageInfo;


public class PersonBuyTransactionListServiceImpl implements PersonBuyTransactionListService {

	private PersonBuyTransactionListRepository trRepo;

	public PersonBuyTransactionListServiceImpl() {
		this.trRepo = new PersonBuyTransactionListRepositoryImpl();
	}

	@Override
	public List<Map> personBuyTransactionList(String buyerId, int limit, int offset) throws Exception {
		List<Map> transacionList = trRepo.selectPBTransactionList(buyerId, limit, offset);
		return transacionList;
	}
	
	@Override
	public List<Map> personBuyTransactionListByDate(String buyerId, String filterDate, int limit, int offset) throws Exception {
		List<Map> transacionList = trRepo.selectPBTransactionListByDate(buyerId, filterDate, limit, offset);
		return transacionList;
	}
	
	@Override
	public List<Map> personBuyTransactionListByDateRange(String buyerId, String startDate, String endDate, int limit, int offset) throws Exception {
		List<Map> transacionList = trRepo.selectPBTransactionListByDateRange(buyerId, startDate, endDate, limit, offset);
		return transacionList;
	}

	@Override
	public int countTransactionListByBuyerId(String id) throws Exception {
		return trRepo.countTransactionListByBuyerId(id);
	}

	
}
