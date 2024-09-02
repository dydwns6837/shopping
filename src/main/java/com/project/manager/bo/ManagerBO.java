package com.project.manager.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.basket.entity.BasketEntity;
import com.project.basket.repository.BasketRepository;
import com.project.manager.entity.ManagerEntity;
import com.project.manager.entity.Order;
import com.project.manager.repository.ManagerRepository;
import com.project.user.entity.UserEntity;
import com.project.user.repository.UserRepository;

@Service
public class ManagerBO {
	
	@Autowired
	private BasketRepository basketRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ManagerRepository managerRepository;
	
	//매니저 회원가입
	public ManagerEntity addManager(String loginId
								, String password
								, String name) {
		ManagerEntity manager = ManagerEntity.builder()
									.loginId(loginId)
									.password(password)
									.managerName(name)
									.build();
		
		return managerRepository.save(manager);
	}
	
	// 로그인 기능
		public ManagerEntity getManager(String loginId, String loginPw) {
			return managerRepository.findByLoginIdAndPassword(loginId, loginPw);
		}
	
	// 아이디 중복 확인
	public boolean isDuplicateId(String loginId) {
		int count = managerRepository.countByLoginId(loginId);
		
		if(count != 0) { // 아이디 중복 아님
			return true;
		} else {
			return false;
		}
	}
	
	// 주문 목록 가져오기
	public List<Order> getOrderList(){
		
		List<BasketEntity> basketList = basketRepository.findAll();
		List<Order> orderList = new ArrayList<>();
		
		for(BasketEntity basket : basketList) {
			
			int userId = basket.getUserId();
			
			Optional<UserEntity> optionalUser = userRepository.findById(userId);
			UserEntity user = optionalUser.orElse(null);
			
			Order order =  Order.builder()
									.id(basket.getId())
									.userName(user.getName())
									.clothSize(basket.getClothSize())
									.clothName(basket.getClothName())
									.clothCount(basket.getClothCount())
									.userAddress(user.getAddress())
									.clothStatus(basket.getClothStatus())
									.build();
			orderList.add(order);
			
		}
		return orderList;
	}
	
	
	// 배송중 상태로 변경
	public BasketEntity updateStatusOnDeliver(int id) {
		Optional<BasketEntity> optionalBasket = basketRepository.findById(id);
		BasketEntity basket = optionalBasket.orElse(null);
		
		
		if(basket != null) {
			basket = basket.toBuilder()
						.clothStatus("배송중")
						.build();
			basket = basketRepository.save(basket);
		}
		return basket;
	}
	
	// 배송완료 상태로 변경
	public BasketEntity updateStatusDelivered(int id) {
		Optional<BasketEntity> optionalBasket = basketRepository.findById(id);
		BasketEntity basket = optionalBasket.orElse(null);
		
		if(basket != null) {
			basket = basket.toBuilder()
						.clothStatus("배송 완료")
						.build();
			basket = basketRepository.save(basket);
		}
		return basket;
	}
	
}
