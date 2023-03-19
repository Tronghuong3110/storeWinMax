package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.TypeConverter;
import com.laptrinhjavaweb.dto.TypeDto;
import com.laptrinhjavaweb.entity.TypeEntity;
import com.laptrinhjavaweb.repository.TypeRepository;
import com.laptrinhjavaweb.service.ITypeService;

@Service
public class TypeService implements ITypeService{

	@Autowired
	private TypeRepository typeRepository;
	
	@Override
	public List<TypeDto> findAll() {
		List<TypeEntity> types = typeRepository.findAll();
		List<TypeDto> listResult = new ArrayList<>();
		for(TypeEntity entity : types) {
			listResult.add(TypeConverter.toDto(entity));
		}
		return listResult;
	}
	
}
