package com.example.socialmedia;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;


public class BeanValidator {
    public static Validator getValidator() throws Exception {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        return factory.getValidator();
    }

    public static <T> Map<String, String> convertViolationsToMap(Set<ConstraintViolation<T>> violations) {
        Map<String, String> violationsMap = new HashMap<>();

        for (ConstraintViolation<T> violation : violations) {
            String propertyPath = violation.getPropertyPath().toString();
            String errorMessage = violation.getMessage();
            violationsMap.put(propertyPath, errorMessage);
        }

        return violationsMap;
    }

}
