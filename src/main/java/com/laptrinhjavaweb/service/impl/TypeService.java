package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.TypeConverter;
import com.laptrinhjavaweb.dto.TypeDto;
import com.laptrinhjavaweb.entity.TypeEntity;
import com.laptrinhjavaweb.exception.APIException;
import com.laptrinhjavaweb.exception.ResourceNotFoundException;
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

	@Override
	public TypeDto save(TypeDto type) {
		TypeEntity entity = typeRepository.findOneByLoRenAndCode(type.getLoRen(), type.getCode());
//				.orElseThrow(() -> new ResourceNotFoundException("type", "lo ren", "code", type.getLoRen(), type.getCode()));
		if(entity != null) {
			throw new APIException(HttpStatus.BAD_REQUEST, "Type nay da ton tai");
		}
		entity = typeRepository.save(TypeConverter.toEntity(type));
		return TypeConverter.toDto(entity);
	}
	
}
