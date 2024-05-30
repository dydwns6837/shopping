package com.project.cloth;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.cloth.bo.ClothBO;
import com.project.cloth.entity.ClothEntity;

@RestController
public class ClothRestController {
	
	@Autowired
	private ClothBO clothBO;
	
	// 신규 상품 등록
	@PostMapping("/admin/add-cloth")
	public Map<String, String> addCloth(
			@RequestParam("clothName") String clothName
			, @RequestParam("clothPrice") int clothPrice
			, @RequestParam("clothCategory") String clothCategory
			, @RequestParam("clothImagePath") String clothImagePath
			, @RequestParam("clothInfo") String clothInfo
			, @RequestParam("countXS") int countXS
			, @RequestParam("countS") int countS
			, @RequestParam("countM") int countM
			, @RequestParam("countL") int countL
			, @RequestParam("countXL") int countXL
			
			){
		
		ClothEntity cloth = clothBO.addNewCloth(
											clothName
											, clothPrice
											, clothCategory
											, clothImagePath
											, clothInfo
											,countXS
											,countS
											,countM
											,countL
											,countXL);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(cloth!=null) {
			resultMap.put("result","success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
