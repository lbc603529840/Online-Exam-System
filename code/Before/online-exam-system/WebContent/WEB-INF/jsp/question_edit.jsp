<%@page import="com.augmentum.oes.util.FormatUtil"%>
<%@page import="com.augmentum.oes.model.Question"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Question Create</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/question_edit.css" />
  </head>
  <%
    Question question = (Question)request.getAttribute("question");
  %>
  <body>
    <form action="<%=request.getContextPath()%>/page/question/edit" method="post">
      <div class="div_question_id">
        <label>Question ID:</label>
        <div class="div_question_id_content">
          Q<%=FormatUtil.getModelDisplayId(question.getId())%>
          <input type="hidden" name="questionId" value="<%=question.getId()%>" />
        </div>
      </div>
      <div class="div_question_name">
        <label class="label_question_name_content">Question:</label>
        <textarea class="textarea_question_name_content" name="question_name"><%=question.getQuestionName()%></textarea>
      </div>
      <div class="div_option_a">
        <label class="label_option_a_content">Answer:</label>
        <input id="radio_a" class="radio_a" type="radio" name="correct_option" value="A" />
        <label class="label_a">A</label>
        <input id="input_a" class="input_a" type="text" name="option_a" value="<%=question.getOptionA()%>" />
      </div>
      <div class="div_option_b">
        <input id="radio_b" class="radio_b" type="radio" name="correct_option" value="B" />
        <label class="label_b">B</label>
        <input id="input_b" class="input_b" type="text" name="option_b" value="<%=question.getOptionB()%>" />
      </div>
      <div class="div_option_c">
        <input id="radio_c" class="radio_c" type="radio" name="correct_option" value="C" />
        <label class="label_c">C</label>
        <input id="input_c" class="input_c" type="text" name="option_c" value="<%=question.getOptionC()%>" />
      </div>
      <div class="div_option_d">
        <input id="radio_d" class="radio_d" type="radio" name="correct_option" value="D" />
        <label class="label_d">D</label>
        <input id="input_d" class="input_d" type="text" name="option_d" value="<%=question.getOptionD()%>" />
      </div>
      <input id="input_submit" class="input_submit" type="button" value="Save" />
      <input class="input_cancle" type="reset" value="Cancel" />
    </form>
  </body>
  <script src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
  <script>
    $(function() {
        var currentCorrectOption = "<%=question.getCorrectOption()%>";
        
        if (currentCorrectOption == "A") {
            $("#radio_a").attr("checked", "checked");
            $("#input_a").addClass("correct_option");
            $("#input_b").removeClass("correct_option");
            $("#input_c").removeClass("correct_option");
            $("#input_d").removeClass("correct_option");
        } else if (currentCorrectOption == "B") {
            $("#radio_b").attr("checked", "checked");
            $("#input_b").addClass("correct_option");
            $("#input_a").removeClass("correct_option");
            $("#input_c").removeClass("correct_option");
            $("#input_d").removeClass("correct_option");
        } else if (currentCorrectOption == "C") {
            $("#radio_c").attr("checked", "checked");
            $("#input_c").addClass("correct_option");
            $("#input_a").removeClass("correct_option");
            $("#input_b").removeClass("correct_option");
            $("#input_d").removeClass("correct_option");
        } else if (currentCorrectOption == "D") {
            $("#radio_d").attr("checked", "checked");
            $("#input_d").addClass("correct_option");
            $("#input_a").removeClass("correct_option");
            $("#input_b").removeClass("correct_option");
            $("#input_c").removeClass("correct_option");
        }
        
        $("input[type='radio']").click(function() {
            if ($(this).val() == "A") {
                $("#input_a").addClass("correct_option");
                $("#input_b").removeClass("correct_option");
                $("#input_c").removeClass("correct_option");
                $("#input_d").removeClass("correct_option");
            } else if ($(this).val() == "B") {
                $("#input_b").addClass("correct_option");
                $("#input_a").removeClass("correct_option");
                $("#input_c").removeClass("correct_option");
                $("#input_d").removeClass("correct_option");
            } else if ($(this).val() == "C") {
                $("#input_c").addClass("correct_option");
                $("#input_a").removeClass("correct_option");
                $("#input_b").removeClass("correct_option");
                $("#input_d").removeClass("correct_option");
            } else if ($(this).val() == "D") {
                $("#input_d").addClass("correct_option");
                $("#input_a").removeClass("correct_option");
                $("#input_b").removeClass("correct_option");
                $("#input_c").removeClass("correct_option");
            }
        });
        
        $("#input_submit").click(function() {
            $("form").submit();
        });
    });
  </script>
</html>