package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.entity.ProductEntity;

public class ProductConverter {
	
	public static ProductDto toDTO(ProductEntity entity) {
		ProductDto product = new ProductDto();
		product.setId(entity.getId());
		product.setName(entity.getName_product());
		product.setPrice(entity.getPrice());
		product.setSize(entity.getSize());
		product.setType(TypeConverter.toDto(entity.getType()));
		product.setCategory(CategoryConverter.toDto(entity.getCategoryEntity()));
		return product;
	}
	
	public static ProductEntity toEntity(ProductDto dto) {
		ProductEntity entity = new ProductEntity();
		entity.setName_product(dto.getName());
		entity.setPrice(dto.getPrice());
		entity.setSize(dto.getSize());
		return entity;
	}
	
	public static ProductEntity updateEntity(ProductEntity entity, ProductDto dto) {
		entity.setName_product(dto.getName());
		entity.setSize(dto.getSize());
		entity.setPrice(dto.getPrice());
		return entity;
	}
	
}
