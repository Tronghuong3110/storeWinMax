package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.ProductConverter;
import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.service.IProductService;

@Service
public class ProductService implements IProductService{

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<ProductDto> getData() {
		List<ProductEntity> list = productRepository.getData();
		List<ProductDto> res = new ArrayList<>();
		for(ProductEntity product : list) {
			res.add(ProductConverter.toDTO(product));
		}
		return res;
	} 

	@Override
	public List<ProductDto> findByCategoryCode(String code) {
		List<ProductEntity> list = productRepository.findAllByCategoryCode(code);
//		List<ProductEntity> list = productRepository.findAll();
		List<ProductDto> res = new ArrayList<>();
		for(ProductEntity product : list) {
			res.add(ProductConverter.toDTO(product));
		}
		return res;
	}

	@Override
	public List<ProductDto> findAllPageable(Pageable pageable) {
		List<ProductEntity> list = productRepository.findAll(pageable).getContent();
		List<ProductDto> products = new ArrayList<>();
		for(ProductEntity product : list) {
			products.add(ProductConverter.toDTO(product));
		}
		return products;
	}

	@Override
	public Integer count() {
		return (int) productRepository.count();
	}

	@Override
	public ProductDto findOne(long id) {
		ProductEntity entity = productRepository.findOne(id);
		return  ProductConverter.toDTO(entity);
	}

	@Override
	public List<ProductDto> findByCategoryId(Long id) {
		List<ProductEntity> list = productRepository.findAllByCategoryId(id);
		List<ProductDto> res = new ArrayList<>();
		for(ProductEntity product : list) {
			res.add(ProductConverter.toDTO(product));
		}
		return res;
	}

	@Override
	public List<ProductDto> findAll() {
		List<ProductEntity> list = productRepository.findAll();
		List<ProductDto> res = new ArrayList<>();
		for(ProductEntity product : list) {
			res.add(ProductConverter.toDTO(product));
		}
		return res;
		
	}

}
