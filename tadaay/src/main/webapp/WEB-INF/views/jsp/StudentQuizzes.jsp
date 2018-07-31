<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/studentquizzes.js" type="text/javascript"></script> 
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
            <div class="ibox-title">
              <h5>Manage Quizzes</h5>
             <div class="ibox-tools">
             <button type="button" id="addBtn"
					class="btn bg-teal-400 btn-labeled bg-add" onclick="proceedForQuiz();">
					<b><i class="fa fa-arrow-right" aria-hidden="true"></i></b>Start
				</button>
			</div>
            </div>
            <div class="ibox-content table-responsive">           
			<table id="studentQuizeTable" class="display table table-striped table-bordered table-hover">
			   <thead>
				<tr>
					<th><input name="select_all" value="1"
						id="example-select-all" type="checkbox"
						onclick="selectAllRows();" /></th>
					<th><span>Quiz Name</span></th>
					<th><span>Assigned By</span></th>
					<th><span>Assigned Date</span></th>
					<th><span>Start Date</span></th>
					<th><span>End Date</span></th>
					<th><span>Status</span></th>
					<th><span>Result</span></th>
					<th><span>Score</span></th>
					<th><span>Quiz Identifier</span></th>
					<th><span></span></th>
				</tr>
			</thead>
			</table>
            </div>
          </div>
        </div>
      </div>
    </div>
	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
</body>
</html>

