package com.project.basket.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.basket.entity.BasketEntity;

public interface BasketRepository extends JpaRepository <BasketEntity,Integer> {

	public List<BasketEntity> findByUserIdOrderByIdDesc(int userId);
		
	public Optional<BasketEntity> findByUserIdAndClothNameAndClothSizeAndClothStatus(int userId, String clothName, String clothSize, String clothStauts);
	
	public Optional<BasketEntity> findById(int id);
	
}