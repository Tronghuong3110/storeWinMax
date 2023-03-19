package com.laptrinhjavaweb.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CategoryDto;
import com.laptrinhjavaweb.dto.TypeDto;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.ITypeService;

@RestController(value = "apiOfAdminOfCategory")
public class API {

	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private ITypeService typeService;
	
	@GetMapping("/api/category")
	public List<CategoryDto> getCategory() {
		return categoryService.findAll();
	}
	
	@GetMapping("/api/type")
	public List<TypeDto> getType() {
		return typeService.findAll();
	}
}
