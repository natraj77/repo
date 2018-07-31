<jsp:include page="Includes.jsp"></jsp:include>
<!-- <script src="../resources/assets/js/support.js" type="text/javascript"></script> -->
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
	<div class="wrapper wrapper-content" >
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title text-center">
                        <h5 style="color:#f8ac59;font-size:25px;">For any query please contact</h5>
                    </div>
                    <div class="ibox-content" style="padding:4% 20%">
					<form id="supportForm" name="supportForm">
	                   <div class="form-group">
	                   		<label>Subject</label>
	                          <input type="text" class="form-control" name="subject" id="subject">
	                      </div>
	                      <div class="form-group">
	                      <label>Message</label>
	                          <textarea class="form-control" rows="10" name="message" name="message"></textarea>
	                      </div>
	                      <div class="text-right">
	                          <button type="submit" class="btn btn-sm btn-primary m-t-n-xs"><strong>Send message</strong></button>
	                      </div>
                  </form>  
                    </div>
                </div>
            </div>

            </div>
  </div>
	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
<script>
	$(document).ready(function () {
$('#supportForm').validate({
    rules: {
    	subject: {
            required: true
        },
        message: {
            required: true
        }
    },
    messages: {
    	subject: {
            required: "Subject is required"
        },
        message: {
            required: "Message is required"
        }
    },
    submitHandler: function () {
        send();
    }
          
       
     
});
});
</script>
</body>
</html>

