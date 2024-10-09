package com.project.order;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.order.bo.OrderBO;
import com.project.order.entity.OrderEntity;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;

@RestController
public class OrderRestController {
   private IamportClient iamportClient;

   @Autowired
   private OrderBO orderBO;

   @PostConstruct
   public void init() {
      this.iamportClient = new IamportClient("5713485110404087",
            "Ewa7KOl2xVsoQlkoyfthOb7dVElQTLhKQgV0oUMQCOPjeNkvHSoTBR1JIcpJ8UCYODOyNgtRKdp0dhWO");
   }

   @ResponseBody
   @PostMapping("/order/{imp_uid}")
   public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid)
         throws IamportResponseException, IOException {
      return iamportClient.paymentByImpUid(imp_uid);
   }

   @PostMapping("/order/orderCreate")
   public Map<String, String> orderCreate(@RequestParam("ids") List<Integer> ids,
         @RequestParam("buyerName") String buyerName, @RequestParam("recipientName") String recipientName,
         @RequestParam("recipientPhone") String recipientPhone,
         @RequestParam("recipientAddress") String recipientAddress,
         @RequestParam("paymentMethod") String paymentMethod, HttpSession session) {
      
      // userId는 세션에 저장되어있으므로 파라미터로 전달받지 않고 세션에 저장된 값 불러오기
      int userId = (Integer) session.getAttribute("userId");

      List<OrderEntity> order = orderBO.createOrderInfo(ids, userId, buyerName, recipientName, recipientPhone,
               recipientAddress, paymentMethod);

      Map<String, String> resultMap = new HashMap<>();

      if (order != null) {
         resultMap.put("result", "success");
      } else {
         resultMap.put("result", "fail");
      }

      return resultMap;
   }
}
