package com.project.basket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.basket.bo.BasketBO;
import com.project.basket.entity.BasketEntity;

import jakarta.servlet.http.HttpSession;

@RestController
public class BasketRestController {
	
	@Autowired
	private BasketBO basketBO;
	
	//사용자 장바구니에 담는 기능
	@GetMapping("/user/add-basket")
	public Map<String, String> addBasket(@RequestParam("clothName") String clothName
									, @RequestParam("clothSize") String clothSize
									, @RequestParam("clothCount") int clothCount
									, HttpSession session){
		
		// userId는 세션에 저장되어있으므로 파라미터로 전달받지 않고 세션에 저장된 값 불러오기
		int userId = (Integer)session.getAttribute("userId");
		
		BasketEntity basket = basketBO.addCart(userId, clothName, clothSize, clothCount);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(basket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 장바구니 목록 지우기
	@DeleteMapping("/basket/delete")
	public Map<String, String> deleteBasket(@RequestParam("id") int id){
		
		BasketEntity basket = basketBO.deleteBasket(id);
		
		Map<String, String> resultMap = new HashMap<>();
		if(basket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	// 주문하기
	@PutMapping("/basket/update")
	public Map<String, String> updateBasket(@RequestParam("id") int id) {
		BasketEntity basket = basketBO.updateStatus(id);
		
		Map<String, String> resultMap = new HashMap<>();
		if(basket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	
	// 체크박스로 한번에 주문 완료하기
	@PutMapping("/basket/updateMultiple")
	public Map<String, String> updateMultipleBasket(@RequestParam("ids[]") List<Integer> ids){
		
		List<BasketEntity> basket = basketBO.updateMultipleStatus(ids);
		
		Map<String, String> resultMap = new HashMap<>();
		if(basket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	
}
