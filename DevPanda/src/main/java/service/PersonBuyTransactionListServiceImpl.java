package service;
import java.util.List;
import java.util.Map;

import repository.transaction.PersonBuyTransactionRepository;
import repository.transaction.PersonBuyTransactionRepositoryImpl;
import util.PageInfo;

public class PersonBuyTransactionListServiceImpl implements PersonBuyTransactionListService {

	private PersonBuyTransactionRepository trRepo;

	public PersonBuyTransactionListServiceImpl() {
		this.trRepo = new PersonBuyTransactionRepositoryImpl();
	}

	@Override
	public List<Map> personBuyTransactionList(String buyerId) throws Exception {
		//Integer transactionCnt = trRepo.selectTransactionCount();
		//calcuatePaging(page, transactionCnt);
		//Integer row = (page.getCurPage() - 1) * 10;
		List<Map> transacionList = trRepo.selectPBTransactionList(buyerId);

		return transacionList;
	}
	
	@Override
	public List<Map> personBuyTransactionListByDate(String buyerId, String filterDate) throws Exception {
		//Integer transactionCnt = trRepo.selectTransactionCount();
		//calcuatePaging(page, transactionCnt);
		//Integer row = (page.getCurPage() - 1) * 10;
		List<Map> transacionList = trRepo.selectPBTransactionListByDate(buyerId, filterDate);
		return transacionList;
	}
	
	@Override
	public List<Map> personBuyTransactionListByDateRange(String buyerId, String startDate, String endDate) throws Exception {
		//Integer transactionCnt = trRepo.selectTransactionCount();
		//calcuatePaging(page, transactionCnt);
		//Integer row = (page.getCurPage() - 1) * 10;
		List<Map> transacionList = trRepo.selectPBTransactionListByDateRange(buyerId, startDate, endDate);
		return transacionList;
	}

	@Override
	public void calcuatePaging(PageInfo page, Integer count) throws Exception {
		Integer allPage = (int) Math.ceil((double) trRepo.selectPBTransactionCount() / 10);
		Integer startPage = (page.getCurPage() - 1) / 10 * 10 + 1;
		Integer endPage = startPage + 10 - 1;
		if (endPage > allPage)
			endPage = allPage;

		page.setAllPage(allPage);
		page.setStartPage(startPage);
		page.setEndPage(endPage);

	}

	


}
