package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CategoryDto;
import com.laptrinhjavaweb.entity.CategoryEntity;

@Component
public class CategoryConverter {

	public static CategoryDto toDto(CategoryEntity entity) {
		CategoryDto dto = new CategoryDto();
		dto.setId(entity.getId());
		dto.setCode(entity.getCode());
		dto.setName(entity.getName());
		return dto;
	}
	
	public static CategoryEntity toEntity(CategoryDto dto) {
		CategoryEntity entity = new CategoryEntity();
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
	
		return entity;
	}
}
