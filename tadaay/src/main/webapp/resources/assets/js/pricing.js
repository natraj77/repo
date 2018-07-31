$(document).ready(function() {

	$.ajax({
		headers : {
			'Content-Type' : 'application/json'
		},
		type : 'GET',
		url : '../getPlanDetails',
		dataType : 'json',
		mimeType : 'application/json',
		success : function(returnData) {
			console.log(returnData);
			for (i = 0; i < returnData.length; i++) {
				var planType = returnData[i].planName;
				
				$(".planName_" + planType).html(returnData[i].planName);
				if(returnData[i].viewContactLead == "1") {
					$(".viewContactLead_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".viewContactLead_" + planType).html('<i class="fa fa-times"></i>');
				}
				
				if(returnData[i].leadAvailability == "0") {
					$(".leadAvailability_" + planType).html("Real Time");
				} else {
					if (returnData[i].leadAvailability == "-1") {
						$(".leadAvailability_" + planType).html("Never");
					} else {
						$(".leadAvailability_" + planType).html("After " + (returnData[i].leadAvailability/60)/60 + " hours");
					}
					
				}
				
				if(returnData[i].addNewBatches == "1") {
					$(".addNewBatches_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".addNewBatches_" + planType).html('<i class="fa fa-times"></i>');
				}
				
				if(returnData[i].addDemos == "1") {
					$(".addDemos_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".addDemos_" + planType).html('<i class="fa fa-times"></i>');
				}
				
				if(returnData[i].formBatches == "1") {
					$(".formBatches_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".formBatches_" + planType).html('<i class="fa fa-times"></i>');
				}
				
				if(returnData[i].paymentTracking == "1") {
					$(".paymentTracking_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".paymentTracking_" + planType).html('<i class="fa fa-times"></i>');
				}
				
				$(".numberOfEmails_" + planType).html(returnData[i].numberOfEmails);
				$(".numberOfSMS_" + planType).html(returnData[i].numberOfSMS);
				
				if(returnData[i].customRuleEngine == "1") {
					$(".customRuleEngine_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".customRuleEngine_" + planType).html('<i class="fa fa-times"></i>');
				}
				
				if(returnData[i].emailTemplates == "1") {
					$(".emailTemplates_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".emailTemplates_" + planType).html('<i class="fa fa-times"></i>');
				}
				
				if(returnData[i].onlineQuizes == "1") {
					$(".onlineQuizzes_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".onlineQuizzes_" + planType).html('<i class="fa fa-times"></i>');
				}
				
				if(returnData[i].courseCertificate == "1") {
					$(".courseCertificate_" + planType).html('<i class="fa fa-check"></i>');
				} else {
					$(".courseCertificate_" + planType).html('<i class="fa fa-times"></i>');
				}
			}
			
		}
	});
	
	var keywordList = [];
/*	$(document).ready(function () {
	    $.ajax({
	        type: 'GET',
	        url: '../getKeywordCategories',
	        success : function(data) {
	        	console.log(data);
				for (i = 0; i < data.length; i++) {
					keywordList.push(data[i].keyword);
				}
				$("#keywords").autocomplete({
					minLength : 4
				}, {
					source : keywordList
				});
			},
	        failure: function () {
	            console.log('There was an error getting course list');
	        }

	    });
	});*/
	
	
});

$(document).on("click", ".platinum-signup", function () {
    $("#planName").val("Platinum");
});
$(document).on("click", ".gold-signup", function () {
    $("#planName").val("Gold");
});
$(document).on("click", ".silver-signup", function () {
    $("#planName").val("Silver");
});

$(document).on("click", ".savebtn", function () {
	alert('Saving plan');
	
	console.log($("#planName").val());
	console.log($("#keyword").val());
	console.log($("#location").val());
	console.log($("#duration").val());
	
    $.ajax({
        type: 'POST',
        url: '../saveAndStartPlan',
        data : {
        	planName : $("#planName").val(),
			keyword: $("#keyword option:selected").text(),
			location: $("#location option:selected").text(),
			duration: $("#duration option:selected").text()
		},
        success : function(data) {
        	window.location.href = "../trainer/EditProfile";
		},
        failure: function () {
            console.log('There was an error getting course list');
        }
    });

});
