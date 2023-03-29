package com.laptrinhjavaweb.api.admin;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CategoryDto;
import com.laptrinhjavaweb.service.ICategoryService;

@RestController
public class CategoryApi {

	@Autowired
	private ICategoryService categoryService;
	
	@GetMapping("/api/admin/category")
	public List<CategoryDto> getCategory() {
		return categoryService.findAll();
	}
	
	@PostMapping("/api/admin/category")
	public CategoryDto createCategory(@RequestBody CategoryDto category) {
//		String code = Normalizer.normalize(category.getCode(), Normalizer.Form.NFKD);
//		byte[] b;
//		String code = null;
//		try {
//			b = category.getCode().getBytes("UTF-8");
//			code = new String(b, "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		System.out.print(code);
		CategoryDto res = categoryService.save(category);
		return res;
	}

}
