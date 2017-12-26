package com.augmentum.oes.dao;

import com.augmentum.oes.model.User;

public interface UserDao {
    public abstract User login(String userName);
}
