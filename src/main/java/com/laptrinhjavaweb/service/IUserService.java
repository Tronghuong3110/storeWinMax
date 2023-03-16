package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.UserDto;
import com.laptrinhjavaweb.utils.ResponseUtil;

public interface IUserService {
	ResponseUtil<UserDto> save(UserDto user);
}
