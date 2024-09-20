package service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import dto.Auction;
import dto.AuctionAndPerson;
import dto.BidAuctionTransactionDto;
import dto.MapperSearchCondition;
import dto.Person;
import dto.SearchCondition;
import repository.auction.AuctionRepository;
import repository.auction.AuctionRepositoryImpl;

public class AuctionServiceImpl implements AuctionService {
	private AuctionRepository auctionRepository;
	private static Gson gson = new Gson();

	public AuctionServiceImpl() {
		this.auctionRepository = new AuctionRepositoryImpl();
		
	}

	@Override
	public List<AuctionAndPerson> getFilteredAuctionsWithPersonInfo(int offset, int pageSize,
			String[] location, String[] stack, String[] Occupation, String[] period, String[] education, String[] Certification, String[] employmentType) {
	    System.out.println("Fetching auctions with offset: " + offset + ", pageSize: " + pageSize);
	    System.out.println("Test:"+auctionRepository.getFilteredAuctionsWithPersonInfo(offset, pageSize,
				location, stack, Occupation, period, education, Certification, employmentType));
	    return auctionRepository.getFilteredAuctionsWithPersonInfo(offset, pageSize,
				location, stack, Occupation, period, education, Certification, employmentType);
		
	}

	// 1개 조회 bid 전체 리스트에서 조회 될 수 있도록 함
	@Override
	public Auction oneAuction(Integer auctionNum) throws Exception {

		Auction auction = auctionRepository.selectOneAuction(auctionNum);
		// 끝에 있는 , 제거하여 다시 저장 하기 위함
		List<String> occupation = Arrays.asList(auction.getOccupation().split(","));
		List<String> period = Arrays.asList(auction.getPeriod().split(","));
		List<String> education = Arrays.asList(auction.getEducation().split(","));
		List<String> employmentType = Arrays.asList(auction.getEmploymentType().split(","));
		List<String> stack = Arrays.asList(auction.getStack().split(","));
		List<String> certification = Arrays.asList(auction.getCertification().split(","));
		List<String> location = Arrays.asList(auction.getLocation().split(","));

		String occupateStr = remakeWithComma(occupation);
		String periodStr = remakeWithComma(period);
		String educationStr = remakeWithComma(education);
		String employmentTypeStr = remakeWithComma(employmentType);
		String stackStr = remakeWithComma(stack);
		String certificationStr = remakeWithComma(certification);
		String locationStr = remakeWithComma(location);

		auction.setOccupation(occupateStr);
		auction.setPeriod(periodStr);
		auction.setEducation(educationStr);
		auction.setEmploymentType(employmentTypeStr);
		auction.setStack(stackStr);
		auction.setCertification(certificationStr);
		auction.setLocation(locationStr);

		return auction;
	}

	@Override
	public String remakeWithComma(List<String> items) throws Exception {
		StringBuilder result = new StringBuilder();

		for (int i = 0; i < items.size(); i++) {
			result.append(items.get(i));
			// 마지막 항목이 아니면 콤마 추가
			if (i < items.size() - 1) {
				result.append(" , ");
			}
		}

		return result.toString();
	}

	@Override
	public AuctionAndPerson findAuctionAndPersonById(Integer auctionNum) {
		// TODO Auto-generated method stub
		return auctionRepository.findAuctionAndPersonById(auctionNum);
	}

	@Override
	public List<AuctionAndPerson> findAllAuctionWithOffset(String data) {
		// TODO Auto-generated method stub
		SearchCondition searchCondition = getSearchCondition(data);
		System.out.println(searchCondition);
		System.out.println(MapperSearchCondition.extractMapperSearchCondition(searchCondition));
		return auctionRepository.findAllAuctionWithOffset(MapperSearchCondition.extractMapperSearchCondition(searchCondition));
	}
	
	
	
	public static SearchCondition getSearchCondition(String data) {

		if (!data.startsWith("{")) {
			String[] pairs = data.split("&");
			JSONObject json = new JSONObject();

			for (String pair : pairs) {
				// 각 쌍을 =로 분리
				String[] keyValue = pair.split("=");
				if (keyValue.length == 2) {
					String key = keyValue[0];
					String value = keyValue[1];
					// JSON 객체에 키와 값 추가
					json.put(key, value);
				}
			}

			return gson.fromJson(json.toString(), SearchCondition.class);
		} else {
			return gson.fromJson(data, SearchCondition.class);
		}

	}
}
