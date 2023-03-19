package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.ProductDto;

public interface IProductService {
	List<ProductDto> getData();
	List<ProductDto> findAllPageable(Pageable pageable);
	Integer count();
	ProductDto findOne(long id);
	List<ProductDto> findByCategoryCode(String code);
	List<ProductDto> findByCategoryId(Long id);
	List<ProductDto> findAll();
	void deleteProduct(Long productId);
	void updateOrCreateProduct(ProductDto product, Long categoryId, Long typeId);
}
