package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.UserDto;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.exception.APIException;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.ConstantsUtil;
import com.laptrinhjavaweb.utils.ResponseUtil;

@Service
public class UserService implements IUserService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder; 
	
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public ResponseUtil<UserDto> save(UserDto user) {
		// kiem tra user name da ton tai chua
		boolean checkUserName = userRepository.existsByUserName(user.getUserName());
		if(checkUserName) {
			return new ResponseUtil<UserDto>(null, new APIException(HttpStatus.BAD_REQUEST, "UserName is already"));
		}
		// kiem tra email da ton tai chua
		boolean checkEmailOfDB = userRepository.existsByEmail(user.getEmail());
		if(checkEmailOfDB) {
			return new ResponseUtil<UserDto>(null, new APIException(HttpStatus.BAD_REQUEST, "Email is alReady"));
		}
		
		// kiem tra email da dung dinh dang chua
		String email = user.getEmail();
		boolean checkEmailIsValid = ConstantsUtil.vadidate(email);
		if(!checkEmailIsValid) {
			return new ResponseUtil<UserDto>(null, new APIException(HttpStatus.BAD_REQUEST, "Email is INVALID"));
		}
		user.setStatus(1);
		UserEntity entity = UserConverter.toEntity(user);
		
		// ma hoa mat khau
		entity.setPassWord(passwordEncoder.encode(user.getPassWord()));
		
		List<RoleEntity> roles = new ArrayList<>();
		RoleEntity role = roleRepository.findByCode("USER");
		
		roles.add(role);
		entity.setRoles(roles);
		entity = userRepository.save(entity);
		return new ResponseUtil<UserDto>(UserConverter.toDto(entity), new APIException(HttpStatus.OK, "Resgister Success"));
	}

}
