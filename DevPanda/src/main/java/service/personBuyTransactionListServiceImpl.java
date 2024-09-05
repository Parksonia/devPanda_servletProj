package service;

import java.util.List;

import dto.Transaction;
import repository.transaction.personBuyTransactionRepository;
import repository.transaction.personBuyTransactionRepositoryImpl;
import util.PageInfo;

public class personBuyTransactionListServiceImpl implements personBuyTransactionListService {
	
	private personBuyTransactionRepository trRepo;
	
	public personBuyTransactionListServiceImpl() {
		this.trRepo = new personBuyTransactionRepositoryImpl();
	}

	@Override
	public List<Transaction> transactionList(PageInfo page) throws Exception {
		Integer transactionCnt = trRepo.selectTransactionCount();
		
		Integer allPage = (int)Math.ceil((double)transactionCnt/8);
		Integer startPage = (page.getCurPage() -1)/10*10+1;
		Integer endPage = startPage+10 -1;
		if (endPage > allPage) endPage = allPage;
		
		page.setAllPage(allPage);
		page.setStartPage(startPage);
		page.setEndPage(endPage);
		
		Integer row = (page.getCurPage()-1)*10;
		System.out.println("row: "+ row);
		
		List<Transaction> transacionList = trRepo.selectTransactionList(row);
		System.out.println("리스트 사이즈 : " + transacionList.size());
		
		/* return trRepo.selectTransactionList(row); */
		return transacionList;
	}

}
