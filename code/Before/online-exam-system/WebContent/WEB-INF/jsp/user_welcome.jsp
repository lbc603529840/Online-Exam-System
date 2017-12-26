<%@page import="com.augmentum.oes.Constants"%>
<%@page import="com.augmentum.oes.model.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/user_welcome.css" />
  </head>
  <body>
    <div class="div_body">
      <div class="div_up">
        <div class="div_up_left">
          <img alt="user_welcome_logo_40x240.png" src="<%=request.getContextPath()%>/static/images/user_welcome_logo_40x240.png" />
          <label class="label_name">Online Exam Web System</label>
        </div>
        <div class="div_up_right">
          <div class="div_up_right_up">
            <label class="laber_language">中文</label>
          </div>
          <div class="div_up_right_down">
            <img class="img_user_welcome_personal_information_20x20" alt="user_welcome_personal_information_20x20.png" src="<%=request.getContextPath()%>/static/images/user_welcome_personal_information_20x20.png" />
            <div class="div_text">
              <label class="laber_username">
                <%
                  User user = (User)session.getAttribute(Constants.USER);
                  out.print(user.getUsername());
                %>
              </label>
              <form class="form_logout" action="<%=request.getContextPath()%>/page/user/readyToLogout" id="form_logout">
                <input type="hidden" name="input_user_logout" value=<%=Constants.IS_LOGOUT%> />
              </form> 
              <label id="laber_logout" class="laber_logout">Logout</label>
            </div> 
          </div>
        </div>
      </div>
      <div class="div_middle">
        <ul class="ul_li_label">
          <li id="li_question" class="li_question">
            <label class="label_question">Question Management</label>
          </li>
          <li id="li_exam" class="li_exam">
            <label class="label_exam">Exam Management</label>
          </li>
        </ul>
      </div>
      <div class="div_down">
        <div class="div_down_in">
          <div class="div_down_in_left">
            <ul class="ul_question">
              <li id="li_list" class="li_list">
                <label class="label_list">Question List</label>
              </li>
              <li id="li_create" class="li_create">
                <label class="label_create">Create Question</label>
              </li>
            </ul>
          </div>
          <div class="div_down_in_right">
            <iframe id="iframe_question" class="iframe" src="<%=request.getContextPath()%>/page/question/find" seamless></iframe>
          </div>
        </div>
        <div class="div_down_out">
          <label class="label_copyright">Copyright © 2014 Augmentum, Inc. All Rights Reserved.</label>
        </div>
      </div>
    </div>
  </body>
  <script src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
  <script>
    $(function() {
        $("#li_question").addClass("li_selected_question_exam");
        
        $("#li_question").click(function() {
            $("#li_question").addClass("li_selected_question_exam");
            $("#li_exam").removeClass("li_selected_question_exam");
        });
        
        $("#li_exam").click(function() {
            $("#li_exam").addClass("li_selected_question_exam");
            $("#li_question").removeClass("li_selected_question_exam");
        });
        
        $("#li_list").addClass("li_selected_list_create");
        
        $("#li_list").click(function() {
            $("#li_list").addClass("li_selected_list_create");
            $("#li_create").removeClass("li_selected_list_create");
            $("#iframe_question").attr("src", "<%=request.getContextPath()%>/page/question/find");
        });
        
        $("#li_create").click(function() {
            $("#li_create").addClass("li_selected_list_create");
            $("#li_list").removeClass("li_selected_list_create");
            $("#iframe_question").attr("src", "<%=request.getContextPath()%>/page/question/readyToCreate");
        });
        
        
        $("#laber_logout").click(function() {
            $("#form_logout").submit();
        });
    });
  </script>
</html>