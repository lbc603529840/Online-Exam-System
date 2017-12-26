package com.augmentum.oes.service.impl;

import com.augmentum.oes.Constants;
import com.augmentum.oes.dao.UserDao;
import com.augmentum.oes.exception.ParameterException;
import com.augmentum.oes.exception.ServiceException;
import com.augmentum.oes.model.User;
import com.augmentum.oes.service.UserService;
import com.augmentum.oes.util.StringUtil;

public class UserServiceImpl implements UserService {
    UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User userLogin(String userName, String userPassword) throws ParameterException, ServiceException {
        ParameterException parameterException = new ParameterException();

        if (StringUtil.isEmpty(userName)) {
            parameterException.addToParameterErrorField(Constants.USERNAME_PARAMETER_ERROR, Constants.USERNAME_PARAMETER_ERROR_MESSAGE);
        }

        if (StringUtil.isEmpty(userPassword)) {
            parameterException.addToParameterErrorField(Constants.PASSWORD_PARAMETER_ERROR, Constants.PASSWORD_PARAMETER_ERROR_MESSAGE);
        }

        if (parameterException.hasParameterError()) {
            throw parameterException;
        }

        User user = userDao.login(userName);

        if (user == null) {
            throw new ServiceException(Constants.USERNAME_SERVICE_ERROR_MESSAGE);
        }

        if (!user.getPassword().equals(userPassword)) {
            throw new ServiceException(Constants.PASSWORD_SERVICE_ERROR_MESSAGE);
        }

        return user;
    }
}
