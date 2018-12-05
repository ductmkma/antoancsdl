package com.zent.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.zent.entity.Posts;

public class PostsValidator implements Validator {

	public boolean supports(Class<?> clazz) {
		return Posts.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {
		Posts post = (Posts) target;
		
		ValidationUtils.rejectIfEmpty(errors, "title", "post.title.empty");
		ValidationUtils.rejectIfEmpty(errors, "description", "post.description.empty");
		ValidationUtils.rejectIfEmpty(errors, "content", "post.content.empty");
		ValidationUtils.rejectIfEmpty(errors, "tags", "post.tags.empty");
		if(post.getThumbnail().getSize()<=0) {
			errors.rejectValue("thumbnail", "post.thumbnail.empty");
		}
		
		
		
	}

}
