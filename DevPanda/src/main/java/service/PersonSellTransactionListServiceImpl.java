package service;

import java.util.List;
import java.util.Map;

import repository.transaction.PersonSellTransactionListRepository;
import repository.transaction.PersonSellTransactionListRepositoryImpl;

public class PersonSellTransactionListServiceImpl implements PersonSellTransactionListService {
	private PersonSellTransactionListRepository psRepo;

	public PersonSellTransactionListServiceImpl() {
		this.psRepo = new PersonSellTransactionListRepositoryImpl();
	}

	@Override
	public List<Map> personSellTransactionList(String sellerId) throws Exception {
		List<Map> transactionList = psRepo.selectPSTransactionList(sellerId);
		return transactionList;
	}

	@Override
	public List<Map> personSellTransactionListByDate(String sellerId, String filterDate) throws Exception {
		List<Map> transactionList = psRepo.selectPSTransactionListByDate(sellerId, filterDate);
		return transactionList;
	}

	@Override
	public List<Map> personSellTransactionListByDateRange(String sellerId, String startDate, String endDate)
			throws Exception {
		List<Map> transactionList = psRepo.selectPSTransactionListByDateRange(sellerId, startDate, endDate);
		return transactionList;
	}

}
