<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Question Detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/question_detail.css" />
  </head>
  <body>
    <div class="div_question_id">
      <label>Question ID:</label>
      <div class="div_question_id_content">
        Q${questionDisplayId}
      </div>
    </div>
    <div class="div_question_name">
      <label class="label_question_name_content">Question:</label>
      <textarea class="textarea_question_name_content" name="question_name" readonly="readonly">${question.getQuestionName()}</textarea>
    </div>
    <div class="div_option_a">
      <label class="label_option_a_content">Answer:</label>
      <input id="radio_a" class="radio_a" type="radio" name="correct_option" value="A" disabled />
      <label class="label_a">A</label>
      <input id="input_a" class="input_a" type="text" name="option_a" value="${question.getOptionA()}" readonly="readonly" />
    </div>
    <div class="div_option_b">
      <input id="radio_b" class="radio_b" type="radio" name="correct_option" value="B" disabled />
      <label class="label_b">B</label>
      <input id="input_b" class="input_b" type="text" name="option_b" value="${question.getOptionB()}" readonly="readonly" />
    </div>
    <div class="div_option_c">
      <input id="radio_c" class="radio_c" type="radio" name="correct_option" value="C" disabled />
      <label class="label_c">C</label>
      <input id="input_c" class="input_c" type="text" name="option_c" value="${question.getOptionC()}" readonly="readonly" />
    </div>
    <div class="div_option_d">
      <input id="radio_d" class="radio_d" type="radio" name="correct_option" value="D" disabled />
      <label class="label_d">D</label>
      <input id="input_d" class="input_d" type="text" name="option_d" value="${question.getOptionD()}" readonly="readonly" />
    </div>
    <input id="input_correct_option" type="hidden" value="${question.getCorrectOption()}" />
    <a href="${pageContext.request.contextPath}/page/question/readyToEdit?questionId=${question.getId()}">
      <input id="input_submit" class="input_submit" type="button" value="Edit" />
    </a>
    <input class="input_cancle" type="reset" value="Cancel" />
  </body>
  <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/question_detail.js"></script>
</html>