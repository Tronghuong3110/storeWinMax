package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.CartEntity;

@Repository
public interface CartRepository extends JpaRepository<CartEntity, Long>{
//	List<CartEntity> findAllByProductsContaining(ProductEntity product);
	CartEntity findByUserId(Long userId);
}
