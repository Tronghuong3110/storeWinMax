package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.SliderDto;
import com.laptrinhjavaweb.entity.SliderEntity;

@Component
public class SliderConverter {
	
	public static SliderDto toDto(SliderEntity entity) {
		SliderDto dto = new SliderDto();
		dto.setId(entity.getId());
		dto.setImg(entity.getImg());
		return dto;
	}
}
