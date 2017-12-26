$(function() {
    $("input[type='radio']").click(function() {
        if ($(this).val() == "A") {
            $("#input_a").addClass("correct_option");
            $("#input_b").removeClass("correct_option");
            $("#input_c").removeClass("correct_option");
            $("#input_d").removeClass("correct_option");
        } else if ($(this).val() == "B") {
            $("#input_b").addClass("correct_option");
            $("#input_a").removeClass("correct_option");
            $("#input_c").removeClass("correct_option");
            $("#input_d").removeClass("correct_option");
        } else if ($(this).val() == "C") {
            $("#input_c").addClass("correct_option");
            $("#input_a").removeClass("correct_option");
            $("#input_b").removeClass("correct_option");
            $("#input_d").removeClass("correct_option");
        } else if ($(this).val() == "D") {
            $("#input_d").addClass("correct_option");
            $("#input_a").removeClass("correct_option");
            $("#input_b").removeClass("correct_option");
            $("#input_c").removeClass("correct_option");
        }
    });
    
    $("#input_submit").click(function() {
        var isSubmit = true;
        $(".img_question_create_wrong_20x20").hide();
        $("#span_error").hide();
         
        if ($("#textarea_question_name_content").val() == "") {
            $("#textarea_question_name_content").next().show();
            isSubmit = false;
        }
        
        if ($("#input_a").val() == "") {
            $("#input_a").next().show();
            isSubmit = false;
        }
        
        if ($("#input_b").val() == "") {
            $("#input_b").next().show();
            isSubmit = false;
        }
        
        if ($("#input_c").val() == "") {
            $("#input_c").next().show();
            isSubmit = false;
        }
        
        if ($("#input_d").val() == "") {
            $("#input_d").next().show();
            isSubmit = false;
        }
        
        if ($("input[type='radio']:checked").val() == null) {
            $("#span_error").show();
            isSubmit = false;
        }
        
        if (isSubmit) {
            $("form").submit();
        }
    });
});