package serviceTest;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.augmentum.oes.common.Pagination;
import com.augmentum.oes.model.Question;
import com.augmentum.oes.service.QuestionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class QuestionTest {
    private QuestionService questionService;

    @Autowired
    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    @Test
    public void creat() {
        Question question = new Question("testName", "testA", "testB", "testC", "testD", "C", 1, "createBy", "2017-11-08 23:26:37", "updateBy", "2017-11-08 23:26:37");
        questionService.create(question);
        System.out.println("successed");
    }

    @Test
    public void remove() {
        questionService.changeStatusById("updateBy", "2017-11-08 23:26:37", new int[]{1,2});
        System.out.println("successed");
    }

    @Test
    public void edit() {
        Question question = new Question("testName", "testA", "testB", "testC", "testD", "C", 1, "createBy", "2017-11-08 23:26:37", "updateBy", "2017-11-08 23:26:37");
        question.setId(1);
        questionService.edit(question);
        System.out.println("successed");
    }

    @Test
    public void find() {
        Pagination paginationUtil = new Pagination();
        paginationUtil.setRecordRange(10);
        paginationUtil.setRecordCount(questionService.findQuestionCount("1"));
        paginationUtil.setPageCount((int)Math.ceil((double)paginationUtil.getRecordCount() / (double)paginationUtil.getRecordRange()));

        List<Question> questionList = new ArrayList<Question>();
        questionList = questionService.paginationFind(paginationUtil.getRecordRange(), "ASC", 1, "1");
        System.out.println(questionList.toString());
    }

    @Test
    public void detail() {
        Question question = questionService.findQuestionById(1);
        System.out.println(question.toString());
    }
}