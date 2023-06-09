package com.laptrinhjavaweb.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class ConstantsUtil {

	public static final Pattern VALID_EMAIL = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", Pattern.CASE_INSENSITIVE);
	public static final Pattern VALID_NUMBER = Pattern.compile("\\d+", Pattern.CASE_INSENSITIVE);
	
	// kiem tra email co hop le khong
	public static boolean vadidate (String email) {
		Matcher matcher =  VALID_EMAIL.matcher(email);
		return matcher.find();
	}
	
	public static boolean isNumber(String number) {
		Matcher matcher = VALID_NUMBER.matcher(number);
		return matcher.find();
	}
}
