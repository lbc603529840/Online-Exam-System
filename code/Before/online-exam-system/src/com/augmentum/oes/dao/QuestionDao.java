package com.augmentum.oes.dao;

import java.util.List;

import com.augmentum.oes.model.Question;

public interface QuestionDao {
    public abstract void create(Question question);
    public abstract void edit(Question question);
    public abstract void changeStatusById(String updateBy, String updateTime, int[] ids);
    public abstract List<Question> paginationFind(int recordRange, String orderBy, int pageCurrent, String search);
    public abstract int findQuestionCount(String search);
    public abstract int findLastQuestionId();
    public abstract Question findQuestionById(int id);
}
