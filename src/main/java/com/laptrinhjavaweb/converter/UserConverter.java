package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.UserDto;
import com.laptrinhjavaweb.entity.UserEntity;

@Component
public class UserConverter {
	
	public static UserDto toDto(UserEntity entity) {
		UserDto user = new UserDto();
		user.setEmail(entity.getEmail());
		user.setId(entity.getId());
		user.setFullName(entity.getFullName());
		user.setPassWord(entity.getPassWord());
		user.setUserName(entity.getUserName());
		user.setStatus(entity.getStatus());
		return user;
	}
	
	public static UserEntity toEntity(UserDto dto) {
		UserEntity user = new UserEntity();
		user.setEmail(dto.getEmail());
		user.setFullName(dto.getFullName());
		user.setUserName(dto.getUserName());
		user.setStatus(dto.getStatus());
		return user;
	}
}
