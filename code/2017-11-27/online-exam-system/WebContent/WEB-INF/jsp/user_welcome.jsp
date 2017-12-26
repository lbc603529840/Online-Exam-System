<%@page import="com.augmentum.oes.Constants"%>
<%@page import="com.augmentum.oes.model.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user_welcome.css" />
  </head>
  <body>
    <div class="div_body">
      <div class="div_up">
        <div class="div_up_left">
          <img alt="user_welcome_logo_40x240.png" src="${pageContext.request.contextPath}/static/images/user_welcome_logo_40x240.png" />
          <label class="label_name">Online Exam Web System</label>
        </div>
        <div class="div_up_right">
          <div class="div_up_right_up">
            <label class="laber_language">中文</label>
          </div>
          <div class="div_up_right_down">
            <img class="img_user_welcome_personal_information_20x20" alt="user_welcome_personal_information_20x20.png" src="${pageContext.request.contextPath}/static/images/user_welcome_personal_information_20x20.png" />
            <div class="div_text">
              <label class="laber_username">
                <c:out value="${user.getUsername()}" />
              </label>
              <form id="form_logout" class="form_logout" action="${pageContext.request.contextPath}/page/user/readyToLogout" method="get">
                <input type="hidden" name="input_user_logout" value="logout" />
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
            <iframe id="iframe_question" class="iframe" src="${pageContext.request.contextPath}/page/question/find" seamless></iframe>
          </div>
        </div>
        <div class="div_down_out">
          <label class="label_copyright">Copyright © 2014 Augmentum, Inc. All Rights Reserved.</label>
        </div>
      </div>
    </div>
  </body>
  <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/user_welcome.js.jsp"></script>
</html>