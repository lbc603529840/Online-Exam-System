<%@page import="java.util.Collections"%>
<%@page import="com.augmentum.oes.util.FormatUtil"%>
<%@page import="com.augmentum.oes.Constants"%>
<%@page import="com.augmentum.oes.model.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.augmentum.oes.Constants"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Question Find</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/question_find.css" />
  </head>
  <body>
    <div id="div_flash_message" class="div_flash_message">
      <span>Successed!</span>
    </div>
    <input id="input_find" type="text" name="input_find" class="input_find" placeholder="Please input the keyword" />
    <img id="img_question_find_search_15x20" class="img_question_find_search_15x20" alt="question_find_search_15x20.png" src="<%=request.getContextPath()%>/static/images/question_find_search_15x20.png" />
    <div class="div_table">
      <div class="div_title">
        <ul class="ul_title">
          <li class="title_li_1st">
            ID<img id="img_question_find_asc_10x15" class="img_question_find_asc_10x15" alt="question_find_asc_10x15.png" src="<%=request.getContextPath()%>/static/images/question_find_asc_10x15.png" />
          </li>
          <li class="title_li_2nd">
            Description
          </li>
          <li class="title_li_3rd">
            Edit
          </li>
          <li class="title_li_4th">
            <img id="img_question_find_unselected_all_15x15" class="img_question_find_unselected_all_15x15" alt="question_find_unselected_all_15x15.png" src="<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png">
          </li>
        </ul>
      </div>
      <div id="div_asc">
        <%
          int ascNumber = 1;
          @SuppressWarnings("unchecked")
          List<Question> questionListAsc = (List<Question>)request.getAttribute("questionList");
          if (questionListAsc != null) {
              for (Question question : questionListAsc) {
                %>
                <div class="div_content">
                  <ul class="ul_content">
                    <li class="content_li_1st">
                      <%=ascNumber%>
                    </li>
                    <li class="content_li_2nd">
                      Q<%=FormatUtil.getModelDisplayId(question.getId())%>
                    </li>
                    <li class="content_li_3rd">
                      <a href="<%=request.getContextPath()%>/page/question/detail?questionId=<%=question.getId()%>">
                        <%=question.getQuestionName()%>
                      </a>
                    </li>
                    <li class="content_li_4th">
                      <a href="<%=request.getContextPath()%>/page/question/readyToEdit?questionId=<%=question.getId()%>">
                        <img id="img_question_find_edit_15x15" class="img_question_find_edit_15x15" alt="question_find_edit_15x15.png" src="<%=request.getContextPath()%>/static/images/question_find_edit_15x15.png" />
                      </a>
                    </li>
                    <li id="content_li_5th" class="content_li_5th">
                      <img class="img_question_find_unselected_15x15" alt="question_find_unselected_15x15.png" src="<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png" />
                    </li>
                  </ul>
                </div>
                <%
                  ascNumber++;
              }
          } else {
              response.sendRedirect(request.getContextPath() + "/page/question/find");
          }
        %>
      </div>
    </div>
    <div id="div_pagination" class="div_pagination">
      <img id="img_question_find_page_left_20x15" class="img_question_find_page_left_20x15" alt="question_find_page_left_20x15.png" src="<%=request.getContextPath()%>/static/images/question_find_page_left_20x15.png" />
      <ul id="ul_pagination" class="ul_pagination">
        <li id="pagination_1st" class="pagination_li_1st"><%=Integer.valueOf((String)request.getAttribute("page_current")) - 1%></li>
        <li id="pagination_2nd" class="pagination_li_2nd"><%=request.getAttribute("page_current")%></li>
        <li id="pagination_3td" class="pagination_li_3td"><%=Integer.valueOf((String)request.getAttribute("page_current")) + 1%></li>
        <li id="pagination_4th" class="pagination_li_4th">…</li>
        <li id="pagination_page_count" class="pagination_li_5th"><%=request.getAttribute("page_count")%></li>
      </ul>
      <img id="img_question_find_page_right_20x15" class="img_question_find_page_right_20x15" alt="question_find_page_right_20x15.png" src="<%=request.getContextPath()%>/static/images/question_find_page_right_20x15.png" />
      <select id="select_pagination" class="select_pagination">
        <option>1</option>
        <option>2</option>
        <option>4</option>
        <option>6</option>
        <option>8</option>
        <option>10</option>
      </select>
      <label id="label_per_page" class="label_per_page">Per page</label>
      <input id="input_pagination" type="text" class="input_pagination" />
      <input id="input_go" type="button" class="input_go" value="Go" />
    </div>
    <input id="input_delete" class="input_delete" type="button" value="Delete" />
    <div id="div_delete" class="div_delete">
      <form id="form_delete" action="<%=request.getContextPath()%>/page/question/remove" method="post">
        <input id="input_delete_string" type="hidden" name="remove_records" />
        <img id="img_question_remove_close_16x16" class="img_question_remove_close_16x16" alt="question_remove_close_16x16.png" src="<%=request.getContextPath()%>/static/images/question_remove_close_16x16.png" />
        <span class="span_text">Are you sure delete the selected options?</span>
        <input id="input_yes" class="input_yes" type="button" value="Yes" />
        <input id="input_no" class="input_no" type="button" value="No" />
      </form>
    </div>
  </body>
  <script src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
  <script>
    $(function() {
        var flashMessage = "<%=request.getAttribute("flash_message")%>";
        var orderBy = "<%=request.getAttribute("order_by")%>";
        var pageCurrent = "<%=request.getAttribute("page_current")%>";
        var recordRange = "<%=request.getAttribute("record_range")%>";
        var search = "<%=request.getAttribute("search")%>";
        
        if (orderBy == "ASC") {
            $("#img_question_find_asc_10x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_asc_10x15.png");    
        } else {
            $("#img_question_find_asc_10x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_desc_10x15.png");
        }
        
        $("#img_question_find_asc_10x15").click(function() {
            if (orderBy == "ASC") {
                orderBy = "DESC";
                window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
            } else {
                orderBy = "ASC";
                window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
            }
        });
        
        $("#pagination_1st").click(function() {
            if ($("#pagination_1st").text() <= 0) {
                $("#pagination_1st").hide();
            } else {
                $("#pagination_3td").show();
                $("#pagination_2nd").text(parseInt($("#pagination_2nd").text()) - 1);
                $("#pagination_1st").text(parseInt($("#pagination_2nd").text()) - 1);
                $("#pagination_3td").text(parseInt($("#pagination_2nd").text()) + 1);
                pageCurrent = $("#pagination_2nd").text();
                window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
            }
        });

        $("#pagination_3td").click(function() {
            if ($("#pagination_3td").text() > $("#pagination_page_count").text()) {
                $("#pagination_3td").hide();
            } else {
                $("#pagination_1st").show();
                $("#pagination_2nd").text(parseInt($("#pagination_2nd").text()) + 1);
                $("#pagination_1st").text(parseInt($("#pagination_2nd").text()) - 1);
                $("#pagination_3td").text(parseInt($("#pagination_2nd").text()) + 1);
                pageCurrent = $("#pagination_2nd").text();
                window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
            }
        });
        
        $("#img_question_find_page_left_20x15").click(function() {
            $("#pagination_1st").text(0);
            $("#pagination_2nd").text(1);
            $("#pagination_3td").text(2);
            $("#pagination_3td").show();
            pageCurrent = $("#pagination_2nd").text();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        });
        
        $("#img_question_find_page_right_20x15").click(function() {
            $("#pagination_1st").text(parseInt($("#pagination_page_count").text()) - 1);
            $("#pagination_2nd").text($("#pagination_page_count").text());
            $("#pagination_3td").text(parseInt($("#pagination_page_count").text()) + 1);
            $("#pagination_1st").show();
            pageCurrent = $("#pagination_2nd").text();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        });

        $("#input_go").click(function() {
            if ($.isNumeric($("#input_pagination").val()) && $("#input_pagination").val() != "") {
                pageCurrent = parseInt($("#input_pagination").val());
                
                if (pageCurrent > parseInt($("#pagination_page_count").text())) {
                    pageCurrent = $("#pagination_page_count").text();
                }

                if ($("#input_pagination").val() < 1) {
                    pageCurrent = 1;
                }

                window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
            } else {
                alert("Please write the number");
                $("#input_pagination").val("");
            }
        });

        $("#select_pagination option").each(function(){
            if ($(this).text() == recordRange) {
                $(this).attr("selected", "selected");
                return false;
            }
        });
        
        $("#select_pagination").change(function () {
            recordRange = $("#select_pagination option:selected").val();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&recordRange=" + recordRange + "&search=" + search;
        });
        
        $("#img_question_find_search_15x20").click(function() {
            search = $("#input_find").val();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        });
        
        $("#img_question_find_unselected_all_15x15").click(function() {
            if ($("#img_question_find_unselected_all_15x15").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
            	$("#img_question_find_unselected_all_15x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $(".img_question_find_unselected_15x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val("");
                $("#input_delete_string").val($(".content_li_2nd").text());
                $("#input_delete_string").val($("#input_delete_string").val().replace(/\s/g, ""));
            } else {
                $("#img_question_find_unselected_all_15x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $(".img_question_find_unselected_15x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val("");
            }
        });
        
        $(".img_question_find_unselected_15x15").click(function() {
        	if ($(this).attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
        		$(this).attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $(this).parent().prev().prev().prev().text().trim());
        	} else {
                $(this).attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_all_15x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($(this).parent().prev().prev().prev().text().trim(), ""));
            }
        });
        
        $("#input_delete").click(function() {
            if ($("#input_delete_string").val() != "") {
                $("#div_delete").show();
            }
        });
        
        $("#img_question_remove_close_16x16, #input_no").click(function() {
            $("#div_delete").hide();
        });
        
        $("#input_yes").click(function() {
            $("#form_delete").submit();
        });
        
        if (flashMessage == "true") {
            $("#div_flash_message").show();
            $("#div_flash_message").fadeOut(3000);
        }
    });
  </script>
</html>