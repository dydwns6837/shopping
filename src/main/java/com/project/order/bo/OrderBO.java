package com.project.order.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.basket.bo.BasketDetail;
import com.project.basket.entity.BasketEntity;
import com.project.basket.repository.BasketRepository;
import com.project.cloth.entity.ClothEntity;
import com.project.cloth.repository.ClothRepository;
import com.project.order.entity.OrderEntity;
import com.project.order.repository.OrderRepository;

@Service
public class OrderBO {

   @Autowired
   private OrderRepository orderRepository;
   
   @Autowired
   private BasketRepository basketRepository;
   
   @Autowired
   private ClothRepository clothRepository;
   
   // 장바구니 ID 로 주문할 목록 조회
   public List<BasketDetail> getOrderList(List<Integer> ids) {
      List<BasketDetail> orderDetailList = new ArrayList<>();

      for (int basketId : ids) {
         // 장바구니 아이템 조회
         BasketEntity order = basketRepository.findById(basketId).orElse(null);

         if (order != null) {
            ClothEntity cloth = clothRepository.findByClothName(order.getClothName());

            BasketDetail orderDetail = BasketDetail.builder().clothName(order.getClothName())
                  .clothSize(order.getClothSize()).clothPrice(cloth.getClothPrice())
                  .clothCount(order.getClothCount()).build();

            orderDetailList.add(orderDetail);
         }
      }

      return orderDetailList;
   }   
   
   // 주문번호 생성 메소드
   public String generateOrderNumber() {
      return "ORD-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
   }

   public List<OrderEntity> createOrderInfo(
         List<Integer> ids, int userId, String buyerName, String recipientName,
         String recipientPhone, String recipientAddress, String paymentMethod) {
      
      List<OrderEntity> orderInfoList = new ArrayList<>();
        
      String orderNumber = generateOrderNumber();
      
       for (int basketId : ids) {
           // OrderEntity 객체를 빌더 패턴을 사용해 생성
           OrderEntity order = OrderEntity.builder()
               .userId(userId)
               .basketId(basketId)
               .orderNumber(orderNumber) // 주문 번호 생성 메소드 (별도로 정의 필요)
               .buyerName(buyerName)
               .recipientName(recipientName)
               .recipientPhone(recipientPhone)
               .recipientAddress(recipientAddress)
               .paymentMethod(paymentMethod)
               .build();

           // 각각의 주문 정보를 저장하고 리스트에 추가
           orderInfoList.add(orderRepository.save(order));
       }

       return orderInfoList;
   }
}