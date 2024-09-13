package service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Auction;
import dto.AuctionAndPerson;
import dto.Person;

import repository.auction.AuctionRepository;
import repository.auction.AuctionRepositoryImpl;

public class AuctionServiceImpl implements AuctionService {
	private AuctionRepository auctionRepository;

	public AuctionServiceImpl() {
		this.auctionRepository = new AuctionRepositoryImpl();
	}

	@Override
	public List<Map<String, Object>> getAllAuctionsWithPersonInfo(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		List<Map<String, Object>> resultList = new ArrayList<>();

		// 데이터 가져오기
		List<Map<String, Object>> auctionData = auctionRepository.getAuctionsWithPersonInfo(pageSize, offset);

		// 각 데이터 항목을 맵에 담아 리스트에 추가
		for (Map<String, Object> data : auctionData) {
			Map<String, Object> map = new HashMap<>();
			map.put("title", data.get("title"));
			map.put("minSalary", data.get("minSalary"));
			map.put("maxSalary", data.get("maxSalary"));
			map.put("personImage", data.get("personImage"));
			map.put("nickName", data.get("nickName"));
			resultList.add(map);
		}
		System.out.println("Fetched auction data: " + auctionData);

		return resultList;
	}
//	@Override
//    public List<Map<String, Object>> getAllAuctionsWithPersonInfo(int page, int pageSize) {
//        int offset = (page - 1) * pageSize;
//        List<Map<String, Object>> resultList = new ArrayList<>();
//
//        // 데이터 가져오기
//        List<Map<String, Object>> auctionData = auctionRepository.getAuctionsWithPersonInfo(pageSize, offset);
//
//        // 각 데이터 항목을 DTO에 담아 리스트에 추가
//        for (Map<String, Object> data : auctionData) {
//            Auction auction = new Auction();
//            Person person = new Person();
//
//            auction.setTitle((String) data.get("title"));
//            auction.setMinSalary((Integer) data.get("minSalary"));
//            auction.setMaxSalary((Integer) data.get("maxSalary"));
//
//            person.setPersonImage((String) data.get("personImage"));
//            person.setNickName((String) data.get("nickName"));
//
//            Map<String, Object> map = Map.of(
//                "auction", auction,
//                "person", person
//            );
//            
//            resultList.add(map);
//        }
//
//        System.out.println("Fetched auction data: " + resultList);
//
//        return resultList;
//    }


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
	public List<AuctionAndPerson> findAllAuctionWithOffset(Integer offset) {
		// TODO Auto-generated method stub
		return auctionRepository.findAllAuctionWithOffset(offset);
	}
}
