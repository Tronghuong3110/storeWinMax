package com.laptrinhjavaweb.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.UserDto;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.ResponseUtil;

@RestController
public class UserApi {

	@Autowired
	private IUserService userService;
	
	// nguoi dung tu tao tai khoan
	@PostMapping(value = "/api/user")
	public ResponseEntity<UserDto> createUser(@RequestBody UserDto user) {
		HttpHeaders header = new HttpHeaders();
		ResponseUtil<UserDto> response = userService.save(user);
		header.set("message", response.getApiException().getMessage());
		return new ResponseEntity<>(response.getModel(), header, response.getApiException().getStatus());
	}
	
	// admin tao tai khoan cho nguoi dung
	@PreAuthorize("hasRole('ADMIN')")
	@PostMapping(value = "/api/admim")
	public String createAdmin(@RequestBody UserDto user) {
		return "redirect:/admin-home";
	}
}
