package com.laptrinhjavaweb.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends RuntimeException {

    private String resourceName;
    private String fieldName;
    private String fieldName2;
    private Long fieldValueLong;
    private String fieldValueStr1;
    private String fieldValueStr2;
    

    public ResourceNotFoundException(String resourceName, String fieldName, Long fieldValueLong) {
        super(String.format("%s not found with %s: %s", resourceName, fieldName, fieldValueLong));
        this.resourceName = resourceName;
        this.fieldName = fieldName;
        this.fieldValueLong = fieldValueLong;
    }

	public ResourceNotFoundException(String resourceName, String fieldName, String fieldValueStr) {
        super(String.format("%s not found with %s: %s", resourceName, fieldName, fieldValueStr));
        this.resourceName = resourceName;
        this.fieldName = fieldName;
        this.fieldValueStr1 = fieldValueStr;
    }
	
	public ResourceNotFoundException(String resourceName, String fieldName, String fieldName2, String fieldValueStr1, String fieldValueStr2) {
        super(String.format("%s not found with %s: %s & %s: %s", resourceName, fieldName, fieldValueStr1, fieldValueStr2));
        this.resourceName = resourceName;
        this.fieldName = fieldName;
        this.fieldName2 = fieldName2;
        this.fieldValueStr1 = fieldValueStr1;
        this.fieldValueStr2 = fieldValueStr2;
    }

    public Long getFieldValueLong() {
		return fieldValueLong;
	}
    public String getResourceName() {
        return resourceName;
    }

    public String getFieldName() {
        return fieldName;
    }

	public String getFieldName2() {
		return fieldName2;
	}

	public String getFieldValueStr2() {
		return fieldValueStr2;
	}

	public String getFieldValueStr1() {
		return fieldValueStr1;
	}

}