var rowsSelected = [];
$(document).ready(function () {
    var table = $('#taskResultsDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        //"sAjaxSource": "../showQuizzes",
        "ajax": '../static/task_list.json',
        "sPaginationType": "full_numbers",
        "bJQueryUI": true,
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "aoColumns": [
            {
                render: function ( data, type, row ) {
                    return '<input type="checkbox" class="editor-active">';
                },
                className: "dt-body-center"
            },
            {"mDataProp": "firstName"},
            {"mDataProp": "lastName"},
            {"mDataProp": "taskName"},
            {"mDataProp": "status"},
            {"mDataProp": "result"},
            {"mDataProp": "assigneddate"},
            {"mDataProp": "startdate"},
            {"mDataProp": "enddate"},
            {"mDataProp": "duration"},
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [6, 7, 8, 9, 10],
                "visible": false,
                "searchable": false,
                'checkboxes': {
   		            'selectRow': true
   		         }
            },
        ],
        'select': {
 		      'style': 'multi'
 		   },
 		  "language": {
    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
    	        searchPlaceholder: "Search for tasks...",
    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#taskResultsDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#quizResultsDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#quizResultsDataTable').DataTable().search("").draw();
                }
                return;
            });
    $("#taskResultsDataTable").on('click', 'input.editor-active', function() {
    	 var tr = $(this).closest('tr');
         var row = table.row(tr);
         
         var $this = $(this);
         var isChecked = $(this).prop( 'checked' );
         
    	 var rowId = tr.index();
    	 //console.log('selected row Id : ' + rowId);
         if (isChecked) {
        	 rowsSelected.push(rowId); 
         } else {
        	 var index = rowsSelected.indexOf(rowId);
        	 rowsSelected.splice(index, 1);
         }
         
         enableDisablecontent();
 		
	});
});
function enableDisablecontent() {
if (rowsSelected.length > 1 || rowsSelected.length == 0) {
	$("#panelContent").hide();
}
if (rowsSelected.length == 1) {
	$("#panelContent").show();
} 
var table = $('#taskResultsDataTable').DataTable();
var data = table.row(rowsSelected[0]).data();
$("#assigneddate").text(data.assigneddate);
$("#startdate").text(data.startdate);
$("#enddate").text(data.enddate);
$("#duration").text(data.duration);
$("#id").val(data.id);

}
