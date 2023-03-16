package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long>{
	UserEntity findOneByUserNameAndStatus(String userName, Integer status);
	UserEntity findOneByIdAndStatus(Long userId, Integer status);
	
	 Boolean existsByEmail(String email);
	 Boolean existsByUserName(String username);
}
