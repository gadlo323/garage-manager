
// URLs images
var female_img = "https://visualpharm.com/assets/217/Life%20Cycle-595b40b75ba036ed117d9ef0.svg";
var male_img = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRFKv1Q4Bp45YapPswuj3XC0VNq_-cIXo-Pmg&usqp=CAU";

// On page loaded
$(document).ready(function () {
    // Set the sex image
    set_sex_img();

    // Set the "who" message
    set_who_message();

    // On change sex input
    $("#input_sex").change(function () {
        // Set the sex image
        set_sex_img();
        set_who_message();
    });

    // On change fist name input
    $("#first_name").keyup(function () {
        // Set the "who" message
        set_who_message();

        if (validation_name($("#first_name").val()).code == 0) {
            $("#first_name").attr("class", "form-control is-invalid");
            $("#first_name_feedback").html(validation_name($("#first_name").val()).message);
        } else {
            $("#first_name").attr("class", "form-control");
        }
    });

    // On change last name input
    $("#last_name").keyup(function () {
        // Set the "who" message
        set_who_message();

        if (validation_name($("#last_name").val()).code == 0) {
            $("#last_name").attr("class", "form-control is-invalid");
            $("#last_name_feedback").html(validation_name($("#last_name").val()).message);
        } else {
            $("#last_name").attr("class", "form-control");
        }
    });
});

/**
*   Set image path (Mr. or Ms.)
*/
function set_sex_img() {
    var sex = $("#input_sex").val();
    if (sex == "Registered_Customer") {
        // male
        $("#img_sex").attr("src", male_img);
    } else {
        // female
        $("#img_sex").attr("src", female_img);
    }
}

/**
*   Set "who" message
*/
function set_who_message() {
    var sex = $("#input_sex").val();
    var first_name = $("#first_name").val();
    var last_name = $("#last_name").val();

    if (validation_name(first_name).code == 0 ||
        validation_name(last_name).code == 0) {
        // Informations not completed
        $("#who_message").html("Who are you ?");
    } else {
        // Informations completed
        $("#who_message").html(sex + " " + first_name + " " + last_name);
    }
}

/**
*   Validation function for last name and first name
*/
function validation_name(val) {
    if (val.length < 2) {
        // is not valid : name length
        return { "code": 0, "message": "שם קצר מדי" };
    }
    if (!val.match("^[א-ת]+$")) {
        // is not valid : bad character
        return { "code": 0, "message": "שם בעברית בלבד!" };
    }

    // is valid
    return { "code": 1 };
}

$('#input_sex').on('change', function () {
   
    if (this.value === 'Registered_Customer') {
        $('#More_Info').hide();
        $('#ID').focusout(function () {
            var data = $('#ID').val();
            var parmters = { 'id': data }
            var PageUrl = 'WorkCard.aspx/ClintInfo';
            if (data !== '') {
                //console.log(data);
            $.ajax({
                type: 'POST',
                url: PageUrl,
                data: JSON.stringify(parmters),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data.d !== null) {
                        //console.log(data);
                        $('#More_Info').show();
                        $('#VecID input').prop("readonly", true);
                        $('#VinfoID input').prop("readonly", true);
                     
                        onSuccess(data);
                    }
                    else {
                      
                        $('#ClaintNO').modal('show'); 
                        $('#workCard').trigger("reset");
                    }
                    
                },
                error: function (data, success, error) {
                   
                    alert("Eroor : " + error);
                }

            });

            }


        });
    }
    if (this.value === 'General_Customer') {
        $('#More_Info').show();
        $('#workCard').trigger("reset");
        $('#VecID input').prop("readonly", false);
        $('#VinfoID input').prop("readonly", false);
        $('[id*=CustomID]').prop("readonly", true);

    }
    function onSuccess(data) {
        
        $('#first_name').val(data.d['6']);
        $('#last_name').val(data.d['9']);
        $('#EmailID').val(data.d['12']);
        $('#PhonID').val(data.d['15']);
        $('[id*=CustomID]').val(data.d['0']);

        $("[id*=License_id]").val(data.d['4']);
        $("[id*=Manifcher_id]").val(data.d['31']);
        $("[id*=model_id]").val(data.d['8']);
        $("[id*=Misgeretid]").val(data.d['13']);
        $("[id*=Yearid]").val(data.d['16']);
        $("[id*=Ttestid]").val(data.d['27']);
        $("[id*=Gimorid]").val(data.d['22']);
        $("[id*=Balotid]").val(data.d['25']);
        $("[id*=tozeret_id]").val(data.d['29']);
        $("[id*=degem_id]").val(data.d['20']);
        $("#nafahmanoa").val(data.d['14']);
        $("#delak").val(data.d['26']);
        $("#meshkel").val(data.d['17']);
        $("#carimage").attr('src',data.d['28']);
        
    }
});

//only numbers for ID textbox

$('#ID').bind('keyup blur', function () {

    $(this).val($(this).val().replace(/[A-Za-z א-ת ]/g, ''));
});


//raloed data of car from  database
$('#input_sex').on('change', function () {

    if (this.value === 'Registered_Customer') {
        $('#ID').autocomplete({
            source: function (request, response) {
                let parm = $('#ID').val();
                // alert(parm);
                var pageUrl = 'WorkCard.aspx/AutoCompilteId_card';
                var parmters = { 'parm': parm }
                $.ajax({
                    type: 'POST',
                    url: pageUrl,
                    data: JSON.stringify(parmters),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        //console.log(data.d);


                        response(data.d);


                    },
                    error: function (result) {
                        alert("No Match");
                    }
                });
            }
        });
    }
})

//shwo model after from submit sucsses

$('[id *= workCard]').submit(function () {
    var pageUrl = 'WorkCard.aspx/Submit_RepairJob_Click';
    $.ajax({
        type: "POST",
        url: pageUrl,
        data: form.serialize(), // serializes the form's elements.
        success: function (data) {
            alert(data); // show response from the php script.
            $('#cardopen').modal('show');
        }
    });
    
    return false;
});


//set data
var currentdate = new Date();
var datetime =(currentdate.getMonth() + 1)+ "/"
    + currentdate.getDate() + "/"
    + currentdate.getFullYear() + " "
    + currentdate.getHours() + ":"
    + currentdate.getMinutes() + ":"
    + currentdate.getSeconds();
$('[id*=Data_ID]').val(datetime);

//show after submit new cardWork
function info() {
    Swal.fire(
        'כרטיס עבודה &#128663; ',
        '&#128172; כרטיס עבודה חדש נפתח בהצלחה!'

    )
}