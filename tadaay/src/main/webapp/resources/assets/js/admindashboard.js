
$(document).ready(function () {
    var table = $('#adminStudentsDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
       // "sAjaxSource": "../admin/getCoursesInfo",
        "ajax": '../static/admin_students.json',
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
            {"mDataProp": "mobile"},
            {"mDataProp": "email"},
            {"mDataProp": "status"},
            {"mDataProp": "joineddate"},
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [7],
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
	    	        searchPlaceholder: "Search for Courses...",
	    	        sProcessing: "<img src='../resources/images/datapreloader.gif'>"
	    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });
    
 
	$("#adminStudentsDataTable_filter input").unbind()
	.bind(
			"input",
			function(e) { // Bind our desired behavior
				// If the length is 3 or more characters, or the
				// user pressed ENTER, search
				if (this.value.length >= 3 || e.keyCode == 13) {
					// Call the API search function
					$('#adminStudentsDataTable').DataTable().search(
							this.value).draw();
				}
				// Ensure we clear the search if they backspace
				// far enough
				if (this.value == "") {
					$('#adminStudentsDataTable').DataTable().search(
							"").draw();
				}
				return;
			});
	
});

$(document).ready(function () {
    var table = $('#adminTrainersDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        //"sAjaxSource": "../showQuizzes",
        "ajax": '../static/admin_trainers.json',
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
            {"mDataProp": "mobile"},
            {"mDataProp": "email"},
            {"mDataProp": "status"},
            {"mDataProp": "joineddate"},
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [7],
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
	    	        searchPlaceholder: "Search for Something..."
	    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#adminTrainersDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#adminTrainersDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#adminTrainersDataTable').DataTable().search("").draw();
                }
                return;
            });
    $("#adminTrainersDataTable").on('click', 'input.editor-active', function() {
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

$(document).ready(function () {
    var table = $('#adminInsituteDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        //"sAjaxSource": "../showQuizzes",
        "ajax": '../static/admin_institutes.json',
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
            {"mDataProp": "instName"},
            {"mDataProp": "mobile"},
            {"mDataProp": "email"},
            {"mDataProp": "status"},
            {"mDataProp": "joineddate"},
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [6],
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
	    	        searchPlaceholder: "Search for Something..."
	    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#adminInsituteDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#adminInsituteDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#adminInsituteDataTable').DataTable().search("").draw();
                }
                return;
            });
    $("#adminInsituteDataTable").on('click', 'input.editor-active', function() {
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

$(document).ready(function () {
    var table = $('#adminRecruitersDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        //"sAjaxSource": "../showQuizzes",
        "ajax": '../static/admin_recruiters.json',
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
            {"mDataProp": "mobile"},
            {"mDataProp": "email"},
            {"mDataProp": "status"},
            {"mDataProp": "joineddate"},
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [7],
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
	    	        searchPlaceholder: "Search for Something..."
	    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#adminRecruitersDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#adminRecruitersDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#adminRecruitersDataTable').DataTable().search("").draw();
                }
                return;
            });
    $("#adminRecruitersDataTable").on('click', 'input.editor-active', function() {
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