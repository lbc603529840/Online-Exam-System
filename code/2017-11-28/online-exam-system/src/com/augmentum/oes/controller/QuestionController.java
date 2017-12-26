package com.augmentum.oes.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.augmentum.oes.Constants;
import com.augmentum.oes.common.AppContext;
import com.augmentum.oes.common.Pagination;
import com.augmentum.oes.model.Question;
import com.augmentum.oes.model.User;
import com.augmentum.oes.service.QuestionService;
import com.augmentum.oes.util.FormatUtil;

@Controller
@RequestMapping("/page/question")
@SessionAttributes("user")
public class QuestionController {
    QuestionService questionService;

    @Autowired
    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    ModelAndView modelAndView = new ModelAndView();

    @RequestMapping(value = "/readyToCreate", method = RequestMethod.GET)
    public ModelAndView readyToCreate() {
        String nextQuestionId = FormatUtil.getModelDisplayId(questionService.findLastQuestionId() + 1);

        modelAndView.addObject("nextQuestionId", nextQuestionId);
        modelAndView.setViewName("question_create");
        return modelAndView;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(
                               @RequestParam("question_name") String questinName,
                               @RequestParam("option_a") String optionA,
                               @RequestParam("option_b") String optionB,
                               @RequestParam("option_c") String optionC,
                               @RequestParam("option_d") String optionD,
                               @RequestParam("correct_option") String correctOption,
                               @ModelAttribute("user") User user) {
        Question question = new Question(questinName, optionA, optionB, optionC, optionD, correctOption, Constants.QUESTION_CAN_BE_SELECTED, user.getUsername(), FormatUtil.getNowDate(), user.getUsername(), FormatUtil.getNowDate());
        questionService.create(question);

        modelAndView.setView(new RedirectView(AppContext.getContextPath() + "/page/question/find?flashMessage=true&orderBy=DESC"));
        return modelAndView;
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public ModelAndView remove(
                               @RequestParam("remove_records") String removeRecords,
                               @ModelAttribute("user") User user) {
        int[] ids = FormatUtil.getIdArrayFromStringToInt((removeRecords).split("Q"));
        questionService.changeStatusById(user.getUsername(), FormatUtil.getNowDate(), ids);

        modelAndView.setView(new RedirectView(AppContext.getContextPath() + "/page/question/find?flashMessage=true"));
        return modelAndView;
    }

    @RequestMapping(value = "/readyToEdit", method = RequestMethod.GET)
    public ModelAndView readyToEdit(@RequestParam("questionId") String questionId) {
        Question question = questionService.findQuestionById(Integer.valueOf(questionId));

        modelAndView.addObject("question", question);
        modelAndView.setViewName("question_edit");
        return modelAndView;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView edit(
                             @RequestParam("questionId") String questionId,
                             @RequestParam("question_name") String questinName,
                             @RequestParam("option_a") String optionA,
                             @RequestParam("option_b") String optionB,
                             @RequestParam("option_c") String optionC,
                             @RequestParam("option_d") String optionD,
                             @RequestParam("correct_option") String correctOption,
                             @ModelAttribute("user") User user) {
        Question question = new Question(questinName, optionA, optionB, optionC, optionD, correctOption, Constants.QUESTION_CAN_BE_SELECTED, "", "", user.getUsername(), FormatUtil.getNowDate());
        question.setId(Integer.valueOf(questionId));
        questionService.edit(question);

        modelAndView.setView(new RedirectView(AppContext.getContextPath() + "/page/question/find?flashMessage=true"));
        return modelAndView;
    }

    @RequestMapping(value = "/find", method = RequestMethod.GET)
    public ModelAndView find(
                             @RequestParam(value = "flashMessage", defaultValue = "false") String flashMessage,
                             @RequestParam(value = "orderBy", defaultValue = "ASC") String orderBy,
                             @RequestParam(value = "pageCurrent", defaultValue = "1") String pageCurrent,
                             @RequestParam(value = "recordRange", defaultValue = "10") String recordRange,
                             @RequestParam(value = "search", defaultValue = "") String search) {
        Pagination paginationUtil = new Pagination();
        paginationUtil.setRecordRange(Integer.valueOf(recordRange));
        paginationUtil.setRecordCount(questionService.findQuestionCount(search));
        paginationUtil.setPageCount((int)Math.ceil((double)paginationUtil.getRecordCount() / (double)paginationUtil.getRecordRange()));

        List<Question> questionList = new ArrayList<Question>();
        questionList = questionService.paginationFind(paginationUtil.getRecordRange(), orderBy, Integer.valueOf(pageCurrent), search);

        modelAndView.addObject("flash_message", flashMessage);
        modelAndView.addObject("order_by", orderBy);
        modelAndView.addObject("page_current", pageCurrent);
        modelAndView.addObject("record_range", recordRange);
        modelAndView.addObject("search", search);
        modelAndView.addObject("page_count", paginationUtil.getPageCount());
        modelAndView.addObject(Constants.QUESTION_LIST, questionList);

        modelAndView.setViewName("question_find");
        return modelAndView;
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detail(@RequestParam(value = "questionId", defaultValue = "") String questionId) {
        Question question = questionService.findQuestionById(Integer.valueOf(questionId));

        modelAndView.addObject("question", question);
        modelAndView.setViewName("question_detail");
        return modelAndView;
    }
}
