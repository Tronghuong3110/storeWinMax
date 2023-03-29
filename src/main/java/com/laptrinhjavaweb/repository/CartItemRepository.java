package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.CartItem;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long>{
	CartItem findByCartIdAndProductId(Long cart_Id, Long product_Id);
	List<CartItem> findAllByCart_Id(Long cartId);
	List<CartItem> findByProductId(Long productId);
	
	@Modifying
	@Query(value = "delete from cartItem where id = ?1", nativeQuery = true)
	void deleteCartItem(Long id);
}
