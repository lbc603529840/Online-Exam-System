package com.augmentum.oes.service;

import java.util.List;

import com.augmentum.oes.model.Question;

public interface QuestionService {
    /**
     * Create a new question
     * @param Question question
     */
    public abstract void create(Question question);

    /**
     * Change questions'status for deleting them logically
     * @param String updateBy, String updateTime, int[] ids
     */
    public abstract void changeStatusById(String updateBy, String updateTime, int[] ids);

    /**
     * Edit a question
     * @param Question question
     */
    public abstract void edit(Question question);

    /**
     * Find questions by id ASC or DESC with pagination and search
     * @param int recordRange, String orderBy, int pageCurrent, String search
     * @return List<Question>
     */
    public abstract List<Question> paginationFind(int recordRange, String orderBy, int pageCurrent, String search);

    /**
     * Find the count of the questions which can be selected with search
     * @param String search
     * @return int
     */
    public abstract int findQuestionCount(String search);

    /**
     * Find the last question's id for creating it
     * @return int
     */
    public abstract int findLastQuestionId();

    /**
     * Find question's id for editing it
     * @param int id
     * @return Question
     */
    public abstract Question findQuestionById(int id);
}
