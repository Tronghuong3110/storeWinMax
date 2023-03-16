package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.entity.ProductEntity;

public class ProductConverter {
	
//	@Autowired
//	private static ModelMapper modelMapper;
	
	public static ProductDto toDTO(ProductEntity productEntity) {
		ProductDto product = new ProductDto();
		product.setImg(productEntity.getType().getImg());
		product.setLo_ren(productEntity.getType().getLo_Ren());
		product.setName_product(productEntity.getName_product());
		product.setPrice(productEntity.getPrice());
		product.setProduct_id(productEntity.getId());
		product.setShape(productEntity.getType().getName());
		product.setSize(productEntity.getSize());
		product.setCategory_id(productEntity.getCategoryEntity().getId());
		return product;
	}
	
//	public static ProductDto convertToDto(ProductEntity productEntity) {
//		ProductDto product = modelMapper.map(productEntity, ProductDto.class);
//	    return product;
//	}
}
