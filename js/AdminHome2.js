(function ($) {
    var id = 1;
    var currentElement = "";
    var click = 0;
    $("#btnNew").on('click',function () {
 
        if (click < 4) {
            click++;
            var newnote = $("<div class='sticky green'+ id='sticky" + id + "'><textarea id='text'>פתק חדש</textarea><span class='ui-icon ui-icon-trash'></span><span class='ui-icon ui-icon-check'></span></div>").resizable().draggable({ stack: ".sticky" });
            currentElement = "sticky" + id;
            ; id++;
            $("#contanier").append(newnote);
            var left = $(this).position().left;
            var top = $(this).position().top + 50;
            $(".sticky").each(function () {
                $(this).css({ left: left + "px", top: top + "px", position: "reletive" });
                left += 235;

            });
        }
        
    });

   
    $("#contanier").on("click", ".sticky", function () {
        currentElement = $(this).attr("id");
    });
    $("#contanier").on("click","textarea", function () {

        var maxiumum = getMax(".sticky");
        $(this).parent().css("z-index", (maxiumum + 1));
    });
    $("#contanier").on("click", "span.ui-icon-trash", function () {
        $(this).parent().remove();
        click--;
    });
    $(".box").click(function () {
        if (currentElement != "")
        {
            var color = $(this).attr("class").split(" ")[0];
            $("#" + currentElement).removeClass();
            $("#" + currentElement).addClass("sticky " + color);
        }
    });

})(jQuery);
function getMax(items) {
    var max = 0;
    $(items).each(function () {
        var z = $(this).css("z-index");
        if (z == "auto") {
            z = 1;
        }
        max = Math.max(max, z);

    });
    return max;
}

// Sticky-note

$("#contanier").on("click", "span.ui-icon-check", function () {
    let Mesaage = $('#text').val();
    console.error(Mesaage);
    let currentTXT = 'פתק חדש';
    if (Mesaage != '' && Mesaage != currentTXT) {
        let PageUrl = 'Admin2HomePage.aspx/send_Stickry';
        let parmters = { 'Massage': Mesaage }
        $.ajax({

            type: 'POST',
            url: PageUrl,
            data: JSON.stringify(parmters),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                console.warn('O.K');
            },
            error: function (error) {
                console.error(error);
            }




        });
       

    }
    else { console.log('ISEmpaytString') };
});


   