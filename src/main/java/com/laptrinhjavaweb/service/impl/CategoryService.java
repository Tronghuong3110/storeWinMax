package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDto;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService{

	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<CategoryDto> findAll() {
		List<CategoryDto> resutlList = new ArrayList<>();
		List<CategoryEntity> list = categoryRepository.findAll();
		for(CategoryEntity item : list) {
			resutlList.add(CategoryConverter.toDto(item));
		}
		return resutlList;
	}
}
