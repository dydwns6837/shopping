package com.project.cloth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.cloth.bo.ClothBO;
import com.project.cloth.entity.ClothDetail;
import com.project.cloth.entity.ClothEntity;

@Controller
public class ClothController {

   @Autowired
   private ClothBO clothBO;

   @GetMapping("/main/productDetail")
   public String clothDetail(Model model) {
      model.addAttribute("viewName", "main/productDetail");
      return "template/mainLayout";
   }

   @GetMapping("/main/clothes/classify")
   public String clothClassify(@RequestParam("clothCategory") String clothCategory, Model model) {
      List<ClothDetail> clothList = clothBO.getClassifiedClothes(clothCategory);

      model.addAttribute("clothList", clothList);
      model.addAttribute("viewName", "main/clothClassify");
      return "template/mainLayout";
   }

   @GetMapping("/main/clothes-detail")
   public String clothesDetail(@RequestParam("id") int id, Model model) {
      ClothEntity cloth = clothBO.getClothInfo(id);

      model.addAttribute("clothInfo", cloth);
      model.addAttribute("viewName", "main/productDetail");
      return "template/mainLayout";

   }

}
