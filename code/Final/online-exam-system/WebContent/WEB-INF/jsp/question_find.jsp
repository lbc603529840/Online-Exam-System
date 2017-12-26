<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Question Find</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/question_find.css" />
  </head>
  <body>
    <div id="div_flash_message" class="div_flash_message">
      <span>Successed!</span>
    </div>
    <input id="input_find" type="text" name="input_find" class="input_find" placeholder="Please input the keyword" />
    <img id="img_question_find_search_15x20" class="img_question_find_search_15x20" alt="question_find_search_15x20.png" src="${pageContext.request.contextPath}/static/images/question_find_search_15x20.png" />
    <div class="div_table">
      <div class="div_title">
        <ul class="ul_title">
          <li class="title_li_1st">
            ID<img id="img_question_find_asc_10x15" class="img_question_find_asc_10x15" alt="question_find_asc_10x15.png" src="${pageContext.request.contextPath}/static/images/question_find_asc_10x15.png" />
          </li>
          <li class="title_li_2nd">
            Description
          </li>
          <li class="title_li_3rd">
            Edit
          </li>
          <li class="title_li_4th">
            <img id="img_question_find_unselected_all_15x15" class="img_question_find_unselected_all_15x15" alt="question_find_unselected_all_15x15.png" src="${pageContext.request.contextPath}/static/images/question_find_unselected_15x15.png" />
          </li>
        </ul>
      </div>
      <div>
        <c:choose>
          <c:when test="${questionList != null}">
            <c:forEach items="${questionList}" var="question" varStatus="counter">
              <div class="div_content">
                  <ul class="ul_content">
                    <li class="content_li_1st">
                      ${counter.count}
                    </li>
                    <li class="content_li_2nd">
                      ${question.getDisplayId()}
                    </li>
                    <li class="content_li_3rd">
                      <a href="${pageContext.request.contextPath}/page/question/detail?questionId=${question.getId()}">
                        ${question.getQuestionName()}
                      </a>
                    </li>
                    <li class="content_li_4th">
                      <a href="${pageContext.request.contextPath}/page/question/readyToEdit?questionId=${question.getId()}">
                        <img id="img_question_find_edit_15x15" class="img_question_find_edit_15x15" alt="question_find_edit_15x15.png" src="${pageContext.request.contextPath}/static/images/question_find_edit_15x15.png" />
                      </a>
                    </li>
                    <li id="content_li_5th" class="content_li_5th">
                      <img class="img_question_find_unselected_15x15" alt="question_find_unselected_15x15.png" src="${pageContext.request.contextPath}/static/images/question_find_unselected_15x15.png" />
                    </li>
                  </ul>
                </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <span>None.</span>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
    <div id="div_pagination" class="div_pagination">
      <img id="img_question_find_page_left_20x15" class="img_question_find_page_left_20x15" alt="question_find_page_left_20x15.png" src="${pageContext.request.contextPath}/static/images/question_find_page_left_20x15.png" />
      <ul id="ul_pagination" class="ul_pagination">
        <li id="pagination_1st" class="pagination_li_1st">&lt;</li>
        <li id="pagination_2nd" class="pagination_li_2nd">${page_current}</li>
        <li id="pagination_3td" class="pagination_li_3td">&gt;</li>
        <li id="pagination_4th" class="pagination_li_4th">…</li>
        <li id="pagination_page_count" class="pagination_li_5th">${page_count}</li>
      </ul>
      <img id="img_question_find_page_right_20x15" class="img_question_find_page_right_20x15" alt="question_find_page_right_20x15.png" src="${pageContext.request.contextPath}/static/images/question_find_page_right_20x15.png" />
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
      <form id="form_delete" action="${pageContext.request.contextPath}/page/question/remove" method="post">
        <input id="input_delete_string" type="hidden" name="remove_records" />
        <img id="img_question_remove_close_16x16" class="img_question_remove_close_16x16" alt="question_remove_close_16x16.png" src="${pageContext.request.contextPath}/static/images/question_remove_close_16x16.png" />
        <span class="span_text">Are you sure delete the selected options?</span>
        <input id="input_yes" class="input_yes" type="button" value="Yes" />
        <input id="input_no" class="input_no" type="button" value="No" />
      </form>
    </div>
    <input id="input_flash_message" type="hidden" value="${flash_message}" />
    <input id="input_order_by" type="hidden" value="${order_by}" />
    <input id="input_page_current" type="hidden" value="${page_current}" />
    <input id="input_record_range" type="hidden" value="${record_range}" />
    <input id="input_search" type="hidden" value="${search}" />
  </body>
  <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/question_find.js.jsp"></script>
</html>