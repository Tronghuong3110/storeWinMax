package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.TypeDto;
import com.laptrinhjavaweb.entity.TypeEntity;

public class TypeConverter {

	public static TypeDto toDto(TypeEntity entity) {
		TypeDto dto = new TypeDto();
		dto.setId(entity.getId());
		dto.setCode(entity.getCode());
		dto.setLoRen(entity.getLoRen());
		dto.setShape(entity.getCode());
		dto.setImg(entity.getImg());
		return dto;
	}
	
	public static TypeEntity toEntity(TypeDto dto) {
		TypeEntity entity = new TypeEntity();
		entity.setCode(dto.getCode());
		entity.setLoRen(dto.getLoRen());
		entity.setShape(dto.getShape());
		entity.setImg(dto.getImg());
		return entity;
	}
}
