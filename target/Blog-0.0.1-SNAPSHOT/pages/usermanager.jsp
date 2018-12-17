<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@include file="header.jsp" %>
<div class="container">
	<div class="row">
		<div id="loader">
    		<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="lading"></div>
		</div>
	</div>
</div>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Quản lý người dùng 
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li><a href="#">Người dùng</a></li>
        <li class="active">Quản lý người dùng</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Danh sách người dùng</h3>
          <div class=" pull-right">
            <a id="btn-add"class="btn btn-primary" href="javascript:;"><i class="fa fa-user-plus" aria-hidden="true"></i>Thêm mới</a>
          </div>
           <!-- Modal -->
		  <div class="modal fade" id="modal-add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Thêm mới người dùng</h4>
		        </div>
		        <div class="modal-body">
					<form  method="post" id="frm-add" enctype="multipart/form-data">
					<input type="hidden" class="form-control" name="action" id="action" value="add"/>
					
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Họ và tên</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control"  name="fullname" id="fullname" placeholder="Họ và tên"/>
							<p id="err_fullname" class="error"></p>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Email</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control"  name="email" id="email" placeholder="Email"/>
							<p id="err_email" class="error"></p>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Số điện thoại</label> 
						<div class="col-sm-10">
							<input type="number" class="form-control"  name="phone" id="phone" placeholder="Số điện thoại"/>
							<p id="err_phone" class="error"></p>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Nhóm</label> 
						<div class="col-sm-10">
							<select class="form-control" id="group-id" name="group-id">
								<option value="0">User</option>
								<option value="1">Admin</option>
							</select>
							<p id="err_group" class="error"></p>
						</div>
					</div>
					<label style="padding: 0" for="inputEmail3" class="col-sm-2 form-control-label">Avatar</label> 
					<div id="file-upload-form"
							class="uploader row">
							<input id="file-upload" type="file" name="avata" accept="image/*" />
							<label for="file-upload" id="file-drag"> <img
								id="file-image" src="#" alt="Preview" class="hidden">
								<div id="start">
									<i class="fa fa-picture-o" aria-hidden="true"></i>
									<div>Select a file or drag here</div>
									<div id="notimage" class="hidden">Please select an image</div>
									<span id="file-upload-btn" class="btn btn-primary">Select
										a file</span>
								</div>
								<div id="response" class="hidden">
									<div id="messages"></div>
									<progress class="progress" id="file-progress" value="0">
										<span>0</span>%
									</progress>
								</div>
							</label>
						</div>
					<p id="err_image" class="error"></p>
			        <div class="modal-footer">
			          <button  type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
			          <button type="submit" id="themmoi" class="btn btn-primary">Thêm mới</button>
			        </div>
		 		</form>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal -->
		  </div>
        </div>
        <div class="box-body">
          <table id="tableuser" class="table table-striped table-responsive table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Ảnh đại diện</th>
						<th>Họ và tên</th>
						<th>Email</th>
						<th>Số ĐT</th>
						<th>Nhóm</th>
						<th>Trạng thái</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
		</table>
		<!-- Modal edit -->
		  <div class="modal fade" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Chỉnh sửa người dùng</h4>
		        </div>
		        <div class="modal-body">
					<form  method="post" id="frm-edit" enctype="multipart/form-data">
					<input type="hidden" class="form-control" name="action" id="action" value="edit"/>
					<input type="hidden" class="form-control" name="id" id="id" value=""/>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Họ và tên</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control"  name="fullname" id="fullname-edit" placeholder="Họ và tên"/>
							<p id="err_fullname_edit" class="error"></p>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Email</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control"  name="email" id="email-edit" placeholder="Email"/>
							<p id="err_email_edit" class="error"></p>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Số điện thoại</label> 
						<div class="col-sm-10">
							<input type="number" class="form-control"  name="phone" id="phone-edit" placeholder="Số điện thoại"/>
							<p id="err_phone_edit" class="error"></p>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Nhóm</label> 
						<div class="col-sm-10">
							<select class="form-control" id="group-id-edit" name="groupId">
								<option value="0">User</option>
								<option value="1">Admin</option>
							</select>
							<p id="err_group" class="error"></p>
						</div>
					</div>
					<label style="padding: 0" for="inputEmail3" class="col-sm-2 form-control-label">Avatar</label> 
					<div id="file-upload-form1"
							class="uploader row">
							<input id="file-upload1" type="file" name="avatar" accept="image/*" />
							<label for="file-upload1" id="file-drag1"> 
							<img width="100%" height="100%" id="file-image1" class="image" src="" alt="Preview">
								<div id="start1">
									<div id="notimage1" class="hidden"></div>
									<span id="file-upload-btn1" class="btn btn-primary">Change file</span>
								</div>
								<div id="response1" class="hidden">
									<div id="messages1"></div>
									<progress class="progress" id="file-progress1" value="0">
										<span>0</span>%
									</progress>
								</div>
							</label>
						</div>
					<p id="err_image1" class="error"></p>
			        <div class="modal-footer">
			          <button  type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
			          <button type="submit" id="themmoi" class="btn btn-primary">Cập nhật</button>
			        </div>
		 		</form>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal edit -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <i>Cập nhật ngày 28 tháng 04 năm 2018</i>
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<%@include file="footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		var ctx = "${pageContext.request.contextPath}";
  		var table = $("#tableuser").dataTable( {
  	        "bProcessing": true,
  	        "bServerSide": true,
  	        "sort": "position",
  	     	" bSortable": true,
  	        //bStateSave variable you can use to save state on client cookies: set value "true" 
  	        "bStateSave": false,
  	        //Default: Page display length
  	        "iDisplayLength": 10,
  	        //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
  	        "iDisplayStart": 0,
  	        "fnDrawCallback": function () {
  	            //Get page numer on client. Please note: number start from 0 So
  	            //for the first page you will see 0 second page 1 third page 2...
  	            //Un-comment below alert to see page number
  	        	//alert("Current page number: "+this.fnPagingInfo().iPage);    
  	        },         
  	        "sAjaxSource": ctx+"/listuser",
  	      	"columnDefs" : [ {
				"className" : "text-center",
				"targets" : 0
			},{
				"className" : "text-center",
				"targets" : 5
			},{
				"className" : "text-center",
				"targets" : 2
			},{
				"className" : "text-center",
				"targets" : 3
			},{
				"className" : "text-center",
				"targets" : 4,
				"bSortable": true,
			}],
  	        "aoColumns": [
  	            { "data": "id" },
  	          	{ "data": "avatar",render: function(data,type,row){
  	          	return ' <img style="border-radius:0%;" width="50px" height="50px" src="http://localhost:8080/Blog/displayimage/'+row.id+'"  alt="avatar"/>'
	            } },
  	            { "data": "fullname" },
  	            { "data": "email" },
  	         	{ "data": "phone" },
  	            { "data": "groupId",render: function(data,type,row){
  	            	if(data==0){
  	            		return "User";
  	            	}else if(data==1){
  	            		return "Admin";
  	            	}
  	            } },
  	          	{ "data": "status",render: function(data,type,row){
	            	if(data==0){
	            		return "Deactive";
	            	}else if(data==1){
	            		return "Active";
	            	}
	            } },
  	         	{ "data": "action",
  	            	render: function (data, type, row) {
  	                    return ' <a class="btn btn-primary btn-sm btn-edit" href="javascript:;" id="'+row.id+'"  title="Sửa"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <spring:message code="edit"></spring:message></a> <a id="'+row.id+'" class="btn btn-danger btn-sm btn-delete " href="javascript:;" title="Xóa" ><i id="deleteUnit" class="fa fa-trash-o" aria-hidden="true"></i> <spring:message code="delete"></spring:message></a>';
  	            }},  
  	        ]
  	    });
  		//show modal add
  		$("#btn-add").on('click',function(){
  			resetError();
  			resetImageUpload();
  			$("#modal-add").modal('show');
  		});
  		//add-submit form
  		$("#frm-add").on('submit',function(e){
  			  e.preventDefault();
  			  var oMyForm = new FormData();
  			  var file = document.getElementById('file-upload');
  			  oMyForm.append("file", file.files[0]);
  			  $.ajax({
  			    url: ctx+'/upload',
  			    data: oMyForm,
  			    dataType: 'text',
  			    processData: false,
  			    contentType: false,
  			    type: 'POST',
  			  	beforeSend: function(){
                  $("#loader").show();
              	},
              	complete: function(){
            	  $("#loader").hide();
              	},
  			    success: function(data){
  			      if(data=="uploaded"){
  			    	$("#err_image").html("");
  			    	 var form= $('#frm-add');
  	  	             var formData= form.serialize();
	 	              $.ajax({
	 	                type:'POST',
	 	                url:  ctx+"/user", 
	 	              	dataType : 'json',
	 	                data:formData,	
	 	               	success:function(response){
	 	               		if(response.status=="SUCCESS"){
	 	               			$("#modal-add").modal('hide');
  	               				$("#frm-add")[0].reset();
  	               				$('#tableuser').DataTable().ajax.reload();
  	               				toastr.success("Thêm mới thành công !");
	 	               		}else{
	 	               			resetError();
		 	               		for(var i = 0; i < response.result.length;i++){
		               				if(response.result[i].field=="fullname"){
		               					var err_fullname = response.result[i].codes[3];
		               					$("#err_fullname").html(err_fullname);
		               				}
		               				
		               				if(response.result[i].field=="email"){
	               						var err_email = response.result[i].codes[3];
	               						$("#err_email").html(err_email);
	               					}
		               				if(response.result[i].field=="phone"){
	           							var err_phone = response.result[i].codes[3];
	           							$("#err_phone").html(err_phone);
	           						}
		               				if(response.result[i].field=="groupId"){
	           							var err_group = response.result[i].codes[3];
	           							$("#err_group").html(err_group);
	           						}
		               			}
	 	               		}
	 	                },
	 	                error: function (xhr, ajaxOptions, thrownError)
	 	                {
							toastr.error(thrownError);
	 	                }
	 	              });
  			      }
  			    },
  	             error: function (xhr, ajaxOptions, thrownError)
  	              {
						$("#err_image").html("Ảnh đại diện không được để trống!");
						 var form= $('#frm-add');
	  	  	             var formData= form.serialize();
		 	              $.ajax({
		 	                type:'POST',
		 	                url:  ctx+"/add", 
		 	              	dataType : 'json',
		 	                data:formData,	
		 	               	success:function(response){
		 	               		if(response.status!="SUCCESS"){
		 	               			resetError();
			 	               		for(var i = 0; i < response.result.length;i++){
			               				if(response.result[i].field=="fullname"){
			               					var err_fullname = response.result[i].codes[3];
			               					$("#err_fullname").html(err_fullname);
			               				}
			               				if(response.result[i].field=="email"){
		               						var err_email = response.result[i].codes[3];
		               						$("#err_email").html(err_email);
		               					}
			               				if(response.result[i].field=="phone"){
		           							var err_phone = response.result[i].codes[3];
		           							$("#err_phone").html(err_phone);
		           						}
			               				if(response.result[i].field=="groupId"){
		           							var err_group = response.result[i].codes[3];
		           							$("#err_group").html(err_group);
		           						}
			               			
		 	               			}
		 	               		}
		 	                },
		 	                error: function (xhr, ajaxOptions, thrownError)
		 	                {
								toastr.error(thrownError);
		 	                }
		 	              });
						
  	              }
  			  });
  		});
  		//edit
  		$("#tableuser").on('click','.btn-edit',function(){
  			resetError1();
  			$('#modal-edit').modal('show');
  			$("#id").val($(this).attr('id'));
  			var avata = $(this).parent().parent().find('td:eq(1)>img').attr("src");
  			$(".image").attr('src',avata);
  			var fullname = $(this).parent().parent().find('td:eq(2)').html();
  			$("#fullname-edit").val(fullname);
  			var email = $(this).parent().parent().find('td:eq(3)').html();
  			$("#email-edit").val(email);
  			var phone = $(this).parent().parent().find('td:eq(4)').html();
  			$("#phone-edit").val(phone);
  			var phone = $(this).parent().parent().find('td:eq(4)').html();
  			var groupid = $(this).parent().parent().find('td:eq(5)').html();
  			$("#group-id-edit option").each(function(){
  			  if($(this).text() == groupid)
  			    $(this).attr("selected","selected");
  			});
  			$("#frm-edit").on('submit',function(e){
  				
    			  e.preventDefault();
    			  var oMyForm = new FormData();
    			  var file = document.getElementById('file-upload1');
    			  oMyForm.append("file", file.files[0]);
    			  $.ajax({
    			    url: ctx+'/upload',
    			    data: oMyForm,
    			    dataType: 'text',
    			    processData: false,
    			    contentType: false, 
    			    cache: false,
    			    type: 'POST',
    			    beforeSend: function(){
		                  $("#loader").show();
		            },
		              complete: function(){
		            	  $("#loader").hide();
		              },
    			    success: function(data){
    			      if(data=="uploaded"){
    			    	$("#err_image1").html("");
    			    	 var form= $('#frm-edit');
    	  	             var formData= form.serialize();
  	 	              $.ajax({
  	 	                type:'POST',
  	 	                url:  ctx+"/user", 
  	 	              	dataType : 'json',
  	 	                data:formData,	
  	 	               	success:function(response){
  	 	               		if(response.status=="SUCCESS"){
  	 	               			$("#modal-edit").modal('hide');
    	               			$("#frm-edit")[0].reset();
    	               			toastr.success("Cập nhật thành công !");
    	               			$('#tableuser').DataTable().ajax.reload();
  	 	               		}else{
  	 	               			resetError1();
  		 	               		for(var i = 0; i < response.result.length;i++){
  		               				if(response.result[i].field=="fullname"){
  		               					var err_fullname = response.result[i].codes[3];
  		               					$("#err_fullname_edit").html(err_fullname);
  		               				}
  		               				
  		               				if(response.result[i].field=="email"){
  	               						var err_email = response.result[i].codes[3];
  	               						$("#err_email_edit").html(err_email);
  	               					}
  		               				if(response.result[i].field=="phone"){
  	           							var err_phone = response.result[i].codes[3];
  	           							$("#err_phone_edit").html(err_phone);
  	           						}
  		               				if(response.result[i].field=="groupId"){
  	           							var err_group = response.result[i].codes[3];
  	           							$("#err_group_edit").html(err_group);
  	           						}
  		               			}
  	 	               		}
  	 	                },
  	 	                error: function (xhr, ajaxOptions, thrownError)
  	 	                {
  							toastr.error(thrownError);
  	 	                }
  	 	              });
    			      }
    			    },
    	             error: function (xhr, ajaxOptions, thrownError)
    	              {
  						$("#err_image1").html("Ảnh đại diện không được để trống!");
  						 var form= $('#frm-add');
  	  	  	             var formData= form.serialize();
  		 	              $.ajax({
  		 	                type:'POST',
  		 	                url:  ctx+"/add", 
  		 	              	dataType : 'json',
  		 	                data:formData,	
  		 	               	success:function(response){
  		 	               		if(response.status!="SUCCESS"){
  		 	               			resetError1();
  			 	               		for(var i = 0; i < response.result.length;i++){
  			               				if(response.result[i].field=="fullname"){
  			               					var err_fullname = response.result[i].codes[3];
  			               					$("#err_fullname_edit").html(err_fullname);
  			               				}
  			               				if(response.result[i].field=="email"){
  		               						var err_email = response.result[i].codes[3];
  		               						$("#err_email_edit").html(err_email);
  		               					}
  			               				if(response.result[i].field=="phone"){
  		           							var err_phone = response.result[i].codes[3];
  		           							$("#err_phone_edit").html(err_phone);
  		           						}
  			               				if(response.result[i].field=="groupId"){
  		           							var err_group = response.result[i].codes[3];
  		           							$("#err_group_edit").html(err_group);
  		           						}
  			               			
  		 	               			}
  		 	               		}
  		 	                },
  		 	                error: function (xhr, ajaxOptions, thrownError)
  		 	                {
  								toastr.error(thrownError);
  		 	                }
  		 	              });
  						
    	              }
    			  });
    		});
  			  
  		});
  	//delete
  		$("#tableuser").on('click','.btn-delete',function(){
  			var code = $(this).attr('id');
  			swal({
  			  title: 'Bạn có chắc chắn xóa ?',
  			  text: "",
  			  type: 'warning',
  			  showCancelButton: true,
  			  confirmButtonText: 'Vâng, xóa nó!',
  			  cancelButtonText: 'Không, đừng xóa !',
  			  confirmButtonClass: 'btn btn-success',
  			  cancelButtonClass: 'btn btn-danger',
  			  buttonsStyling: false,
  			  reverseButtons: true
  			}).then((result) => {
  			  if (result.value) {
  			   /*  swal(
  			      'Deleted!',
  			      'success'
  			    ) */
  			 	 $.ajax({
		              type: "POST",
		              url: ctx+"/user",
		              data:{
		            	  action: 'delete',
		            	  id: code
		              },
		              success: function(res)
		              {
		                if(res.status=="SUCCESS") {
		                  	$('#tableuser').DataTable().ajax.reload();   
		                  	toastr.success('Xóa thành công!');
		                }
		              },
		              error: function (xhr, ajaxOptions, thrownError) {
		                toastr.error(thrownError);
		              }
		        }); 
  			  } else if (result.dismiss === swal.DismissReason.cancel) {
  			    swal(
  			      'Cancelled',
  			      'Your imaginary file is safe :)',
  			      'error'
  			    )
  			  }
  			});
  		});
  		//upload ảnh
  		function ekUpload() {
			function Init() {

				var fileSelect = document
						.getElementById('file-upload'), fileDrag = document
						.getElementById('file-drag'), submitButton = document
						.getElementById('submit-button');

				fileSelect.addEventListener('change',fileSelectHandler, false);

				// Is XHR2 available?
				var xhr = new XMLHttpRequest();
				if (xhr.upload) {
					// File Drop
					fileDrag.addEventListener('dragover',
							fileDragHover, false);
					fileDrag.addEventListener('dragleave',
							fileDragHover, false);
					fileDrag.addEventListener('drop',
							fileSelectHandler, false);
				}
			}

			function fileDragHover(e) {
				var fileDrag = document.getElementById('file-drag');
				e.stopPropagation();
				e.preventDefault();

				fileDrag.className = (e.type === 'dragover' ? 'hover'
						: 'modal-body file-upload');
			}

			function fileSelectHandler(e) {
				// Fetch FileList object
				var files = e.target.files || e.dataTransfer.files;

				// Cancel event and hover styling
				fileDragHover(e);

				// Process all File objects
				for (var i = 0, f; f = files[i]; i++) {
					parseFile(f);
					uploadFile(f);
				}
			}

			// Output
			function output(msg) {
				// Response
				var m = document.getElementById('messages');
				m.innerHTML = msg;
			}

			function parseFile(file) {
				output('<strong>' + encodeURI(file.name)
						+ '</strong>');

				// var fileType = file.type;
				// console.log(fileType);
				var imageName = file.name;

				var isGood = (/\.(?=gif|jpg|png|jpeg)/gi)
						.test(imageName);
				if (isGood) {
					document.getElementById('start').classList
							.add("hidden");
					document.getElementById('response').classList
							.remove("hidden");
					document.getElementById('notimage').classList
							.add("hidden");
					// Thumbnail Preview
					document.getElementById('file-image').classList
							.remove("hidden");
					document.getElementById('file-image').src = URL
							.createObjectURL(file);
				} else {
					document.getElementById('file-image').classList
							.add("hidden");
					document.getElementById('notimage').classList
							.remove("hidden");
					document.getElementById('start').classList
							.remove("hidden");
					document.getElementById('response').classList
							.add("hidden");
					document.getElementById("file-upload-form")
							.reset();
				}
			}

			function setProgressMaxValue(e) {
				var pBar = document.getElementById('file-progress');

				if (e.lengthComputable) {
					pBar.max = e.total;
				}
			}

			function updateFileProgress(e) {
				var pBar = document.getElementById('file-progress');

				if (e.lengthComputable) {
					pBar.value = e.loaded;
				}
			}

			function uploadFile(file) {

				var xhr = new XMLHttpRequest(), fileInput = document
						.getElementById('class-roster-file'), pBar = document
						.getElementById('file-progress'), fileSizeLimit = 1024; // In
																				// MB
				if (xhr.upload) {
					// Check if file is less than x MB
					if (file.size <= fileSizeLimit * 1024 * 1024) {
						// Progress bar
						pBar.style.display = 'inline';
						xhr.upload.addEventListener('loadstart',
								setProgressMaxValue, false);
						xhr.upload.addEventListener('progress',
								updateFileProgress, false);

						// File received / failed
						xhr.onreadystatechange = function(e) {
							if (xhr.readyState == 4) {
								// Everything is good!

								// progress.className = (xhr.status
								// == 200 ? "success" : "failure");
								// document.location.reload(true);
							}
						};

						// Start upload
						xhr.open('POST',
										document
												.getElementById('file-upload-form').action,
										true);
						xhr.setRequestHeader('X-File-Name',
								file.name);
						xhr.setRequestHeader('X-File-Size',
								file.size);
						xhr.setRequestHeader('Content-Type',
								'multipart/form-data');
					} else {
						output('Please upload a smaller file (< '
								+ fileSizeLimit + ' MB).');
					}
				}
			}

			// Check for the various File API support.
			if (window.File && window.FileList && window.FileReader) {
				Init();
			} else {
				document.getElementById('file-drag').style.display = 'none';
			}
		}
		ekUpload();
		ekUpload1();
		
	});
	function ekUpload1() {
		function Init() {

			var fileSelect = document
					.getElementById('file-upload1'), fileDrag = document
					.getElementById('file-drag1'), submitButton = document
					.getElementById('submit-button1');

			fileSelect.addEventListener('change',fileSelectHandler1, false);

			// Is XHR2 available?
			var xhr = new XMLHttpRequest();
			if (xhr.upload) {
				// File Drop
				fileDrag.addEventListener('dragover',
						fileDragHover1, false);
				fileDrag.addEventListener('dragleave',
						fileDragHover1, false);
				fileDrag.addEventListener('drop',
						fileSelectHandler1, false);
			}
		}

		function fileDragHover1(e) {
			var fileDrag = document.getElementById('file-drag1');
			e.stopPropagation();
			e.preventDefault();

			fileDrag.className = (e.type === 'dragover' ? 'hover'
					: 'modal-body file-upload');
		}

		function fileSelectHandler1(e) {
			// Fetch FileList object
			var files = e.target.files || e.dataTransfer.files;

			// Cancel event and hover styling
			fileDragHover1(e);

			// Process all File objects
			for (var i = 0, f; f = files[i]; i++) {
				parseFile1(f);
				uploadFile1(f);
			}
		}

		// Output
		function output1(msg) {
			// Response
			var m = document.getElementById('messages1');
			m.innerHTML = msg;
		}

		function parseFile1(file) {
			output1('<strong>' + encodeURI(file.name)
					+ '</strong>');

			// var fileType = file.type;
			// console.log(fileType);
			var imageName = file.name;

			var isGood = (/\.(?=gif|jpg|png|jpeg)/gi)
					.test(imageName);
			if (isGood) {
				document.getElementById('start1').classList
						.add("hidden");
				document.getElementById('response1').classList
						.remove("hidden");
				document.getElementById('notimage1').classList
						.add("hidden");
				// Thumbnail Preview
				document.getElementById('file-image1').classList
						.remove("hidden");
				document.getElementById('file-image1').src = URL
						.createObjectURL(file);
			} else {
				document.getElementById('file-image1').classList
						.add("hidden");
				document.getElementById('notimage1').classList
						.remove("hidden");
				document.getElementById('start1').classList
						.remove("hidden");
				document.getElementById('response1').classList
						.add("hidden");
				document.getElementById("file-upload-form1")
						.reset();
			}
		}

		function setProgressMaxValue1(e) {
			var pBar = document.getElementById('file-progress1');

			if (e.lengthComputable) {
				pBar.max = e.total;
			}
		}

		function updateFileProgress1(e) {
			var pBar = document.getElementById('file-progress1');

			if (e.lengthComputable) {
				pBar.value = e.loaded;
			}
		}

		function uploadFile1(file) {

			var xhr = new XMLHttpRequest(), fileInput = document
					.getElementById('class-roster-file1'), pBar = document
					.getElementById('file-progress1'), fileSizeLimit = 1024; // In
																			// MB
			if (xhr.upload) {
				// Check if file is less than x MB
				if (file.size <= fileSizeLimit * 1024 * 1024) {
					// Progress bar
					pBar.style.display = 'inline';
					xhr.upload.addEventListener('loadstart',
							setProgressMaxValue1, false);
					xhr.upload.addEventListener('progress',
							updateFileProgress1, false);

					// File received / failed
					xhr.onreadystatechange = function(e) {
						if (xhr.readyState == 4) {
							// Everything is good!

							// progress.className = (xhr.status
							// == 200 ? "success" : "failure");
							// document.location.reload(true);
						}
					};

					// Start upload
					xhr.open('POST',
									document
											.getElementById('file-upload-form1').action,
									true);
					xhr.setRequestHeader('X-File-Name',
							file.name);
					xhr.setRequestHeader('X-File-Size',
							file.size);
					xhr.setRequestHeader('Content-Type',
							'multipart/form-data');
				} else {
					output('Please upload a smaller file (< '
							+ fileSizeLimit + ' MB).');
				}
			}
		}

		// Check for the various File API support.
		if (window.File && window.FileList && window.FileReader) {
			Init();
		} else {
			document.getElementById('file-drag1').style.display = 'none';
		}
	}
	
	 function readURL(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader();

             reader.onload = function (e) {
                 $('#blah').attr('src', e.target.result);
             };

             reader.readAsDataURL(input.files[0]);
         }
     }
	 function resetError(){
		 $("#err_group").html("");
		 $("#err_fullname").html("");
		 $("#err_phone").html("");
		 $("#err_email").html("");
	 }
	 function resetImageUpload(){
		 $("#response").addClass('hidden');
		 $("#start").removeClass('hidden');
		 $("#file-image").addClass("hidden");
	 }
	 function resetError1(){
		 $("#err_group_edit").html("");
		 $("#err_fullname_edit").html("");
		 $("#err_phone_edit").html("");
		 $("#err_email_edit").html(""); 
	 }
</script>