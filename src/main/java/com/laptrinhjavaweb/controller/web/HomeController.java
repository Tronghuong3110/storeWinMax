package com.laptrinhjavaweb.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CategoryDto;
import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.entity.SliderEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.IProductService;
import com.laptrinhjavaweb.service.ISliderService;
import com.laptrinhjavaweb.service.IUserService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private ISliderService sliderService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value = {"/trang-chu", "/"}, method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		List<SliderEntity> listSlider = sliderService.findAll();
		List<CategoryDto> listCategory = categoryService.findAll();
		List<ProductDto> listProduct = productService.getData();
		mav.addObject("sliders", listSlider);
		mav.addObject("categorys", listCategory);
		mav.addObject("Products", listProduct);
		return mav;
	}
//	
	
//	@RequestMapping(value = "/test", method = RequestMethod.POST)
//	public @ResponseBody List<ProductEntity> test() {
//		List<ProductEntity> listProduct = productService.findAll();
//		return listProduct;
//	}

}
