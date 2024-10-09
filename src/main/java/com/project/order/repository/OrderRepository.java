package com.project.order.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.order.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, Integer> {
   
   List<OrderEntity> findByOrderNumber(String orderNumber);

   // orderNumber로부터 BasketEntity의 ID를 찾는 메서드
    @Query("SELECT o.basketId FROM OrderEntity o WHERE o.orderNumber = :orderNumber")
    List<Integer> findBasketIdsByOrderNumber(@Param("orderNumber") String orderNumber);
   
}