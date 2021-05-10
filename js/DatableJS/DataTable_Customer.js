
(function ($) {
  
    $('.dataTable').DataTable({
        responsive: true,
        info: true,
        stateSave: true,
        select: true,
        "dom": '<"html5buttons"B>lTfgt<"row"<"col-md-6"i><"col-md-6"p>>',
        "buttons": [
            { extend: 'copy', text: '<i class="icon-doc btn-icon-prepend"></i>' , title: 'רשימת לקוחות', className: 'btn ', titleAttr: 'העתק קובץ' },
            { extend: 'excel', text: ' <i class="icon-arrow-down-circle"></i> ', title: 'רשימת לקוחות', className: 'btn btn-fw', titleAttr: 'קובץ Excel להורדה ', charset: 'UTF-8', bom: true, },
            { extend: 'pdf', text: ' <i class="icon-arrow-down-circle"></i>', title: 'רשימת לקוחות', className: 'btn ', titleAttr: 'קובץ PDF להורדה', charset: 'UTF-8', bom: true, key: 'p', },
            {
                extend: 'print', autoPrint: true, title: 'רשימת לקוחות', text: '<i class="icon-printer btn-icon-append"></i>', className: 'btn  ', titleAttr: 'הדפסה',
                messageTop: ' מערכות לניהול מוסך חכם M.G'
            }


        ],
        "language": {
            "decimal": "",
            "emptyTable": "אין מידע זמין",
            "info": "מציג דף _PAGE_ מתוך _PAGES_",
            "infoEmpty": "מראה 0 ל 0 of 0 תוצאות",
            "infoFiltered": "(סונן מ MAX סך התוצאות)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "מציג _MENU_ רשומות לדף אחד",
            "loadingRecords": "טוען...",
            "processing": "מעבד...",
            "search": "חיפוש: ",
            "zeroRecords": "לא נמצאו תוצאות מתאימות",
            "paginate": {
                "first": "ראשון",
                "last": "אחרון",
                "next": "הבא",
                "previous": "הקודם"
            },
            "aria": {
                "sortAscending": ": סידור פריטים מההתחלה לסוף",
                "sortDescending": ": סידור פריטים מהסוף להתחלה"
            }

        }

    });

    
   
    var table = $('#example').DataTable();
    $('.dataTable  ').on('click', 'td:not( :last-child)', function () {
        var data = table.row($(this).parents('tr')).data();
        var id = data[1];
        var FullName = data[2];
        var pageUrl = 'Shwo_All_Customer.aspx/Get_CarInfo';
        var parmters = { 'id': id }
        $.ajax({
            type: 'POST',
            url: pageUrl,
            data: JSON.stringify(parmters),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                //console.log(data.d);
                onSuccess(data, FullName);
                $("#modalCart").modal('show');
                
            },
            error: function (data, success, error) {
                alert("Eroor : " + error);
            }
            
        });
      
        return false;
        
    });
    function onSuccess(data, name) {
        $('#Licenace').val(data.d['0']);
        $('#Manufacthre').val(data.d['1']);
        $('#Model').val(data.d['2']);
        $('#misgeret').val(data.d['3']);
        $('#ModelYear').val(data.d['4']);
        $('#tokef_test').val(data.d['5']);
        $('#Gimor').val(data.d['6']);
        $('#Balot').val(data.d['7']);
        $('#carImage').attr("src", data.d['8']);
        $('#ModelKinuy').val(data.d['9']);
        $('#merkav').val(data.d['10']);
        $('#nefah_manoa').val(data.d['11']);
        $('#delek_nm').val(data.d['12']);
        $('#name').text(name);
        if (data === 'null') {
            $("#modalPush").modal('show');
        }
          
    }
    
})(jQuery);