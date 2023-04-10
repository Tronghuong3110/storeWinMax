package com.laptrinhjavaweb.service.impl;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.CartItemConverter;
import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.dto.ResponseDto;
import com.laptrinhjavaweb.entity.CartEntity;
import com.laptrinhjavaweb.entity.CartItem;
import com.laptrinhjavaweb.entity.OrderEntity;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.exception.ResourceNotFoundException;
import com.laptrinhjavaweb.repository.BillRepository;
import com.laptrinhjavaweb.repository.CartItemRepository;
import com.laptrinhjavaweb.repository.CartRepository;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.ICartSrvice;

@Service
public class CartService implements ICartSrvice{
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CartItemRepository cartItemRepository;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private BillRepository billRepository;

	// add cartItem to cart
	@Override
	public CartItemDto addProduct(Long productId, Long quantity) {
		Long userId = getIdUser();
		// lay thong tin san pham muon them
		ProductEntity product = productRepository.findOne(productId);
		// lay ra user 
		UserEntity user = getUserByUserId(userId);
		
		// lay ra gio hang cua user 
		CartEntity cart = user.getCart();
		
		// TH user chua co gio hang
		if(cart == null) {
			cart = new CartEntity();
			cart.setUser(user);
			cart = cartRepository.save(cart);
		}
		// kiem tra xem cart item co chua product can them da co trong gio hang cua user chua
		CartItem cartItem = cartItemRepository.findByCartIdAndProductIdAndStatus(cart.getId(), product.getId(), 0);
		
		// truong hop chua co
		if(cartItem == null) {
			cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setCart(cart);
			cartItem.setStatus(0);
			cartItem.setQuantity(quantity);
			cartItem.setTotal((double)(product.getPrice() * quantity));
		}
		
		// TH cart item chua product da co trong gio hang cua user
		else {
			cartItem.setQuantity(quantity + cartItem.getQuantity());
			cartItem.setTotal(cartItem.getTotal() + quantity * product.getPrice());
		}
		
		cartItem = cartItemRepository.save(cartItem);
		
		return CartItemConverter.toDto(cartItem);
	}

	// get danh sach tra ve gio hang va hoa don
	@Override
	public List<ResponseDto<String, CartItemDto> > getListCartItemOfUser(Integer status) {
		List<ResponseDto<String, CartItemDto> > res = new ArrayList<>();
		Long userId = getIdUser();
//		Long userId = 4L;
		UserEntity user = getUserByUserId(userId);
		
		// lay cart cua user
		CartEntity cart = user.getCart();
		
		if(cart == null) {
			cart = new CartEntity();
			cart.setUser(user);
			cart = cartRepository.save(cart);
		}
		
		// lay ra danh sach cartItem theo cart va status
		List<CartItem> cartItems = cartItemRepository.findAllByCart_IdAndStatus(cart.getId(), status);
		
		if(status.equals(0)) {
			List<CartItemDto> resultList = new ArrayList<>();
			for(CartItem entity : cartItems) {
				resultList.add(CartItemConverter.toDto(entity));
			}
			res.add(new ResponseDto<String, CartItemDto>("GH", resultList));
		}
		else {
			
			List<Long> listBillId = getListBillId(cart.getId());
			for(Long id : listBillId) {
				String mess = null;
				OrderEntity bill = billRepository.findOne(id);
				List<CartItemDto> listCartItemDto = new ArrayList<>();
				
				// nhom tat ca cartItem co cung bill_id vao 1 list
				for(CartItem item : cartItems) {
					if(item.getOrder().getId().equals(id)) {
						listCartItemDto.add(CartItemConverter.toDto(item));
					}
				}
				mess = solve(bill);
				ResponseDto<String, CartItemDto> result = new ResponseDto<String, CartItemDto>(bill.getCode(), mess, bill.getUnpaid_amount(),listCartItemDto);
				result.setDate(bill.getDate());
				res.add(result);
			}
		}
		Collections.sort(res);
		return res;
	}
	
	private String solve(OrderEntity order) {
		
		double percent = order.getUnpaid_amount() / order.getTotal_payment();
		DecimalFormat df = new DecimalFormat("#.#");
		String mess = "";
		
		// TH thanh toan xong
		if(percent == 0) {
			mess = "Đã thanh toán";
		}
		
		// Th chua thanh toan 
		else if(percent == 1) {
			mess = "Chưa thanh toán";
		}
		
		// TH hop da dat coc
		else { 
			percent  *= 100;
			mess = "Đã thanh toán " + df.format(percent) + "%";
		}
		return mess;
	}
	
	private List<Long> getListBillId(Long cartId) {
		List<BigDecimal> list = cartItemRepository.getListBillIdByStatusAndCartId(cartId);
		List<Long> res = list.stream()
                	.map(BigDecimal::longValue)
                	.collect(Collectors.toList());
		return res;
	}
	
	private UserEntity getUserByUserId(Long userId) {
		return userRepository.findOneByIdAndStatus(userId, SystemConstant.ACTIVE_STATUS);
	}
	
	private Long getIdUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)auth.getPrincipal();
		return myUser.getId();
	}

	@Override
	public void deleteProductFromCart(Long id) {
		cartItemRepository.delete(id);
	}

	@Override
	public OrderEntity findOne(Long id) {
		OrderEntity res = billRepository.findOne(id);
		return res;
	}

	@Override
	public String getCode(Long id) {
		return "";
	}

	@Override
	public void update(Long id, Long quantity) {
		CartItem cartItem = cartItemRepository.findOne(id);
		if(cartItem == null) {
			throw new ResourceNotFoundException("cartItem", "id", id);
		}
		
		cartItem.setQuantity(quantity);
		cartItem.setTotal((double)quantity * cartItem.getProduct().getPrice());
		cartItemRepository.save(cartItem);
	}
}
