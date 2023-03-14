package com.laptrinhjavaweb.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CategoryDto;
import com.laptrinhjavaweb.service.ICategoryService;

@RestController(value = "categoryApiOfWeb")
public class CategoryApi {

	@Autowired
	private ICategoryService categoryService;
	
	@GetMapping("/api/category/list")
	public List<CategoryDto> getListCatrgory() {
		return categoryService.findAll();
	}
}
