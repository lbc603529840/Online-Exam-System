$(function() {
    var currentCorrectOption = $("#input_correct_option").val();
    
    if (currentCorrectOption == "A") {
        $("#radio_a").attr("checked", "checked");
        $("#input_a").addClass("correct_option");
        $("#input_b").removeClass("correct_option");
        $("#input_c").removeClass("correct_option");
        $("#input_d").removeClass("correct_option");
    } else if (currentCorrectOption == "B") {
        $("#radio_b").attr("checked", "checked");
        $("#input_b").addClass("correct_option");
        $("#input_a").removeClass("correct_option");
        $("#input_c").removeClass("correct_option");
        $("#input_d").removeClass("correct_option");
    } else if (currentCorrectOption == "C") {
        $("#radio_c").attr("checked", "checked");
        $("#input_c").addClass("correct_option");
        $("#input_a").removeClass("correct_option");
        $("#input_b").removeClass("correct_option");
        $("#input_d").removeClass("correct_option");
    } else if (currentCorrectOption == "D") {
        $("#radio_d").attr("checked", "checked");
        $("#input_d").addClass("correct_option");
        $("#input_a").removeClass("correct_option");
        $("#input_b").removeClass("correct_option");
        $("#input_c").removeClass("correct_option");
    }
});