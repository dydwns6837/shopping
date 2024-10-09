package com.project.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.basket.entity.BasketEntity;
import com.project.manager.bo.ManagerBO;
import com.project.manager.entity.ManagerEntity;
import com.project.order.entity.OrderEntity;
import com.project.order.repository.OrderRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class ManagerRestController {
   
   @Autowired
   private ManagerBO managerBO;
   
   @Autowired
   private OrderRepository orderRepository;
   
   // 매니저 회원가입
   @PostMapping("/admin/join")
   public Map<String, String> managerJoin(@RequestParam("loginId") String loginId
                                 , @RequestParam("password") String password
                                 , @RequestParam("managerName") String managerName){
      ManagerEntity manager = managerBO.addManager(loginId, password, managerName);
      
      Map<String, String> resultMap = new HashMap<>();
      
      if(manager != null) {
         resultMap.put("result", "success");
      } else {
         resultMap.put("result", "fail");
      }
      return resultMap;
      
   }
   
   // 로그인 기능
   @PostMapping("/admin/login")
   public Map<String, String> login(
                     @RequestParam("loginId") String loginId
                     , @RequestParam("loginPw") String loginPw
                     , HttpServletRequest request){
      
      ManagerEntity manager = managerBO.getManager(loginId, loginPw);

      Map<String, String> resultMap = new HashMap<>();
      
      if(manager != null) {
         HttpSession session = request.getSession();
         
         session.setAttribute("managerId", manager.getId());
         session.setAttribute("managerName", manager.getManagerName());
         
         resultMap.put("result",  "success");
      } else {
         resultMap.put("result", "fail");
      }
      return resultMap;   
   }

   // 매니저 아이디 중복확인
   @GetMapping("/admin/duplicate-id")
   public Map<String, Boolean> isDuplicateId(@RequestParam("loginId") String loginId){
      
      boolean isDuplicateId = managerBO.isDuplicateId(loginId);
      
      Map<String,Boolean> resultMap = new HashMap<>();
      
      resultMap.put("isDuplicateId",  isDuplicateId);
      
      return resultMap;
   }
   
   // 주문 배송 상태 변경
   @PutMapping("/change/status")
   public Map<String, String> updateStatus(@RequestParam("orderNumber") String orderNumber, @RequestParam("status") String status) {
       
       // OrderEntity에서 주어진 orderNumber로 주문을 찾기
       List<OrderEntity> orders = orderRepository.findByOrderNumber(orderNumber);
       
       boolean success = true; // 성공 여부를 기록할 변수

       // 각 주문의 basketId를 이용해 BasketEntity를 업데이트
       for (OrderEntity order : orders) {
           BasketEntity basket = managerBO.updateOrderStatus(order.getBasketId(), status);
           if (basket == null) {
               success = false; // 업데이트 실패 시 실패로 설정
           }
       }
       
       Map<String, String> resultMap = new HashMap<>();
       resultMap.put("result", success ? "success" : "fail");
       return resultMap;
   }
   
}