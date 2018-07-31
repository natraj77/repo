$(document).ready(function() {
	//$.ajax({
	//	type : 'POST',
	//	url : 'coursesInfo',
	//	data : {
	//		courseType : 'ALL' 
	//	},
	//	mimeType : 'application/json',
	//	success : function(data) {
	//		alert(data.leftPanel);
	//	}
	//});
	
	
	$('#course_filter').jplist({				
		itemsBox: '.list' 
		,itemPath: '.list-item' 
		,panelPath: '.jplist-panel'	
	});
	
});
					
	

function getFormData($form) {
	var unindexed_array = $form.serializeArray();
	var indexed_array = {};
	$.map(unindexed_array, function(n, i) {
		indexed_array[n['name']] = n['value'];
	});
   return indexed_array;
}


