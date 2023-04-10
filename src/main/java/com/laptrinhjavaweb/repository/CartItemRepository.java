package com.laptrinhjavaweb.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.CartItem;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long>{
	CartItem findByCartIdAndProductIdAndStatus(Long cart_Id, Long product_Id, int status);
	List<CartItem> findAllByCart_IdAndStatus(Long cartId, Integer status);
	List<CartItem> findByProductId(Long productId);
	List<CartItem> findAllByCart_Id(Long cartId);
	List<CartItem> findAllByOrder_Id(Long billId);
	@Query(value = "select bill_id from cartItem where status = 1 and cart_id = ?1 group by(bill_id)", nativeQuery = true)
	List<BigDecimal> getListBillIdByStatusAndCartId(Long cartId);
}
