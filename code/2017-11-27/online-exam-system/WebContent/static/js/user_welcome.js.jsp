<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

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
        $("#iframe_question").attr("src", "${pageContext.request.contextPath}/page/question/find");
    });
    
    $("#li_create").click(function() {
        $("#li_create").addClass("li_selected_list_create");
        $("#li_list").removeClass("li_selected_list_create");
        $("#iframe_question").attr("src", "${pageContext.request.contextPath}/page/question/readyToCreate");
    });
    
    $("#laber_logout").click(function() {
        $("#form_logout").submit();
    });
});