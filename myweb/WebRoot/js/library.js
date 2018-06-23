$(function () {

    $("#inputFile").change(function() {
        var $container = $("<div class='addImage_container'></div>")
        var $img =  $("<img src='' alt=''>");
        $container.append($img);
        var opations = {
            success: function(responseText) {
                $img.attr("src", responseText);
                $("#addImage_button2").before($container);
            }
        }
        $("#addImage").ajaxSubmit(opations);
    });
    

    $("#addImage_button").click(function () {
        $("#addImage").fadeIn();
    });
    $("#addImage_shutdown").click(function () {
        $(".addImage_container").remove();
        $("#addImage").fadeOut();
    })
});
