
(function($) {

    $('.dataTable').DataTable({
        responsive: true,
        info: true,
        stateSave: true,
        select: true,
        
        "dom": '<"html5buttons"B>lTfgt<"row"<"col-md-6"i><"col-md-6"p>>',
        "buttons": [
            { extend: 'copy', text: '<i class="icon-doc btn-icon-prepend"></i>', title: 'היסטוריית טיפולים', className: 'btn ', titleAttr: 'העתק קובץ' },
            { extend: 'excel', text: ' <i class="icon-arrow-down-circle"></i> ', title: 'היסטוריית טיפולים', className: 'btn btn-fw', titleAttr: 'קובץ Excel להורדה ', charset: 'UTF-8', bom: true, },
            { extend: 'pdf', text: ' <i class="icon-arrow-down-circle"></i>', title: 'היסטוריית טיפולים', className: 'btn ', titleAttr: 'קובץ PDF להורדה', charset: 'UTF-8', bom: true, key: 'p', },
            {
                extend: 'print', autoPrint: true, title: 'היסטוריית טיפולים', text: '<i class="icon-printer btn-icon-append"></i>', className: 'btn  ', titleAttr: 'הדפסה',
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

})(jQuery);