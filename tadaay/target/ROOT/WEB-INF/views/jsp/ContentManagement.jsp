<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Best training institutes for {course_name} training in {city}| Tadaay</title>
    <meta name="description" content="Find trainers for {course_name} - find reviews,new batch info, contact details for {course_name} training and much more.">
     <meta name="keywords" content="aws training,amazon web services training,training institutes, Best {course_name} training institute in {location} ">
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
    <!-- jPList core js and css  -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.core.min.css" rel="stylesheet" type="text/css" />		
		<!-- jPList toggle bundle -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.history-bundle.min.css" rel="stylesheet" type="text/css" />		
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.pagination-bundle.min.css" rel="stylesheet" type="text/css" />		
		<!-- jPList textbox filter control -->
		
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.textbox-filter.min.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
<!--  Include Header  -->
<form id="contentForm">
                	<div >
                	<select id="courseList" name="courseList">
					    <c:forEach items="${templateList}" var="course">
					        <option value="${course.key}">${course.value}</option>
					    </c:forEach>
					</select>
                	</div>
                	<div >
                	<textarea  id="content" maxlength="50000" rows="10" cols="70" name="content" ></textarea>
                	</div>
                	 <div >
                         <input type="button" class="default-full-width-btn" onclick="submitContent();" value="Send"/>
                    </div>
 </form>
 
 <form id="dmnDataUpdate">
                	<div >
                	 Key : <input class="input_field input_field-name" type="text" id="keyname" name="keyname" />
                	</div>
                	<div >
                	 Value : <input class="input_field input_field-name" type="text" id="keyvalue" name="keyvalue" />
                	</div>
                	 <div >
                         <input type="button" class="default-full-width-btn" onclick="submitDmnData();" value="Send Dmn Data"/>
                    </div>
 </form>
           
<%@ include file='/static/footer-include.jsp' %>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
function submitContent(){
	if($("#contentForm textarea#content").val()==''){
		alert('Please fill in the form to proceed');
		return;
	}
	$.ajax({
		type : 'POST',
		url : 'postHTMLContent',
		data : {
			courseId : $("#contentForm select[name=courseList]").val(),
			content : $("#contentForm textarea#content").val()
		},
		mimeType : 'application/json',
		success : function(data) {
			if (data.status == 'SUCCESS') {
				alert('SuccessFull Updated the Data !');
			} else if (data.status == 'FAIL') {
				alert('Problem with Submitting the Data ');
			} 
		}
	});
}
function submitDmnData(){
	if($("#dmnDataUpdate input[name=keyname]").val()=='' && $("#dmnDataUpdate input[name=keyvalue]").val()==''){
		alert('Please fill in the form to proceed');
		return;
	}
	$.ajax({
		type : 'POST',
		url : 'postDmnData',
		data : {
			keyvalue : $("#dmnDataUpdate input[name=keyvalue]").val(),
			keyname : $("#dmnDataUpdate input[name=keyname]").val()
		},
		mimeType : 'application/json',
		success : function(data) {
			if (data.status == 'SUCCESS') {
				alert('SuccessFull Updated the Data !');
			} else if (data.status == 'FAIL') {
				alert('Problem with Submitting the Data ');
			} 
		}
	});
}
</script>
</body>	       
</html>