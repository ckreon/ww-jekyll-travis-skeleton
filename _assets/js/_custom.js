$(document).on("hide.bs.dropdown", ".dropdown", function (event) {
    $(event.target).find(">.dropdown-menu:first").slideUp(200);
});

$(document).on("show.bs.dropdown", ".dropdown", function (event) {
    $(event.target).find(">.dropdown-menu:first").slideDown(200);
});