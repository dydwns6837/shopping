package com.project.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.manager.bo.ManagerBO;
import com.project.manager.entity.Order;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ManagerController {

	@Autowired
	private ManagerBO managerBO;

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

		List<Order> orderList = managerBO.getOrderList();

		model.addAttribute("orderList", orderList);

		return "manager/orderList";

	}

}