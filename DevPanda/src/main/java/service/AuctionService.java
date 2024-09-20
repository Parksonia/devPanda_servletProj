package service;

import dto.Auction;
import dto.AuctionAndPerson;
import dto.MapperSearchCondition;
import dto.Person;
import dto.SearchCondition;

import java.util.List;
import java.util.Map;

public interface AuctionService {
	List<AuctionAndPerson> getFilteredAuctionsWithPersonInfo(int offset, int pageSize, 
	String[] location, String[] stack, String[] Occupation, String[] period, String[] education, String[] Certification, String[] employmentType);
    
	
	Auction oneAuction(Integer auctionNum) throws Exception;

	String remakeWithComma(List<String> items) throws Exception;

	AuctionAndPerson findAuctionAndPersonById(Integer auctionNum);

	List<AuctionAndPerson> findAllAuctionWithOffset(String data);
}
