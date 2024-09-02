package com.project.manager;

import java.util.HashMap;
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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class ManagerRestController {
	
	@Autowired
	private ManagerBO managerBO;
	
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
	
	// 사용자 장바구니에 있는 제품들 상태 배송중 / 배송완료 로 바꿔주기
	@PutMapping("/change/status/onDeliver")
	public Map<String, String> updateStatusOndeliver(@RequestParam("id") int id){
		BasketEntity basket = managerBO.updateStatusOnDeliver(id);
		
		Map<String, String> resultMap = new HashMap<>();
		if(basket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	@PutMapping("/change/status/delivered")
	public Map<String, String> updateStatusDelivered(@RequestParam("id") int id){
		BasketEntity basket = managerBO.updateStatusDelivered(id);
		
		Map<String, String> resultMap = new HashMap<>();
		if(basket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
}