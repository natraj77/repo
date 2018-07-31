//Load plan details for the user.
$(document).ready(function() {
	console.log('Loading the plans here...');
	var table = $('#plansDataTable').DataTable({
		"bProcessing" : true,
		"bServerSide" : true,
		"sAjaxSource" : "../showPlans",
		"sPaginationType" : "full_numbers",
		"bJQueryUI" : true,
		"lengthMenu" : [ [ 5, 10, 25, 50, -1 ], [ 5, 10, 25, 50, "All" ] ],
		"aoColumns" : [

		{
			"mDataProp" : "planName"
		}, {
			"mDataProp" : "subscriptionDate"
		}, {
			"mDataProp" : "expiredDate"
		}, {
			"mDataProp" : "isExpired"
		}, {
			"mDataProp" : "id"
		}

		],
		"columnDefs" : [ {
			"targets" : [ 4 ],
			"visible" : false,
			"searchable" : false
		}, ],
		"initComplete" : function(settings, json) {
		}
	});
});
