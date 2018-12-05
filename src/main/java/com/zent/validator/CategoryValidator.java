package com.zent.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.zent.entity.Category;

public class CategoryValidator implements Validator {

	public boolean supports(Class<?> clazz) {
		return Category.class.equals(clazz);
	}

	public void validate(Object target, Errors error) {
		Category cate = (Category) target;
		ValidationUtils.rejectIfEmpty(error, "name", "Empty");
		ValidationUtils.rejectIfEmpty(error, "description", "Empty");

	}

}
