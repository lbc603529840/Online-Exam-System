package com.augmentum.oes.service;

import java.util.List;

import com.augmentum.oes.model.Question;

public interface QuestionService {
    public abstract int questionCreate(Question question);
    public abstract int questionEdit(Question question);
    public abstract List<Question> paginationFind(int recordRange, String orderBy, int pageCurrent, String search);
    public abstract int findQuestionCount(String search);
    public abstract int findLastQuestionId();
    public abstract Question findQuestionById(int id);
    public abstract void changeStatusById(String updateBy, String updateTime, int[] ids);
}
