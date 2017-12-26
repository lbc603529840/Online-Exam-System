package com.augmentum.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.augmentum.oes.Constants;
import com.augmentum.oes.dao.UserDao;
import com.augmentum.oes.model.User;

public class UserDaoImpl implements UserDao {
    JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public User login(String userName) {
        String sql = Constants.SELECT_FROM_USER;
        Object[] objects = {userName};

        return jdbcTemplate.queryForObject(sql, objects, new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                User user = new User();
                user.setId(rs.getInt(Constants.ID_IN_USER));
                user.setUsername(rs.getString(Constants.USERNAME_IN_USER));
                user.setPassword(rs.getString(Constants.PASSWORD_IN_USER));
                return user;
            }
        });
    }
}
