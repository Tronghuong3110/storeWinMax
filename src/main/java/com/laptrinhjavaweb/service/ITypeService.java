package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.TypeDto;

public interface ITypeService {
	List<TypeDto> findAll();
	TypeDto save(TypeDto type);
}
