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
    <input id="input_find" type="text" name="input_find" class="input_find" placeholder="Please input the keyword"/>
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
                    <li id="content_li_2nd_<%=ascNumber%>" class="content_li_2nd">
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
                      <img id="img_question_find_unselected_15x15_<%=ascNumber%>" class="img_question_find_unselected_15x15" alt="question_find_unselected_15x15.png" src="<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png" />
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
        
        $("#pagination_2nd").addClass("pagination_li_selected");
        
        $("#pagination_1st").click(function() {
            if ($("#pagination_1st").text() <= 0) {
                $("#pagination_1st").addClass("cover");
            } else {
                $("#pagination_3td").removeClass("cover");
                $("#pagination_2nd").text(parseInt($("#pagination_2nd").text()) - 1);
                $("#pagination_1st").text(parseInt($("#pagination_2nd").text()) - 1);
                $("#pagination_3td").text(parseInt($("#pagination_2nd").text()) + 1);
                pageCurrent = $("#pagination_2nd").text();
                window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
            }
        });

        $("#pagination_3td").click(function() {
            if ($("#pagination_3td").text() > $("#pagination_page_count").text()) {
                $("#pagination_3td").addClass("cover");
            } else {
                $("#pagination_1st").removeClass("cover");
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
            $("#pagination_3td").removeClass("cover");
            pageCurrent = $("#pagination_2nd").text();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        });
        
        $("#img_question_find_page_right_20x15").click(function() {
            $("#pagination_1st").text(parseInt($("#pagination_page_count").text()) - 1);
            $("#pagination_2nd").text($("#pagination_page_count").text());
            $("#pagination_3td").text(parseInt($("#pagination_page_count").text()) + 1);
            $("#pagination_1st").removeClass("cover");
            pageCurrent = $("#pagination_2nd").text();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        });
        
        
        $("#input_go").click(function() {
            if ($("#input_pagination").val() > $("#pagination_page_count").text()) {
                $("#input_pagination").val($("#pagination_page_count").text());
            }
       
            if ($("#input_pagination").val() < 1) {
                $("#input_pagination").val(1);
            }
       
            pageCurrent = $("#input_pagination").val();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        });
        
        $("#select_pagination option").each(function(){
            if ($(this).text() == recordRange) {
                $(this).attr("selected", "selected");
                return false;
            }
        });
        
        $("#select_pagination").change(function () {
            recordRange = $("#select_pagination option:selected").val();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        });
        
        $("#img_question_find_search_15x20").click(function() {
            search = $("#input_find").val();
            window.location.href = "<%=request.getContextPath() + "/page/question/find"%>?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        });
        
        $("#img_question_find_unselected_all_15x15").click(function() {
            if ($("#img_question_find_unselected_all_15x15").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_all_15x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_1").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_2").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_3").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_4").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_5").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_6").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_7").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_8").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_9").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#img_question_find_unselected_15x15_10").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val();
                $("#input_delete_string").val($("#content_li_2nd_1").text().trim() + $("#content_li_2nd_2").text().trim() + $("#content_li_2nd_3").text().trim() + $("#content_li_2nd_4").text().trim() + $("#content_li_2nd_5").text().trim() + $("#content_li_2nd_6").text().trim() + $("#content_li_2nd_7").text().trim() + $("#content_li_2nd_8").text().trim() + $("#content_li_2nd_9").text().trim() + $("#content_li_2nd_10").text().trim());
            } else {
                $("#img_question_find_unselected_all_15x15").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_1").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_2").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_3").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_4").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_5").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_6").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_7").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_8").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_9").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#img_question_find_unselected_15x15_10").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val();
            }
        });
        
        $("#img_question_find_unselected_15x15_1").click(function() {
            if ($("#img_question_find_unselected_15x15_1").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_1").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_1").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_1").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_1").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_2").click(function() {
            if ($("#img_question_find_unselected_15x15_2").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_2").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_2").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_2").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_2").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_3").click(function() {
            if ($("#img_question_find_unselected_15x15_3").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_3").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_3").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_3").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_3").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_4").click(function() {
            if ($("#img_question_find_unselected_15x15_4").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_4").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_4").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_4").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_4").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_5").click(function() {
            if ($("#img_question_find_unselected_15x15_5").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_5").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_5").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_5").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_5").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_6").click(function() {
            if ($("#img_question_find_unselected_15x15_6").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_6").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_6").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_6").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_6").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_7").click(function() {
            if ($("#img_question_find_unselected_15x15_7").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_7").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_7").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_7").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_7").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_8").click(function() {
            if ($("#img_question_find_unselected_15x15_8").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_8").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_8").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_8").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_8").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_9").click(function() {
            if ($("#img_question_find_unselected_15x15_9").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_9").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_9").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_9").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_9").text().trim(), ""));
            }
        });
        
        $("#img_question_find_unselected_15x15_10").click(function() {
            if ($("#img_question_find_unselected_15x15_10").attr("src") == "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png") {
                $("#img_question_find_unselected_15x15_10").attr("src", "<%=request.getContextPath()%>/static/images/question_find_selected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val() + $("#content_li_2nd_10").text().trim());
            } else {
                $("#img_question_find_unselected_15x15_10").attr("src", "<%=request.getContextPath()%>/static/images/question_find_unselected_15x15.png");
                $("#input_delete_string").val($("#input_delete_string").val().replace($("#content_li_2nd_10").text().trim(), ""));
            }
        });
        
        $("#div_delete").addClass("cover");
        
        $("#input_delete").click(function() {
            if ($("#input_delete_string").val() != "") {
                $("#div_delete").removeClass("cover");
            }
        });
        
        $("#img_question_remove_close_16x16, #input_no").click(function() {
            $("#div_delete").addClass("cover");
        });
        
        $("#input_yes").click(function() {
            $("#form_delete").submit();
        });
    });
  </script>
</html>