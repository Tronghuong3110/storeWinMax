package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.service.IProductService;

@RestController(value = "apiOfProductOfAdmin")
public class ProductApi {

	@Autowired
	private IProductService productService;
	
	@GetMapping("/api/admin/product/detail")
	public ProductDto getproductDetail(@RequestParam Long productId) {
		ProductDto productDto = productService.findOne(productId);
		return productDto;
	}
	
	@PutMapping("/api/admin/product/detail")
	public ResponseEntity<?> updateProduct(@RequestBody ProductDto product, @RequestParam Long categoryId, @RequestParam Long typeId) {
		productService.updateOrCreateProduct(product, categoryId, typeId);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@DeleteMapping("/api/admin/product/detail")
	public ResponseEntity<?> deleteProduct(@RequestParam Long productId) {
		productService.deleteProduct(productId);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
