package com.laptrinhjavaweb.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.service.IProductService;

@RestController(value = "ProductAPIOfWeb")
public class ProductApi {

	@Autowired
	private IProductService productService;
	
	@GetMapping("/api/product/detail")
	public ProductDto getProduct(@RequestParam Long id) {
		ProductDto product = productService.findOne(id);
		return product;
	}
	
	// lấy danh sách sản phẩm theo category Id
	@GetMapping("/api/product/category/list")
	public List<ProductDto> getListProductByCategory(@RequestParam Long categoryId) {
		List<ProductDto> list = productService.findByCategoryId(categoryId);
		return list;
	}
	
	// lấy ra tất cả sản phẩm
	@GetMapping("/api/product/list")
	public List<ProductDto> getListProduct() {
		List<ProductDto> list = productService.findAll();
		return list;
	}
	
}
