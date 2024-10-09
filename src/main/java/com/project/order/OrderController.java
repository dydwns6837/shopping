package com.project.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.basket.bo.BasketDetail;
import com.project.order.bo.OrderBO;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

   @Autowired
   private OrderBO orderBO;

   @GetMapping("/order")
   public String orderPage(@RequestParam(value = "ids", required = false) List<Integer> ids, HttpSession session,
         Model model) {
      // 파라미터 값을 모델에 추가
       model.addAttribute("ids", ids);
       
      // 세션에서 사용자 정보 가져오기
      String userName = (String) session.getAttribute("userName");
      String userPhone = (String) session.getAttribute("userPhone");
      String userEmail = (String) session.getAttribute("userEmail");
      String userAddress = (String) session.getAttribute("userAddress");

      // 모델에 사용자 정보 추가
      model.addAttribute("userName", userName);
      model.addAttribute("userPhone", userPhone);
      model.addAttribute("userEmail", userEmail);
      model.addAttribute("userAddress", userAddress);

      List<BasketDetail> orderList = new ArrayList<>();

      if (ids != null) {
           orderList = orderBO.getOrderList(ids);
       }

      // 모델에 주문 목록 추가
       model.addAttribute("orderList", orderList);

      return "user/orderPage";
   }

}