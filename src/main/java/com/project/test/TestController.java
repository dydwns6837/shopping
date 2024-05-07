package com.project.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	@ResponseBody
	@RequestMapping("/test1")
	public String helloWorld() {
		return "Hello world!";
	}

	@GetMapping("/test2")
	@ResponseBody
	public Map<String, Object> test2() {
		Map<String, Object> map = new HashMap<>();
		map.put("qwer", 111);
		map.put("aaa", 222);
		map.put("ccc", 223);
		return map;
	}

	@GetMapping("/test3")
	public String test3() {
		return "test/test3";
	}
}