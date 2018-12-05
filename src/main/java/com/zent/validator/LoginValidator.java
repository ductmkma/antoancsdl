package com.zent.validator;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.zent.entity.Category;
import com.zent.entity.User;

public class LoginValidator implements Validator {

	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	public void validate(Object target, Errors error) {
		User user = (User) target;
		ValidationUtils.rejectIfEmpty(error, "email", "Empty");
		ValidationUtils.rejectIfEmpty(error, "password", "Empty");
		if(user.getEmail()!="") {
			Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
		            Pattern.CASE_INSENSITIVE);
		      if (!(pattern.matcher(user.getEmail()).matches())) {
		    	  error.rejectValue("email", "user.email.invali");
	       }
		}
		
	}

}
