package com.laptrinhjavaweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.SliderEntity;
import com.laptrinhjavaweb.repository.SliderRepository;
import com.laptrinhjavaweb.service.ISliderService;

@Service
public class SliderService implements ISliderService{
	
	@Autowired
	private SliderRepository sliderRepository;

	@Override
	public List<SliderEntity> findAll() {
		return sliderRepository.findAll();
	}
	
}
