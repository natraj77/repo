var invArryData = [];
function validateForm(){
	var fileExist = $('#file-invites').prop('files');
	if(fileExist.length == 0){
		$('#invitesForm').validate({
		    rules: {
		    	firstName: {
		            required: true
		        },
		        lastName: {
		            required: true
		        },
		        mobile: {
		            required: true,
		            number: true,
		            maxlength:10,
		            minlength:10
		        },
		        role: {
		            required: true
		        },
		        email: {
		            required: true,
		            email:true
		        }
		    },
		    messages: {
		    	firstName: {
		            required: "First Name is required"
		        },
		        lastName: {
		            required: "Last Name is required"
		        },
		        mobile: {
		            required: "mobile is required",
		            number: "Please Enter Number only"
		        },
		        role: {
		            required: "Role is required"
		        },
		        email: {
		            required: "email is required",
		            email: "Please enter a valid email"
		        }
		    },
		    submitHandler: function () {
		    	saveUpdateInvites();
		    }
		});
	}
}


$(document).ready(function() {
	var table = $('#invitesDataTable').DataTable({
			"bProcessing" : true,
			"bServerSide" : true,
			"sAjaxSource" : "../invites",
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"lengthMenu" : [ [ 10, 25, 50, -1 ],
					[ 10, 25, 50, "All" ] ],
			"aoColumns" : [
			    {
	                render: function ( data, type, row ) {
	                    return '<input type="checkbox" class="editor-active">';
	                },
	                className: "dt-body-center"
	            },

	            {
					"mDataProp" : "firstName"
				},
				{
					"mDataProp" : "lastName"
				},
				{
					"mDataProp" : "mobile"
				},
				{
					"mDataProp" : "email"
				},
				{
					"mDataProp" : "status"
				},
				{
					"mDataProp" : "invitedDate"
				},
				 {
	                "className": 'text-center',
	                "orderable": false,
	                "data": null,
	                "defaultContent": '<a class="btn btn-primary resendBtn" data-toggle="modal">Resend</a>'
	            },
				 {
				"mDataProp" : "id"
			} ],
			"columnDefs" : [ {
				"targets" : [ 8 ],
				"visible" : false,
				"searchable" : false
			}, ],
			'select': {
	 		      'style': 'multi'
	 		   },
	        "language": {
		    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
		    	        searchPlaceholder: "Search for Something..."
		    	},
			"initComplete" : function(settings, json) {
				$('#loadingSpinner').hide();
			}
		});
    // Grab the datatables input box and alter how it is bound to events
    $("#leadsDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 1 || e.keyCode == 20) {
                    // Call the API search function
                    $('#leadsDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#leadsDataTable').DataTable().search("").draw();
                }
                return;
            });

    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
        rowsSelected.length = 0;
        leadsSelected.length = 0;
        $('input:checkbox').removeAttr('checked');
        $('#editBtn').prop('disabled', true);
        $('#deleteBtn').prop('disabled', true);
    })
    
    $("#leadsDataTable").on('click', 'input.editor-active', function() {
    	 var tr = $(this).closest('tr');
         var row = table.row(tr);
         
         var $this = $(this);
         var isChecked = $(this).prop( 'checked' );
         
         
    	 var rowId = tr.index();
    	 //console.log('selected row Id : ' + rowId);
    	 console.log(row.data());
         if (isChecked) {
        	 rowsSelected.push(rowId); 
        	 leadsSelected.push(row.data().id)
         } else {
        	 var index = rowsSelected.indexOf(rowId);
        	 var leadIndex = leadsSelected.indexOf(row.data().id);
        	 rowsSelected.splice(index, 1);
        	 leadsSelected.splice(leadIndex, 1);
         }
         
         enableDisableButtons();
         
    });
    
    $("#invitesDataTable tbody").on('click', '.resendBtn', function() {
        var table = $('#invitesDataTable').DataTable();
    	var data = table.row($(this).closest('tr').index()).data();
    	$.ajax({
    		type : 'POST',
    		url : '../reSendInviteeEmail',
    		data : {
    			firstName : data.firstName,
    			lastName : data.lastName,
    			email : data.email
    		},
    		success : function(returnData) {
    			alert('Email intiaited sucessfully');
    			$("#myModal").modal('hide');
    		},
    		failure : function() {
    			alert('Error while sending email.')
    		}
    	})
    	
    });
    
    $("#file-invites")
    .fileinput(
    		{
    			uploadUrl : "../convertExcelData",
    			'minFileCount' : '1',
    			'validateInitialCount' : true,
    			'allowedFileExtensions' : [
    					'xls',
    					'xslx' ],
    			'uploadAsync' : true,
    			'elErrorContainer' : '#errorBlock',
    		});
    $("#file-invites").on('fileuploaded',
    		function(event, data, previewId, index) {
    			invArryData = data.response.InvData;
    		});
});

