package com.augmentum.oes.service;

import com.augmentum.oes.exception.ParameterException;
import com.augmentum.oes.exception.ServiceException;
import com.augmentum.oes.model.User;

public interface UserService {
    public abstract User userLogin(String userName, String userPassword) throws ParameterException, ServiceException;
}
