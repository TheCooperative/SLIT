//Login slide
$(document).ready(function () {

    //On click signup hide login and show registration form
    $("#signup").click(function () {
        $("#first").slideUp("slow", function () {
            $("#second").slideDown("slow");
        });
    });

    //On click signin hide login and show login form
    $("#signin").click(function () {
        $("#second").slideUp("slow", function () {
            $("#first").slideDown("slow");
        });
    });

});

//Module slide
$(document).ready(function () {
    $(".mod_inf").click(function () {
        $(this).next(".mod_desc").slideToggle(300);
    });
});
