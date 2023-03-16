package com.laptrinhjavaweb.utils;

import com.laptrinhjavaweb.exception.APIException;

public class ResponseUtil <T> {
	
	private APIException apiException;
	private T model;
	
	public ResponseUtil (T model, APIException apiException) {
		this.apiException = apiException;
		this.model = model;
	}

	public APIException getApiException() {
		return apiException;
	}

	public void setApiException(APIException apiException) {
		this.apiException = apiException;
	}

	public T getModel() {
		return model;
	}

	public void setModel(T model) {
		this.model = model;
	}
	
}
