/*package serviceTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.augmentum.oes.exception.ParameterException;
import com.augmentum.oes.exception.ServiceException;
import com.augmentum.oes.model.Question;
import com.augmentum.oes.model.User;
import com.augmentum.oes.service.QuestionService;
import com.augmentum.oes.service.UserService;

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
        Question question = new Question("testName", "testA", "testB", "testC", "testD", "", status, createBy, createTime, updateBy, updateTime)
        questionService.create(question);
        System.out.println(user.toString());
    }
}
*/