function saveUpdateInvites() {
    var invitePrepObj = '';
    var inviteArray = [];
    invitePrepObj = new prepareInviteData($('#firstName').val(), $('#lastName').val(), $('#mobile').val(), $('#email').val(),'INVITED',$('#role').val());
    inviteArray.push(invitePrepObj);
    var divCount = $("#inviteDiv > div").length;
    for(var i = 1; i<divCount;i++){
    	invitePrepObj = new prepareInviteData($('#copyfirstName'+i).val(),
    			$('#copylastName'+i).val(),
    			$('#copymobile'+i).val(),
    			$('#copyemail'+i).val(),
    			'INVITED',
    			$('#copyrole'+i).val());
    	inviteArray.push(invitePrepObj);
    }
        
    var dataObj = JSON.stringify(inviteArray);

    $.ajax({
        url:'../saveUpdateInvitesData',
        type:'POST',
        mimeType:'application/json',
        data:{data : dataObj},
        success: function (datas) {
        	var list = datas.emailList;
        	if(list.length >0){
        		$("#inviteErrMsg").html('<font size="3" color="red">Email Ids are(' + list+ ')Already Registered.</font>');
        		$("#inviteErrMsg").addClass("warning-notify animated fadeInUp").delay(4000).fadeOut('slow');
        	}
        	var table = $('#invitesDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#invitesDataTable').dataTable().fnDraw();
            var html = $(".after-add-more").html();
            $("#inviteDiv").empty();
            $("#inviteDiv").append(html);
        }
    });
    
    $("#myModal").modal('hide');
}

function prepareInviteData(firstName, lastName, mobile, email, status, role){
	this.firstName = firstName;
	this.lastName = lastName;
	this.mobile = mobile;
	this.email = email;
	this.status = status;
	this.role = role;
}

function importInvites() {
	$("#inviteData").modal("show");
}

function saveExcelInvites() {
	var invitePrepObj = '';
    var inviteArray = [];    
    for(var i = 0; i<invArryData.length;i++){
    	invitePrepObj = new prepareInviteData(invArryData[i].firstName, invArryData[i].lastName, 
    			invArryData[i].mobile, invArryData[i].email, 'INVITED', invArryData[i].role);
    	inviteArray.push(invitePrepObj);
    }
    var dataObj = JSON.stringify(inviteArray);
    console.log('dataObj:'+dataObj);
    $("#loading").show();
    
    $.ajax({
        url:'../saveUpdateInvitesData',
        type:'POST',
        mimeType:'application/json',
        data:{data : dataObj},
        success: function (datas) {
        	var list = datas.emailList;
        	if(list.length >0){
        		$("#inviteErrMsg").html('<font size="3" color="red">Email Ids are(' + list+ ')Already Registered.</font>');
        		$("#inviteErrMsg").addClass("warning-notify animated fadeInUp").delay(4000).fadeOut('slow');
        	}
        	var table = $('#invitesDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#invitesDataTable').dataTable().fnDraw();
            var html = $(".after-add-more").html();
            $("#inviteDiv").empty();
            $("#inviteDiv").append(html);
            $("#loading").hide();
            $("#inviteData").modal("hide");
        }
    });
}