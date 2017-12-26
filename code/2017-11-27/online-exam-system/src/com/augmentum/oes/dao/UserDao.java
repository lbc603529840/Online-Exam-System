package com.augmentum.oes.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.augmentum.oes.model.User;

@Repository
public interface UserDao {
    /**
     * Find user by username for login
     * @param String userName
     * @return User
     */
    @Select("SELECT * FROM user WHERE username = #{username}")
    public abstract User login(String userName);
}
