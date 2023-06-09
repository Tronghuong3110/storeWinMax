package com.laptrinhjavaweb.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "CartControllerOfWeb")
public class CartController {

	@RequestMapping(value = "/gio-hang/danh-sach", method = RequestMethod.GET)
	public ModelAndView cartPage() {
		ModelAndView mav = new ModelAndView("/web/cart/cartProduct");
		return mav;
	}
	
	@RequestMapping(value = "/thanh-toan", method = RequestMethod.GET)
	public ModelAndView paymentPage() {
		ModelAndView mav = new ModelAndView("/web/cart/payment");
		return mav;
	}

	@RequestMapping(value = "/don-hang", method = RequestMethod.GET)
	public ModelAndView billPage() {
		ModelAndView mav = new ModelAndView("/web/cart/bill");
		return mav;
	}
}
