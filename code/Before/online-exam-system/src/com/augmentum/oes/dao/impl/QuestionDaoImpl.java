package com.augmentum.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.augmentum.oes.Constants;
import com.augmentum.oes.dao.QuestionDao;
import com.augmentum.oes.model.Question;

public class QuestionDaoImpl implements QuestionDao {
    JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void create(Question question) {
        String sql = Constants.INSERT_INTO_QUESTION;
        Object[] objects = {question.getQuestionName(), question.getOptionA(), question.getOptionB(), question.getOptionC(), question.getOptionD(), question.getCorrectOption(), question.getStatus(), question.getCreateBy(), question.getCreateTime(), question.getUpdateBy(), question.getUpdateTime()};
        jdbcTemplate.update(sql, objects);
    }

    @Override
    public void edit(Question question) {
        String sql = Constants.UPDATE_QUESTION;
        Object[] objects = {question.getQuestionName(), question.getOptionA(), question.getOptionB(), question.getOptionC(), question.getOptionD(), question.getCorrectOption(), question.getUpdateBy(), question.getUpdateTime(), question.getId()};
        jdbcTemplate.update(sql, objects);
    }

    @Override
    public void changeStatusById(String updateBy, String updateTime, int[] ids) {
        for (int counter = 0; counter < ids.length; counter++) {
            String sql = Constants.DELETE_FROM_QUESTION;
            Object[] objects = {updateBy, updateTime, ids[counter]};
            jdbcTemplate.update(sql, objects);
        }
    }

    @Override
    public List<Question> paginationFind(int recordRange, String orderBy, int pageCurrent, String search) {
        String sql = "SELECT * FROM question WHERE status = 1 AND question_name LIKE ? ORDER BY id ASC LIMIT ?, ?";

        if ("DESC".equals(orderBy)) {
            sql = "SELECT * FROM question WHERE status = 1 AND question_name LIKE ? ORDER BY id DESC LIMIT ?, ?";
        }

        Object[] objects = {"%" + search + "%", (pageCurrent - 1) * recordRange, recordRange};

        return jdbcTemplate.query(sql, objects, new RowMapper<Question>() {
            @Override
            public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
                Question question = new Question();
                question.setId(rs.getInt(Constants.ID_IN_QUESTION));
                question.setQuestionName(rs.getString(Constants.QUESTION_NAME_IN_QUESTION));
                question.setOptionA(rs.getString(Constants.OPTION_A_IN_QUESTION));
                question.setOptionB(rs.getString(Constants.OPTION_B_IN_QUESTION));
                question.setOptionC(rs.getString(Constants.OPTION_C_IN_QUESTION));
                question.setOptionD(rs.getString(Constants.OPTION_D_IN_QUESTION));
                question.setCorrectOption(rs.getString(Constants.CORRECT_OPTION_IN_QUESTION));
                return question;
            }
        });
    }

    @Override
    public int findQuestionCount(String search) {
        String sql = "SELECT count(*) FROM question WHERE status = 1 AND question_name LIKE '%" + search + "%'";
        return jdbcTemplate.queryForInt(sql);
    }

    @Override
    public int findLastQuestionId() {
        String sql = Constants.SELECT_LAST_FROM_QUESTION;

        return jdbcTemplate.queryForObject(sql, new RowMapper<Question>() {
            @Override
            public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
                Question question = new Question();
                question.setId(rs.getInt(Constants.ID_IN_QUESTION));
                question.setQuestionName(rs.getString(Constants.QUESTION_NAME_IN_QUESTION));
                question.setOptionA(rs.getString(Constants.OPTION_A_IN_QUESTION));
                question.setOptionB(rs.getString(Constants.OPTION_B_IN_QUESTION));
                question.setOptionC(rs.getString(Constants.OPTION_C_IN_QUESTION));
                question.setOptionD(rs.getString(Constants.OPTION_D_IN_QUESTION));
                question.setCorrectOption(rs.getString(Constants.CORRECT_OPTION_IN_QUESTION));
                question.setStatus(rs.getInt(Constants.STATUS_IN_QUESTION));
                question.setCreateBy(rs.getString(Constants.CREATE_BY_IN_QUESTION));
                question.setCreateTime((rs.getString(Constants.CREATE_TIME_IN_QUESTION)));
                question.setUpdateBy(rs.getString(Constants.UPDATE_BY_IN_QUESTION));
                question.setUpdateTime(rs.getString(Constants.UPDATE_TIME_IN_QUESTION));
                return question;
            }
        }).getId();
    }

    @Override
    public Question findQuestionById(int id) {
        String sql = Constants.SELECT_FROM_QUESTION;
        Object[] objects = {id};

        return jdbcTemplate.queryForObject(sql, objects, new RowMapper<Question>() {
            @Override
            public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
                Question question = new Question();
                question.setId(rs.getInt(Constants.ID_IN_QUESTION));
                question.setQuestionName(rs.getString(Constants.QUESTION_NAME_IN_QUESTION));
                question.setOptionA(rs.getString(Constants.OPTION_A_IN_QUESTION));
                question.setOptionB(rs.getString(Constants.OPTION_B_IN_QUESTION));
                question.setOptionC(rs.getString(Constants.OPTION_C_IN_QUESTION));
                question.setOptionD(rs.getString(Constants.OPTION_D_IN_QUESTION));
                question.setCorrectOption(rs.getString(Constants.CORRECT_OPTION_IN_QUESTION));
                question.setStatus(rs.getInt(Constants.STATUS_IN_QUESTION));
                question.setCreateBy(rs.getString(Constants.CREATE_BY_IN_QUESTION));
                question.setCreateTime((rs.getString(Constants.CREATE_TIME_IN_QUESTION)));
                question.setUpdateBy(rs.getString(Constants.UPDATE_BY_IN_QUESTION));
                question.setUpdateTime(rs.getString(Constants.UPDATE_TIME_IN_QUESTION));
                return question;
            }
        });
    }
}