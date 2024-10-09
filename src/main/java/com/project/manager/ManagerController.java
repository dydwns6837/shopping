package com.project.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.manager.bo.ManagerBO;
import com.project.manager.entity.Order;
import com.project.order.repository.OrderRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ManagerController {

   @Autowired
   private ManagerBO managerBO;
   
   @Autowired
   private OrderRepository orderRepository;
   
   // 매니저 회원가입
   @GetMapping("/admin/join")
   public String managerJoin() {
      return "manager/managerJoin";
   }

   @GetMapping("/admin/login")
   public String managerLogin() {
      return "manager/managerLogin";
   }
   
   @GetMapping("/admin-main-view")
   public String AdminMainPage(Model model) {
      model.addAttribute("viewName", "manager/main");
      
      return "template/mainLayout";
   }

   // 관리자 로그아웃
   @GetMapping("/admin/logout")
   public String logout(HttpServletRequest request) {
      // 세션에 저장된 관리자 정보 제거

      HttpSession session = request.getSession();

      session.removeAttribute("managerId");
      session.removeAttribute("managerName");

      return "redirect:/main-view";
   }

   // 매니저가 상품 추가
   @GetMapping("/admin/add-product")
   public String AddProduct() {
      return "manager/addProduct";
   }

   // 전체 주문 목록 보여주기
   @GetMapping("/admin/show/orderList")
   public String showOrderList(Model model) {
       // 전체 주문 목록을 가져옴
       List<Map<String, Object>> orderList = managerBO.getOrderList();

       // 주문번호 별로 주문 내역을 추가하기 위해 주문번호와 주문내역 맵 생성
       Map<String, List<Order>> orderDetailsMap = new HashMap<>();

       for (Map<String, Object> orderMap : orderList) {
           String orderNumber = (String) orderMap.get("orderNumber");
           List<Integer> basketIds = orderRepository.findBasketIdsByOrderNumber(orderNumber);
           
           List<Order> orderDetails = managerBO.getOrderDetail(basketIds);
           orderDetailsMap.put(orderNumber, orderDetails);
       }

       // 주문 내역을 문자열로 변환
       for (Map<String, Object> orderMap : orderList) {
           String orderNumber = (String) orderMap.get("orderNumber");
           List<Order> orderDetails = orderDetailsMap.get(orderNumber);
           
           StringBuilder orderDetailsString = new StringBuilder();
           if (orderDetails != null) {
            for (Order order : orderDetails) {
               orderDetailsString.append(String.format("%s (사이즈: %s, 수량: %s)<br/>",
                     order.getClothName(), order.getClothSize(), order.getClothCount()));
            }
           }
           
           orderMap.put("orderDetailsString", orderDetailsString.toString());
       }

       model.addAttribute("orderList", orderList);

       return "manager/orderList";
   }

}