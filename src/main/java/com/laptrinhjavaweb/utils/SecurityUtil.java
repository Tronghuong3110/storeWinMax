package com.laptrinhjavaweb.utils;

import java.util.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.laptrinhjavaweb.dto.MyUser;

public class SecurityUtil {
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities() {
		List<String> result = new ArrayList<>();
		
		List<GrantedAuthority> authorties = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
		for(GrantedAuthority authorty : authorties) {
			result.add(authorty.getAuthority()); // get chuỗi code role bên CustomUserDetailsService đã lưu vào security
		}
		return result;
	}
	
	public static MyUser getInfor()  {
		MyUser user = (MyUser)(SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
		return user;
	}
}
