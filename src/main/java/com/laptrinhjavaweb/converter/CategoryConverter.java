package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.CategoryDto;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.service.impl.CategoryService;

public class CategoryConverter {

	public static CategoryDto toDto(CategoryEntity entity) {
		CategoryDto dto = new CategoryDto();
		dto.setId(entity.getId());
		dto.setCode(entity.getCode());
		dto.setName(entity.getName());
		return dto;
	}
}
