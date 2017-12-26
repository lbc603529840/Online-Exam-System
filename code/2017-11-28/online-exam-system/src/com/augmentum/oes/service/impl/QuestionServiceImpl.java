package com.augmentum.oes.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.augmentum.oes.dao.QuestionDao;
import com.augmentum.oes.model.Question;
import com.augmentum.oes.service.QuestionService;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {
    QuestionDao questionDao;

    @Resource
    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    @Override
    public void create(Question question) {
        questionDao.create(question);
    }

    @Override
    public void changeStatusById(String updateBy, String updateTime, int[] ids) {
        questionDao.changeStatusById(updateBy, updateTime, ids);
    }

    @Override
    public void edit(Question question) {
        questionDao.edit(question);
    }

    @Override
    public List<Question> paginationFind(int recordRange, String orderBy, int pageCurrent, String search) {
        List<Question> questionList = new ArrayList<Question>();

        if ("ASC".equals(orderBy)) {
            questionList = questionDao.paginationFindASC(recordRange, (pageCurrent - 1) * recordRange, "%" +search + "%");
        } else {
            questionList = questionDao.paginationFindDESC(recordRange, (pageCurrent - 1) * recordRange, "%" +search + "%");
        }

        return questionList;
    }

    @Override
    public int findQuestionCount(String search) {
        return questionDao.findQuestionCount("%" + search + "%");
    }

    @Override
    public int findLastQuestionId() {
        return questionDao.findLastQuestionId();
    }

    @Override
    public Question findQuestionById(int id) {
        return questionDao.findQuestionById(id);
    }
}
