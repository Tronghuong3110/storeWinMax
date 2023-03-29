package com.laptrinhjavaweb.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.TypeDto;
import com.laptrinhjavaweb.service.ITypeService;

@RestController(value = "apiOfAdminOfCategory")
public class TypeApi {

	@Autowired
	private ITypeService typeService;
	
	@GetMapping("/api/admin/type")
	public List<TypeDto> getType() {
		return typeService.findAll();
	}
	
	@PostMapping("/api/admin/type")
	public TypeDto createType(@RequestBody TypeDto type) {
		TypeDto res = typeService.save(type);
		return res;
	}
}
