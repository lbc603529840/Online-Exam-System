<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html> 
  <head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Welcome to Online Exam Web System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user_login.css" />
  </head> 
  <body>
    <div class="div_body">
      <div class="div_up">
        <div class="div_up_left">
          <img class="img_user_login_logo_90x180" alt="user_login_logo_90x180.png" src="${pageContext.request.contextPath}/static/images/user_login_logo_90x180.png" />
          <label class="label_name">Online Exam Web System</label>
        </div>
        <div class="div_up_right">
          <label class="label_message">Welcome to Login!</label>
          <div class="div_login">
            <form action="${pageContext.request.contextPath}/page/user/login" method="post" id="form_login" class="form_login">
              <input type="hidden" name="input_user_login" value="input_user_login" />
              <div id="div_service_error">
                <c:set var="serviceError" value="${service_error}"></c:set>
                <c:if test="${serviceError != null}">
                  <label id="label_service_error" class="label_service_error">
                    <c:out value="${serviceError}"></c:out>
                  </label>
                </c:if>
              </div>
              <div class="div_img_username">
                <img alt="user_login_username_20x20" src="${pageContext.request.contextPath}/static/images/user_login_username_20x20.png" />
                <input type="text" name="input_username" id="input_username" class="input_username" placeholder="Username" />
              </div>
              <label id="label_username_parameter_error" class="parameterErrorMessage"></label>
              <div class="div_img_password">
                <img class="img_user_login_password_20x15" alt="user_login_password_20x15.png" src="${pageContext.request.contextPath}/static/images/user_login_password_20x15.png" />
                <input type="password" name="input_password" id="input_password" class="input_password" placeholder="Password" />
              </div>
              <label id="label_password_parameter_error" class="parameterErrorMessage"></label>
              <input id="input_login" type="button" value="Login" class="input_login" />
              <div class="div_img_remember_forget">
                <img id="img_user_login_unselected_15x15" class="img_user_login_unselected_15x15" alt="user_login_unselected_15x15.png" src="${pageContext.request.contextPath}/static/images/user_login_unselected_15x15.png" />
                <input type="hidden" id="input_is_remember" name="input_is_remember" value="unselected" />
                <p class="p_remember_forget">
                  <span>Remember me</span>
                  <span class="span_forgot">Forgot password?</span>
                </p>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="div_down">
        <label class="label_copyright">Copyright © 2014 Augmentum, Inc. All Rights Reserved.</label>
      </div>
    </div>
  </body>
  <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/user_login.js.jsp"></script>
</html>