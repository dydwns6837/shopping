package com.project.basket.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.basket.entity.BasketEntity;
import com.project.basket.repository.BasketRepository;
import com.project.cloth.entity.ClothEntity;
import com.project.cloth.repository.ClothRepository;

@Service
public class BasketBO {
	@Autowired 
	private BasketRepository basketRepository;
	
	@Autowired
	private ClothRepository clothRepository;
	
	// 장바구니 담는 기능
	public BasketEntity addCart(int userId, String clothName, String clothSize, int clothCount) {
		
		Optional<BasketEntity> optionalBasket = basketRepository.findByUserIdAndClothNameAndClothSizeAndClothStatus(userId, clothName, clothSize, "장바구니");
		BasketEntity basket = optionalBasket.orElse(null);
		
		if(basket != null) {
			basket = basket.toBuilder()
					.clothCount(clothCount + basket.getClothCount())
					.build();
		return basketRepository.save(basket);
		
		} else {
		
			basket = BasketEntity.builder()
							.userId(userId)
							.clothName(clothName)
							.clothSize(clothSize)
							.clothCount(clothCount)
							.clothStatus("장바구니")
							.build();
		return basketRepository.save(basket);
		}
	}
	
	// 사용자별 장바구니 조회 기능
	public List<BasketDetail> getBasketList(int userId){
		
		List<BasketEntity> basketList = basketRepository.findByUserIdOrderByIdDesc(userId);
		
		List<BasketDetail> basketDetailList = new ArrayList<>();
		
		for(BasketEntity basket:basketList) {
			
			ClothEntity cloth = clothRepository.findByClothName(basket.getClothName());
			
			BasketDetail basketDetail = BasketDetail.builder()
										.id(basket.getId())
										.clothName(cloth.getClothName())
										.clothSize(basket.getClothSize())
										.clothStatus(basket.getClothStatus())
										.clothCount(basket.getClothCount())
										.clothPrice(cloth.getClothPrice())
										.build();
			
			basketDetailList.add(basketDetail);
		}
		return basketDetailList;
	}

	// 주문목록 삭제
	public BasketEntity deleteBasket(int id) {
		
		Optional<BasketEntity> optionalBasket = basketRepository.findById(id);
		BasketEntity basket = optionalBasket.orElse(null);
		
		if(basket != null) {
			basketRepository.delete(basket);
		}
		return basket;
	}
	
	// 주문대기 > 주문완료 & 접수대기
	public BasketEntity updateStatus(int id) {
		
		Optional<BasketEntity> optionalBasket = basketRepository.findById(id);
		BasketEntity basket = optionalBasket.orElse(null);
		
		if(basket != null) {
			basket = basket.toBuilder()
					.clothStatus("주문 완료")
					.build();
					
			basket = basketRepository.save(basket);
		}
		return basket;
	}
	
	// 여러 항목 주문 완료 상태로 
	public List<BasketEntity> updateMultipleStatus(List<Integer> ids) {
		
		List<BasketEntity> updatedBaskets = new ArrayList<>();
		
		for(Integer basketId : ids) {
			Optional<BasketEntity> optionalBasket = basketRepository.findById(basketId);
			BasketEntity basket = optionalBasket.orElse(null);
			
			if(basket != null) {
				basket= basket.toBuilder()
						.clothStatus("주문 완료")
						.build();
				
				BasketEntity updatedBasket =  basketRepository.save(basket);
				updatedBaskets.add(updatedBasket);
				
			}
		}
		return updatedBaskets;
	}
	
	
	
}

