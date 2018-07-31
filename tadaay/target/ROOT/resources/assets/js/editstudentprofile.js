var rowsSelected = [];
//Form Validation For Branches Form
$(document).ready(function () {
	console.log('inside this one here');
    $('#editstudentprofile').validate({
        rules: {
        	firstName: {
                required: true
            },
            lastName: {
                required: true
            },
            phone: {
                required: true,
                number:true,
                maxlength:10,
                minlength:10
            },
            email: {
                required: true,
                email:true
            },
            about: {
                required: true
            }
        },
        messages: {
        	firstName: {
                required: "First Name is required"
            },
            lastName: {
                required: "Last Name is required"
            },
            phone: {
                required: "Phone Number is required"
            },
            email: {
                required: "Email is required"
            },
            about: {
                required: "About is required"
            }
        },
        submitHandler: function () {
            saveProfile();
        }
    });
    $('#studentsocial_media').validate({
    	 rules: {
    		 media_fb: {
                 required: true
             },
             media_tw: {
                 required: true,
             },
             media_gplus: {
                 required: true,
             },
             media_in: {
                 required: true
             },
             media_p: {
                 required: true
             },
             media_insta: {
                 required: true
             }
         },
         messages: {
        	 media_fb: {
                 required: "facebook is required"
             },
             media_tw: {
                 required: "Twitter is required"
             },
             media_gplus: {
                 required: "Gplus required"
             },
             media_in: {
                 required: "Linkedin is required"
             },
             media_p: {
                 required: "Pinterest is required"
             },
             media_insta: {
                 required: "Insta is required"
             }
         },
         submitHandler: function () {
             saveProfile();
         }
    });
    $('#change_password').validate({
   	 rules: {
   		password: {
                required: true
            },
            new_password: {
                required: true,
                
            },
            confirm_password: {
                required: true,
                
            }
        },
        messages: {
        	password: {
                required: "Password is required"
            },
            new_password: {
                required: "New Password is required"
            },
            confirm_password: {
                required: "Confirm Password required"
            }
        },
        submitHandler: function () {
            saveProfile();
        }
   });
});
