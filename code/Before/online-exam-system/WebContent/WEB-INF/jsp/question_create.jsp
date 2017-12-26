<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Question Create</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/question_create.css" />
  </head>
  <body>
    <form action="<%=request.getContextPath()%>/page/question/create" method="post">
      <div class="div_question_id">
        <label>Question ID:</label>
        <div class="div_question_id_content">
          Q<%=request.getAttribute("nextQuestionId")%>
        </div>
      </div>
      <div class="div_question_name">
        <label class="label_question_name_content">Question:</label>
        <textarea class="textarea_question_name_content" name="question_name"></textarea>
      </div>
      <div class="div_option_a">
        <label class="label_option_a_content">Answer:</label>
        <input class="radio_a" type="radio" name="correct_option" value="A" />
        <label class="label_a">A</label>
        <input id="input_a" class="input_a" type="text" name="option_a" />
      </div>
      <div class="div_option_b">
        <input class="radio_b" type="radio" name="correct_option" value="B" />
        <label class="label_b">B</label>
        <input id="input_b" class="input_b" type="text" name="option_b" />
      </div>
      <div class="div_option_c">
        <input class="radio_c" type="radio" name="correct_option" value="C" />
        <label class="label_c">C</label>
        <input id="input_c" class="input_c" type="text" name="option_c" />
      </div>
      <div class="div_option_d">
        <input class="radio_d" type="radio" name="correct_option" value="D" />
        <label class="label_d">D</label>
        <input id="input_d" class="input_d" type="text" name="option_d" />
      </div>
      <input id="input_submit" class="input_submit" type="button" value="Create" />
      <input class="input_cancle" type="reset" value="Cancel" />
    </form>
  </body>
  <script src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
  <script>
    $(function() {
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