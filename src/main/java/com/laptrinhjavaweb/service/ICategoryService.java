package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CategoryDto;

public interface ICategoryService {
	List<CategoryDto> findAll();
}
