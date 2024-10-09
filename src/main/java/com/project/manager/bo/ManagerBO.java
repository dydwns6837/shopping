package com.project.manager.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.basket.entity.BasketEntity;
import com.project.basket.repository.BasketRepository;
import com.project.manager.entity.ManagerEntity;
import com.project.manager.entity.Order;
import com.project.manager.repository.ManagerRepository;
import com.project.order.entity.OrderEntity;
import com.project.order.repository.OrderRepository;
import com.project.user.entity.UserEntity;
import com.project.user.repository.UserRepository;

@Service
public class ManagerBO {
   
   @Autowired
   private BasketRepository basketRepository;
   
   @Autowired
   private OrderRepository orderRepository;
   
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
   
   // 주문 리스트 만들기 
   public List<Map<String, Object>> getOrderList() {
       // 데이터베이스에서 모든 주문을 가져옴
       List<OrderEntity> orderEntities = orderRepository.findAll();

       // 인덱스를 부여할 변수 초기화
       int orderIndex = 1;

       // 주문번호로 그룹화
       Map<String, Map<String, Object>> groupedOrders = new LinkedHashMap<>();

       for (OrderEntity order : orderEntities) {
           Optional<UserEntity> optionalUser = userRepository.findById(order.getUserId());
           UserEntity user = optionalUser.orElse(null);

           Optional<BasketEntity> optionalBasket = basketRepository.findById(order.getBasketId());
           BasketEntity basket = optionalBasket.orElse(null);

           if (user != null && basket != null) {
               // 주문 상세 정보를 담을 map 생성
               Map<String, Object> orderMap = new HashMap<>();
               orderMap.put("orderNumber", order.getOrderNumber());
               orderMap.put("createdAt", order.getCreatedAt());
               orderMap.put("userLoginId", user.getLoginId());
               orderMap.put("recipientName", order.getRecipientName());
               orderMap.put("recipientPhone", order.getRecipientPhone());
               orderMap.put("recipientAddress", order.getRecipientAddress());
               orderMap.put("clothStatus", basket.getClothStatus());
               
               // 그룹화된 주문 목록에서 인덱스 부여
               if (!groupedOrders.containsKey(order.getOrderNumber())) {
                   orderMap.put("orderIndex", orderIndex++); // 인덱스 부여
                   groupedOrders.put(order.getOrderNumber(), orderMap);
               }
           }
       }

       // 인덱스를 기준으로 역순으로 정렬된 리스트 생성
       List<Map<String, Object>> formattedOrderList = new ArrayList<>(groupedOrders.values());
       formattedOrderList.sort((o1, o2) -> Integer.compare((Integer) o2.get("orderIndex"), (Integer) o1.get("orderIndex")));

       return formattedOrderList;
   }
   
   // 장바구니 ID 로 주문내역 조회
   public List<Order> getOrderDetail(List<Integer> ids) {
      List<Order> orderDetailList = new ArrayList<>();

      for (int basketId : ids) {
         // 장바구니 아이템 조회
         BasketEntity order = basketRepository.findById(basketId).orElse(null);

         if (order != null) {
            Order orderDetail = Order.builder().clothName(order.getClothName()).clothSize(order.getClothSize())
                  .clothCount(order.getClothCount()).build();

            orderDetailList.add(orderDetail);
         }
      }

      return orderDetailList;
   }
      
   // 주문 배송 상태 업데이트
   public BasketEntity updateOrderStatus(int id, String status) {
      Optional<BasketEntity> optionalBasket = basketRepository.findById(id);
      BasketEntity basket = optionalBasket.orElse(null);
      
      if(basket != null) {
         basket = basket.toBuilder()
                  .clothStatus(status)
                  .build();
         basket = basketRepository.save(basket);
      }
      return basket;
   }
   
}
