package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;

@Service // authentication
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity user = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
		
		if(user == null) {
			throw new UsernameNotFoundException("Tài khoản hoặc mật khẩu không đúng");
		}
		
		// Nếu user tồn tại, put thông tin vào security để duy trì thông tin user đăng nhập vào hệ thống
		List<GrantedAuthority> authorities = new ArrayList<>(); // chứa vai trò của user đang đăng nhập
		
		// add các vai trò của user vào authorities để lưu trữ
		for(RoleEntity role : user.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		
		// lưu trữ thông tin của user vào security
		MyUser myUser = new MyUser(user.getUserName(), user.getPassWord(), 
					true, true, true, true, authorities);
		
		myUser.setFullName(user.getFullName());
		myUser.setId(user.getId());
		return myUser;
	}

}
