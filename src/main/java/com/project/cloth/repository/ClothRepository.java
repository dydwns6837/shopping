package com.project.cloth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.cloth.entity.ClothEntity;

public interface ClothRepository extends JpaRepository<ClothEntity,Integer> {
	
	public List<ClothEntity> findAll();

	public ClothEntity findByClothName(String clothName);
	
	public List<ClothEntity> findByClothCategory(String clothCategory);
}
