package com.augmentum.oes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.augmentum.oes.model.Question;

@Repository
public interface QuestionDao {
    /**
     * Create a new question
     * @param Question question
     */
    @Insert("INSERT INTO question(question_name, option_a, option_b, option_c, option_d, correct_option, status, create_by, create_time, update_by, update_time) VALUES (#{questionName}, #{optionA}, #{optionB}, #{optionC}, #{optionD}, #{correctOption}, #{status}, #{createBy}, #{createTime}, #{updateBy}, #{updateTime})")
    public abstract void create(Question question);

    /**
     * Change questions'status for deleting them logically
     * @param String updateBy, String updateTime, int[] ids
     */
    public abstract void changeStatusById(@Param("updateBy") String updateBy, @Param("updateTime") String updateTime, @Param("ids") int[] ids);

    /**
     * Edit a question
     * @param Question question
     */
    @Update("UPDATE question SET question_name = #{questionName}, option_a = #{optionA}, option_b = #{optionB}, option_c = #{optionC}, option_d = #{optionD}, correct_option = #{correctOption}, update_by = #{updateBy}, update_time = #{updateTime} WHERE id = #{id}")
    public abstract void edit(Question question);

    /**
     * Find questions by id ASC with pagination and search
     * @param int recordRange, String orderBy, int pageCurrent, String search
     * @return List<Question>
     */
    @Select("SELECT * FROM question WHERE status = 1 AND question_name LIKE #{search} ORDER BY id ASC LIMIT #{pageCurrentFirst}, #{recordRange}")
    @ResultMap("BaseResultMap")
    public abstract List<Question> paginationFindASC(@Param("recordRange") int recordRange, @Param("pageCurrentFirst") int pageCurrentFirst, @Param("search") String search);

    /**
     * Find questions by id DESC with pagination and search
     * @param int recordRange, String orderBy, int pageCurrent, String search
     * @return List<Question>
     */
    @Select("SELECT * FROM question WHERE status = 1 AND question_name LIKE #{search} ORDER BY id DESC LIMIT #{pageCurrentFirst}, #{recordRange}")
    @ResultMap("BaseResultMap")
    public abstract List<Question> paginationFindDESC(@Param("recordRange") int recordRange, @Param("pageCurrentFirst") int pageCurrentFirst, @Param("search") String search);

    /**
     * Find the count of the questions which can be selected with search
     * @param String search
     * @return int
     */
    //@Select("SELECT count(id) FROM question WHERE status = 1 AND question_name LIKE #{search}")
    public abstract int findQuestionCount(String search);

    /**
     * Find the last question's id for creating it
     * @return int
     */
    @Select("SELECT id FROM question ORDER BY id DESC LIMIT 0, 1")
    public abstract int findLastQuestionId();

    /**
     * Find question's id for editing it
     * @param int id
     * @return Question
     */
    @Select("SELECT * FROM question WHERE id = #{id}")
    @ResultMap("BaseResultMap")
    public abstract Question findQuestionById(int id);
}
