<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

$(function() {
    var cookie = document.cookie + ";";
    var cookie_username = cookie.substring(cookie.indexOf("=", cookie.indexOf("<c:out value='cookie_username' />")) + 1, cookie.indexOf(";", cookie.indexOf("<c:out value='cookie_username' />")));
    var cookie_password = cookie.substring(cookie.indexOf("=", cookie.indexOf("<c:out value='cookie_password' />")) + 1, cookie.indexOf(";", cookie.indexOf("<c:out value='cookie_password' />")));
    
    if (cookie_username != "" && cookie_password != "") {
        $("#input_username").val(cookie_username);
        $("#input_password").val(cookie_password);
        $("#img_user_login_unselected_15x15").attr("src", "${pageContext.request.contextPath}/static/images/user_login_selected_15x15.png");
        $("#img_user_login_unselected_15x15").attr("flag", "selected");
        $("#input_is_remember").val("selected");
    } else {
        $("#input_username").val();
        $("#input_password").val();
        $("#img_user_login_unselected_15x15").attr("src", "${pageContext.request.contextPath}/static/images/user_login_unselected_15x15.png");
        $("#img_user_login_unselected_15x15").attr("flag", "unselected");
        $("#input_is_remember").val("unselected");
    }
    
    $("#img_user_login_unselected_15x15").click(function() {
        if ($("#img_user_login_unselected_15x15").attr("flag") != "selected") {
            $("#img_user_login_unselected_15x15").attr("src", "${pageContext.request.contextPath}/static/images/user_login_selected_15x15.png");
            $("#img_user_login_unselected_15x15").attr("flag", "selected");
            $("#input_is_remember").val("selected");
        } else {
            $("#img_user_login_unselected_15x15").attr("src", "${pageContext.request.contextPath}/static/images/user_login_unselected_15x15.png");
            $("#img_user_login_unselected_15x15").attr("flag", "unselected");
            $("#input_is_remember").val("unselected");
        }
    });
    
    $(document).keydown(function(event) { 
        if(event.keyCode == 13) { 
            $("#input_login").click(); 
        } 
    });
    
    $("#input_login").click(function() {
        var isSubmitForm = true;
        $("#div_service_error").text("");
        $("#label_username_parameter_error").html("");
    
        if (!$("#input_username").val()) {
            $("#label_username_parameter_error").html("<img class='img_user_login_wrong_20x20' alt='user_login_wrong_20x20.png' src='${pageContext.request.contextPath}/static/images/user_login_wrong_20x20.png' />");
            isSubmitForm = false;
        }
    
        $("#label_password_parameter_error").html("");
        
        if (!$("#input_password").val()) {
            $("#label_password_parameter_error").html("<img class='img_user_login_wrong_20x20' alt='user_login_wrong_20x20.png' src='${pageContext.request.contextPath}/static/images/user_login_wrong_20x20.png' />");
            isSubmitForm = false;
        }  
    
        if (isSubmitForm) {
            $("#form_login").submit();
        }
    });
});