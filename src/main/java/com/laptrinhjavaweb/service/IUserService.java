package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.entity.UserEntity;

public interface IUserService {
	List<ProductEntity> findAll();
}
