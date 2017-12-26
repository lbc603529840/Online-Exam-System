package com.augmentum.oes.model;

public class UserExam {
    private int id;
    private int userId;
    private int examId;
    private int status;
    private double actualScore;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getActualScore() {
        return actualScore;
    }

    public void setActualScore(double actualScore) {
        this.actualScore = actualScore;
    }
}
