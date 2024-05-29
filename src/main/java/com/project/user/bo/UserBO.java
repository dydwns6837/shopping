package com.project.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.entity.UserEntity;
import com.project.user.repository.UserRepository;

@Service
public class UserBO {
	
	@Autowired
	private UserRepository userRepository;

	// input: loginId
	// output: UserEntity or null
	public UserEntity getUserEntityByLoginId(String loginId) {
		return userRepository.findByLoginId(loginId);
	}
	
	// input: 파라미터 6개
	// output: Integer(user pk)
	public Integer addUser(String loginId, String password, String name, String email, String address, String phoneNumber) {
		UserEntity user = userRepository.save(UserEntity.builder()
								.loginId(loginId)
								.password(password)
								.name(name)
								.email(email)
								.address(address)
								.phoneNumber(phoneNumber)
								.build());
		
		return user == null ? null : user.getId();
	}
	
	// input: loginId, password
	// output: UserEntity or null
	public UserEntity getUserEntityByLoginIdPassword(String loginId, String password) {
		return userRepository.findByLoginIdAndPassword(loginId, password);
	}
}