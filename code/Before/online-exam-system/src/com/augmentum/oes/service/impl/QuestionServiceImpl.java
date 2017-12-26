package com.augmentum.oes.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.augmentum.oes.dao.QuestionDao;
import com.augmentum.oes.model.Question;
import com.augmentum.oes.service.QuestionService;

public class QuestionServiceImpl implements QuestionService {
    QuestionDao questionDao;

    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    @Override
    public int questionCreate(Question question) {
        questionDao.create(question);
        return question.getId();
    }

    @Override
    public int questionEdit(Question question) {
        questionDao.edit(question);
        return question.getId();
    }

    @Override
    public List<Question> paginationFind(int recordRange, String orderBy, int pageCurrent, String search) {
        List<Question> questionList = new ArrayList<Question>();
        questionList = questionDao.paginationFind(recordRange, orderBy, pageCurrent, search);
        return questionList;
    }

    @Override
    public int findQuestionCount(String search) {
        return questionDao.findQuestionCount(search);
    }

    @Override
    public int findLastQuestionId() {
        return questionDao.findLastQuestionId();
    }

    @Override
    public Question findQuestionById(int id) {
        return questionDao.findQuestionById(id);
    }

    @Override
    public void changeStatusById(String updateBy, String updateTime, int[] ids) {
        questionDao.changeStatusById(updateBy, updateTime, ids);
    }
}
