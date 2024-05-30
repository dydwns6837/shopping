package com.project.cloth.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloth.entity.ClothDetail;
import com.project.cloth.entity.ClothEntity;
import com.project.cloth.entity.SizeEntity;
import com.project.cloth.repository.ClothRepository;
import com.project.cloth.repository.SizeRepository;

@Service
public class ClothBO {
	@Autowired
	private ClothRepository clothRepository;
	
	@Autowired
	private SizeRepository sizeRepository;
	
	public ClothEntity addNewCloth(
			String clothName
			, int clothPrice
			, String clothCategory
			, String clothImagePath
			, String clothInfo
			, int countXS
			, int countS
			, int countM
			, int countL
			, int countXL
			) {
		
		ClothEntity cloth = ClothEntity.builder()
							.clothName(clothName)
							.clothPrice(clothPrice)
							.clothCategory(clothCategory)
							.clothImagePath(clothImagePath)
							.clothInfo(clothInfo)
							.build();
		clothRepository.save(cloth);
		
		if(countXS != 0) {
		SizeEntity size = SizeEntity.builder()
						.clothId(cloth.getId())
						.sizeType("XS")
						.sizeCount(countXS)
						.build();
		sizeRepository.save(size);
		}

		if(countS != 0) {
		SizeEntity size = SizeEntity.builder()
				.clothId(cloth.getId())
				.sizeType("S")
				.sizeCount(countS)
				.build();
		sizeRepository.save(size);
		}

		if(countM != 0) {
		SizeEntity size = SizeEntity.builder()
				.clothId(cloth.getId())
				.sizeType("M")
				.sizeCount(countM)
				.build();
		sizeRepository.save(size);
		}

		if(countL != 0) {
		SizeEntity size = SizeEntity.builder()
				.clothId(cloth.getId())
				.sizeType("L")
				.sizeCount(countL)
				.build();
		sizeRepository.save(size);
		}
		
		if(countXL != 0) {
		SizeEntity size = SizeEntity.builder()
				.clothId(cloth.getId())
				.sizeType("XL")
				.sizeCount(countXL)
				.build();
		sizeRepository.save(size);
		}
		return cloth;
	}
	
	// 옷 분류해서 보여주는
	public List<ClothDetail> getClassifiedClothes(String clothCategory){
		
		List<ClothEntity> clothList = clothRepository.findByClothCategory(clothCategory);
		
		List<ClothDetail> clothDetailList = new ArrayList<>();
		
		for(ClothEntity cloth:clothList) {
			ClothDetail clothDetail = ClothDetail.builder()
					.clothName(cloth.getClothName())
					.clothId(cloth.getId())
					.clothCategory(cloth.getClothCategory())
					.clothImageUrl(cloth.getClothImagePath())
					.clothPrice(cloth.getClothPrice())
					.build();
					
			clothDetailList.add(clothDetail);
		}
		
		return clothDetailList;
	}
	
	// 메인 페이지에 옷 보여주기
	public List<ClothDetail> getClothDetail(){
		
		List<ClothEntity> clothList = clothRepository.findAll();
		
		List<ClothDetail> clothDetailList = new ArrayList<>();
		
		for(ClothEntity cloth:clothList) {
			int clothId = cloth.getId(); // cloth의 primary key 가져오기

			ClothDetail clothDetail = ClothDetail.builder()
										.clothName(cloth.getClothName())
										.clothId(clothId)
										.clothCategory(cloth.getClothCategory())
										.clothImageUrl(cloth.getClothImagePath())
										.clothPrice(cloth.getClothPrice())
										.build();
										
			clothDetailList.add(clothDetail);
		}
		return clothDetailList;
	}
	
	// 옷 하나 클릭했을 때 상세정보 보여주기
	public ClothEntity getClothInfo(int id) {
		Optional<ClothEntity> optionalCloth = clothRepository.findById(id);
		
		ClothEntity cloth = optionalCloth.orElse(null);
		return cloth;
		
	}
}

