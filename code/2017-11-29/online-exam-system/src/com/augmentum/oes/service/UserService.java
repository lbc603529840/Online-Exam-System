package com.augmentum.oes.service;

import com.augmentum.oes.exception.ParameterException;
import com.augmentum.oes.exception.ServiceException;
import com.augmentum.oes.model.User;

public interface UserService {
    /**
     * Find user by username for login and judge whether the password can match the username
     * @param String userName, String userPassword
     * @return User
     */
    public abstract User login(String username, String password) throws ParameterException, ServiceException;
}
