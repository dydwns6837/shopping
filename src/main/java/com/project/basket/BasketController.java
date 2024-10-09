package com.project.basket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.basket.bo.BasketBO;
import com.project.basket.bo.BasketDetail;

import jakarta.servlet.http.HttpSession;

@Controller
public class BasketController {

   @Autowired
   private BasketBO basketBO;

   @GetMapping("/user/basket")
   public String basketView() {
      return "user/userCart";
   }

   // 장바구니 목록 보여주기
   @GetMapping("/basket/list-view")
   public String basketList(HttpSession session, Model model) {
      // 로그인한 사용자 PK 받아서 장바구니 조회
      Integer userId = (Integer) session.getAttribute("userId");

      // 로그인 안 되어 있으면 로그인 페이지로 리다이렉트
      if (userId == null) {
         return "redirect:/user/sign-in-view";
      }

      List<BasketDetail> basketList = basketBO.getBasketList(userId);
      model.addAttribute("basketList", basketList);

      return "user/userCart";
   }
}