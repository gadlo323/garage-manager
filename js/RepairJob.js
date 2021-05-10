$(document).ready(function () {
    $('.collapse').collapse(); // Collapse all but the first row on the page.

    // This section makes the search work.
    (function () {
        var searchTerm, panelContainerId;
        $('#accordion_search_bar').on('change keyup', function () {
            searchTerm = $(this).val();
            $('#accordion > .panel').each(function () {
                panelContainerId = '#' + $(this).attr('id');
                // Makes search to be case insesitive 
                $.extend($.expr[':'], {
                    'contains': function (elem, i, match, array) {
                        return (elem.textContent || elem.innerText || '').toLowerCase()
                            .indexOf((match[3] || "").toLowerCase()) >= 0;
                    }
                });

                // END Makes search to be case insesitive

                // Show and Hide Triggers
                $(panelContainerId + ':not(:contains(' + searchTerm + '))').hide(); //Hide the rows that done contain the search query.
                $(panelContainerId + ':contains(' + searchTerm + ')').show(); //Show the rows that do!

            });
        });
    }());


    var cid;
    var id;
    //active popup after click on endjob button
    $('.btn-success').on('click', function () {
        $('#model').modal('show');
         cid = $(this).data('id');
         id = $(this).attr('id');
        $('.btn-primary').on('click', function () {
            $('#model').modal('hide');
            $('#amountModal').modal('show');
           
        })
    })
   
    //active popup after click on amount time  button
    
   
        $("#doneWork").on('click', function () {
            const amountTime = $("input[id*='amountTimework']").val();
            if (amountTime > 0) {
                $('#amountModal').modal('hide');
                closeRepairJob(id,amountTime);
                window.location.href = "BillingCustomer.aspx?cid=" + cid + "&tid=" + id;
                target = "_blank";

            }
         })
       
          
        
      
    


    

    //close repirjob
    function closeRepairJob(teratmentID, amountTime) {
        console.log(teratmentID, amountTime)
        var pageUrl = 'RepairJob.aspx/closeRepiarJob';
        var parmters = { 'teratmentID': teratmentID, amountTime: amountTime }
            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parmters),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                  
                },
                error: function (data, success, error) {
                    alert("Eroor : " + error);
                }

            });

    }

    //delete repierjob from database
    $('.btn-light').on('click', function () {
        var teratmentID = $(this).data('id');
       /// console.log(teratmentID)
        $('#staticBackdrop').modal('show');
        $('#deletejob').on('click', function () {
            var pageUrl = 'RepairJob.aspx/deltetJob';
            var parmters = { 'teratmentID': teratmentID }
            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parmters),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $('#staticBackdrop').modal('hide');
                    location.reload();
                },
                error: function (data, success, error) {
                    alert("Eroor : " + error);
                }

            });

        })
       
    })

});