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
        $("form").submit();
    });
});