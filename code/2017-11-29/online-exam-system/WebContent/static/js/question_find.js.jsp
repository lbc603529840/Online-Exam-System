$(function() {
    var flashMessage = $("#input_flash_message").val();
    var orderBy = $("#input_order_by").val();
    var pageCurrent = $("#input_page_current").val();
    var recordRange = $("#input_record_range").val();
    var search = $("#input_search").val();
    
    if (orderBy == "ASC") {
        $("#img_question_find_asc_10x15").attr("src", "${pageContext.request.contextPath}/static/images/question_find_asc_10x15.png");    
    } else {
        $("#img_question_find_asc_10x15").attr("src", "${pageContext.request.contextPath}/static/images/question_find_desc_10x15.png");
    }
    
    $("#img_question_find_asc_10x15").click(function() {
        if (orderBy == "ASC") {
            orderBy = "DESC";
            window.location.href = "${pageContext.request.contextPath}/page/question/find?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        } else {
            orderBy = "ASC";
            window.location.href = "${pageContext.request.contextPath}/page/question/find?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        }
    });
    
    $("#pagination_1st").click(function() {
        var isPrev = true;
    
        if ($("#pagination_2nd").text() <= 1) {
            isPrev = false;
        } 
        
        if (isPrev) {
            $("#pagination_2nd").text(parseInt($("#pagination_2nd").text()) - 1);
            pageCurrent = $("#pagination_2nd").text();
            window.location.href = "${pageContext.request.contextPath}/page/question/find?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        } else {
            alert("It's already the first page!");
        }
    });

    $("#pagination_3td").click(function() {
        var isNext = true;
        
        if ($("#pagination_2nd").text() >= $("#pagination_page_count").text()) {
            isNext = false;
        } 
        
        if (isNext) {
            $("#pagination_2nd").text(parseInt($("#pagination_2nd").text()) + 1);
            pageCurrent = $("#pagination_2nd").text();
            window.location.href = "${pageContext.request.contextPath}/page/question/find?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
        } else {
            alert("It's already the last page!");
        }
    });
    
    $("#img_question_find_page_left_20x15").click(function() {
        $("#pagination_2nd").text(1);
        pageCurrent = $("#pagination_2nd").text();
        window.location.href = "${pageContext.request.contextPath}/page/question/find?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
    });
    
    $("#img_question_find_page_right_20x15").click(function() {
        $("#pagination_2nd").text($("#pagination_page_count").text());
        pageCurrent = $("#pagination_2nd").text();
        window.location.href = "${pageContext.request.contextPath}/page/question/find?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
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

            window.location.href = "${pageContext.request.contextPath}/page/question/find?orderBy=" + orderBy + "&pageCurrent=" + pageCurrent + "&recordRange=" + recordRange + "&search=" + search;
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
        window.location.href = "${pageContext.request.contextPath}/page/question/find?orderBy=" + orderBy + "&recordRange=" + recordRange + "&search=" + search;
    });
    
    $("#img_question_find_search_15x20").click(function() {
        search = $("#input_find").val();
        window.location.href = "${pageContext.request.contextPath}/page/question/find?search=" + search;
    });
    
    $("#img_question_find_unselected_all_15x15").click(function() {
        if ($("#img_question_find_unselected_all_15x15").attr("src") == "${pageContext.request.contextPath}/static/images/question_find_unselected_15x15.png") {
            $("#img_question_find_unselected_all_15x15").attr("src", "${pageContext.request.contextPath}/static/images/question_find_selected_15x15.png");
            $(".img_question_find_unselected_15x15").attr("src", "${pageContext.request.contextPath}/static/images/question_find_selected_15x15.png");
            $("#input_delete_string").val("");
            $("#input_delete_string").val($(".content_li_2nd").text());
            $("#input_delete_string").val($("#input_delete_string").val().replace(/\s/g, ""));
        } else {
            $("#img_question_find_unselected_all_15x15").attr("src", "${pageContext.request.contextPath}/static/images/question_find_unselected_15x15.png");
            $(".img_question_find_unselected_15x15").attr("src", "${pageContext.request.contextPath}/static/images/question_find_unselected_15x15.png");
            $("#input_delete_string").val("");
        }
    });
    
    $(".img_question_find_unselected_15x15").click(function() {
        if ($(this).attr("src") == "${pageContext.request.contextPath}/static/images/question_find_unselected_15x15.png") {
            $(this).attr("src", "${pageContext.request.contextPath}/static/images/question_find_selected_15x15.png");
            $("#input_delete_string").val($("#input_delete_string").val() + $(this).parent().prev().prev().prev().text().trim());
        } else {
            $(this).attr("src", "${pageContext.request.contextPath}/static/images/question_find_unselected_15x15.png");
            $("#img_question_find_unselected_all_15x15").attr("src", "${pageContext.request.contextPath}/static/images/question_find_unselected_15x15.png");
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