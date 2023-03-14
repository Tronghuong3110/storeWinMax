package com.laptrinhjavaweb.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.service.IProductService;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService productService;
	
	// Trang danh sách sản phẩm theo thể loại
	@RequestMapping(value = "/san-pham/{code}", method = RequestMethod.GET)
//	@ResponseBody
	public ModelAndView categoryPage(@PathVariable String code) {
		ModelAndView mav = new ModelAndView("/web/product/category");
		List<ProductDto> Products = productService.findByCategoryCode(code);
		mav.addObject("Products", Products);
		return mav;
	}
	
	// trang chi tiết sản phẩm
	@RequestMapping(value = "/chi-tiet-san-pham", method = RequestMethod.GET)
	public ModelAndView detailProductPage() {
		ModelAndView mav = new ModelAndView("/web/product/detail");
		return mav;
	}
	
	// trang danh sách tất cả sản phẩm
	@RequestMapping(value = "/danh-sach-san-pham", method = RequestMethod.GET)
	public ModelAndView listProductPage() {
		ModelAndView mav = new ModelAndView("/web/product/listProduct");
		return mav;
	}
	
	// test
	@RequestMapping(value = "/chi-tiet", method = RequestMethod.GET)
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView("/web/product/chi-tiet");
		return mav;
	}
}
