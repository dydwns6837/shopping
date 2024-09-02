package com.project.manager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.manager.entity.ManagerEntity;

public interface ManagerRepository extends JpaRepository<ManagerEntity,Integer> {

	public int countByLoginId(String loginId);
	
	// 로그인 기능, 아이디 & 비밀번호 확인
	public ManagerEntity findByLoginIdAndPassword(String loginId, String password);
	
}
