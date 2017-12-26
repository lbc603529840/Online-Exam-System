<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Question Create</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/question_create.css" />
  </head>
  <body>
    <form action="${pageContext.request.contextPath}/page/question/create" method="post">
      <div class="div_question_id">
        <label>Question ID:</label>
        <div class="div_question_id_content">
          Q${nextQuestionId}
        </div>
        <span id="span_error" class="span_error">Please select the correct option</span>
      </div>
      <div class="div_question_name">
        <label class="label_question_name_content">Question:</label>
        <textarea id="textarea_question_name_content" class="textarea_question_name_content" name="question_name"></textarea>
        <img class="img_question_create_wrong_20x20" alt="question_create_wrong_20x20.png" src="${pageContext.request.contextPath}/static/images/question_create_wrong_20x20.png" />
      </div>
      <div class="div_option_a">
        <label class="label_option_a_content">Answer:</label>
        <input class="radio_a" type="radio" name="correct_option" value="A" />
        <label class="label_a">A</label>
        <input id="input_a" class="input_a" type="text" name="option_a" />
        <img class="img_question_create_wrong_20x20" alt="question_create_wrong_20x20.png" src="${pageContext.request.contextPath}/static/images/question_create_wrong_20x20.png" />
      </div>
      <div class="div_option_b">
        <input class="radio_b" type="radio" name="correct_option" value="B" />
        <label class="label_b">B</label>
        <input id="input_b" class="input_b" type="text" name="option_b" />
        <img class="img_question_create_wrong_20x20" alt="question_create_wrong_20x20.png" src="${pageContext.request.contextPath}/static/images/question_create_wrong_20x20.png" />
      </div>
      <div class="div_option_c">
        <input class="radio_c" type="radio" name="correct_option" value="C" />
        <label class="label_c">C</label>
        <input id="input_c" class="input_c" type="text" name="option_c" />
        <img class="img_question_create_wrong_20x20" alt="question_create_wrong_20x20.png" src="${pageContext.request.contextPath}/static/images/question_create_wrong_20x20.png" />
      </div>
      <div class="div_option_d">
        <input class="radio_d" type="radio" name="correct_option" value="D" />
        <label class="label_d">D</label>
        <input id="input_d" class="input_d" type="text" name="option_d" />
        <img class="img_question_create_wrong_20x20" alt="question_create_wrong_20x20.png" src="${pageContext.request.contextPath}/static/images/question_create_wrong_20x20.png" />
      </div>
      <input id="input_submit" class="input_submit" type="button" value="Create" />
      <input class="input_cancle" type="reset" value="Cancel" />
    </form>
  </body>
  <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/question_create.js"></script>
</html>