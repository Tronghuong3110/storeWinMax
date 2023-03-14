package com.laptrinhjavaweb.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.paging.PageInfor;
import com.laptrinhjavaweb.service.IProductService;

@Controller(value = "ProductControllerOfAdmin")
public class ProductController {
	
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value = "/admin/product/list", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam int limit, @RequestParam int page) {
		ModelAndView mav = new ModelAndView("/admin/product/list");
		Pageable pageable = new PageRequest(page-1, limit);
		List<ProductDto> products = productService.findAllPageable(pageable);
		Integer totalItem = productService.count();
		PageInfor pageInfor = new PageInfor(limit, page, totalItem);
		mav.addObject("Products", products);
		mav.addObject("page", pageInfor);
		return mav;
	}
}
