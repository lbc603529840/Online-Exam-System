<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.augmentum.oes.Constants"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Welcome to Online Exam Web System</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/user_login.css" />
  </head>
  <body>
    <div class="div_body">
      <div class="div_up">
        <div class="div_up_left">
          <img class="img_user_login_logo_90x180" alt="user_login_logo_90x180.png" src="<%=request.getContextPath()%>/static/images/user_login_logo_90x180.png" />
          <label class="label_name">Online Exam Web System</label>
        </div>
        <div class="div_up_right">
          <label class="label_message">Welcome to Login!</label>
          <div class="div_login">
            <form action="<%=request.getContextPath()%>/page/user/login" method="post" id="form_login" class="form_login">
              <input type="hidden" name="input_user_login" value="input_user_login" />
              <div id="div_service_error">
                <%
                  String serviceError = (String)request.getAttribute(Constants.SERVICE_ERROR);

                  if (serviceError != null) {
                %>
                <label id="label_service_error" class="label_service_error">
                  <%
                    out.print(serviceError);
                  %>
                </label>
                <%
                  }
                %>
              </div>
              <%
                @SuppressWarnings("unchecked")
                Map<String, String> parameterErrorField = (Map<String, String>)request.getAttribute(Constants.PARAMETER_ERROR_FIELD) == null ? new HashMap<String, String>() : (Map<String, String>)request.getAttribute(Constants.PARAMETER_ERROR_FIELD);
              %>
              <div class="div_img_username">
                <img alt="user_login_username_20x20" src="<%=request.getContextPath()%>/static/images/user_login_username_20x20.png" />
                <input type="text" name="input_username" id="input_username" class="input_username" placeholder="Username" />
              </div>
              <label id="label_username_parameter_error" class="parameterErrorMessage"></label>
              <div class="div_img_password">
                <img class="img_user_login_password_20x15" alt="user_login_password_20x15.png" src="<%=request.getContextPath()%>/static/images/user_login_password_20x15.png" />
                <input type="password" name="input_password" id="input_password" class="input_password" placeholder="Password" />
              </div>
              <label id="label_password_parameter_error" class="parameterErrorMessage"></label>
              <input id="input_login" type="button" value="Login" class="input_login" />
              <div class="div_img_remember_forget">
                <img id="img_user_login_unselected_15x15" class="img_user_login_unselected_15x15" alt="user_login_unselected_15x15.png" src="<%=request.getContextPath()%>/static/images/user_login_unselected_15x15.png" />
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
  <script src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
  <script>
    $(function() {
        var cookie = document.cookie + ";";
        var cookie_username = cookie.substring(cookie.indexOf("=", cookie.indexOf("<%=Constants.COOKIE_USERNAME%>")) + 1, cookie.indexOf(";", cookie.indexOf("<%=Constants.COOKIE_USERNAME%>")));
        var cookie_password = cookie.substring(cookie.indexOf("=", cookie.indexOf("<%=Constants.COOKIE_PASSWORD%>")) + 1, cookie.indexOf(";", cookie.indexOf("<%=Constants.COOKIE_PASSWORD%>")));
        
        if (cookie_username != "" && cookie_password != "") {
            $("#input_username").val(cookie_username);
            $("#input_password").val(cookie_password);
            $("#img_user_login_unselected_15x15").attr("src", "<%=request.getContextPath()%>/static/images/user_login_selected_15x15.png");
            $("#img_user_login_unselected_15x15").attr("flag", "selected");
            $("#input_is_remember").val("selected");
        } else {
            $("#input_username").val();
            $("#input_password").val();
            $("#img_user_login_unselected_15x15").attr("src", "<%=request.getContextPath()%>/static/images/user_login_unselected_15x15.png");
            $("#img_user_login_unselected_15x15").attr("flag", "unselected");
            $("#input_is_remember").val("unselected");
        }

        $("#img_user_login_unselected_15x15").click(function() {
            if ($("#img_user_login_unselected_15x15").attr("flag") != "selected") {
                $("#img_user_login_unselected_15x15").attr("src", "<%=request.getContextPath()%>/static/images/user_login_selected_15x15.png");
                $("#img_user_login_unselected_15x15").attr("flag", "selected");
                $("#input_is_remember").val("<%=Constants.IS_REMEMBER%>");
            } else {
                $("#img_user_login_unselected_15x15").attr("src", "<%=request.getContextPath()%>/static/images/user_login_unselected_15x15.png");
                $("#img_user_login_unselected_15x15").attr("flag", "unselected");
                $("#input_is_remember").val("unselected");
            }
        });
        
        $("#input_login").click(function() {
            var isSubmitForm = true;
            $("#div_service_error").text("");
            $("#label_username_parameter_error").html("");

            if (!$("#input_username").val()) {
                $("#label_username_parameter_error").html("<img class='img_user_login_wrong_20x20' alt='user_login_wrong_20x20.png' src='<%=request.getContextPath()%>/static/images/user_login_wrong_20x20.png' />");
                isSubmitForm = false;
            }

            $("#label_password_parameter_error").html("");
            
            if (!$("#input_password").val()) {
                $("#label_password_parameter_error").html("<img class='img_user_login_wrong_20x20' alt='user_login_wrong_20x20.png' src='<%=request.getContextPath()%>/static/images/user_login_wrong_20x20.png' />");
                isSubmitForm = false;
            }  

            if (isSubmitForm) {
                $("#form_login").submit();
            }
        });
    });
  </script>
</html>