<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@include file="header.jsp" %>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Quản lý bài viết
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li><a href="#">Quản lý bài viết</a></li>
        <li class="active">Quản lý bài viết</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Thêm mới bài viết</h3>
        </div>
       <div class="box-body container">
						<div class="row">
							<form:form modelAttribute="posts" action="add" method="post" enctype="multipart/form-data">
								<div class="col-md-8">
									<div class="col-md-12">
										<label>Tiêu đề</label>
										<form:input path="userId" value="${sessionScope.userId}" type="hidden" placeholder="Enter title" name="userId" id="userId" class="form-control input-group" title=""/>
										<form:input path="title" type="text" placeholder="Enter title" name="title" id="title" class="form-control input-group" title=""/>
										<form:errors path="title" cssClass="error"></form:errors>
										<br>
									</div>
									<div class="col-md-12">
										<label>Permalink</label>
										<form:input path="slug" type="text" placeholder="" readonly="true" name="slug" id="slug" class="form-control input-group" title=""/>
										<form:errors path="slug" cssClass="error"></form:errors>
										<br>
									</div>
									<div class="col-md-12">
										<label>Mô tả</label>
										<form:textarea path="description"  class="form-control" id="description" name="description" rows="4" cols="80"></form:textarea>
										<form:errors path="description" cssClass="error"></form:errors>
									</div>
									<div class="col-md-12">
										<label>Nội dung</label>
										<form:textarea path="content"  class="form-control" id="content" name="content" rows="90" cols="80"></form:textarea>
										<form:errors path="content" cssClass="error"></form:errors>
									</div>
								</div>
								<div class="col-md-3">
									<label></label>
									<div class="panel-group">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a style="color:white" data-toggle="collapse" href="#collapse1"><i class="fa fa-location-arrow" aria-hidden="true"></i>
													Publish</a>
												</h4>
											</div>
											<div id="collapse1" class="panel-collapse collapse in">
												<div class="panel-body form-group">
													<i class="fa fa-check-square-o" aria-hidden="true"></i><b>&nbsp&nbspStatus</b>
													<form:select path="status" name="status" class="form-control">
														<form:option value="1">Public</form:option>
														<form:option value="0">Draft</form:option>
													</form:select><br>
													<button style="margin-left: 75px" type="submit" class="btn btn-primary" ><i class="fa fa-rocket" aria-hidden="true"></i> Publish</button>
												</div>
											</div>
										</div>
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h4 class="panel-title">
													<i class="fa fa-list-ul" aria-hidden="true"></i><a style="color:white" data-toggle="collapse" href="#collapse2">
													Categories</a>
												</h4>
											</div>
											<div id="collapse2" class="panel-collapse collapse in">
												<div class="panel-body form-group">
													<ul class="nav nav-tabs">
														<li class="active"><a data-toggle="tab" href="#allcate">All categories</a></li>
														<li><a data-toggle="tab" href="#mostused">Most used</a></li>
													</ul>

													<div class="tab-content">
														<div id="allcate" class="tab-pane fade in active">
															<div class="form-check">
															 <c:forEach items="${listCate}" var="cate">
															 	<label>
																	<form:radiobutton path="categoriesId" checked="true" value="${cate.id}"  name="categoriesId"></form:radiobutton><span class="label-text"><c:out value="${cate.name}"></c:out> </span>
																</label>
																<br>
															 </c:forEach>
																
															</div>
														</div>
														<div id="mostused" class="tab-pane fade">
															<div class="form-check">
																 <c:forEach items="${listUsed}" var="cate">
															 	<label>
																	<form:radiobutton path="categoriesId" value="${cate.id}" name="categoriesId"></form:radiobutton> <span class="label-text"><c:out value="${cate.name}"></c:out> </span>	
																</label>
																<br>
															 </c:forEach>
															</div>
														</div>
													</div>
													<a href="<%=request.getContextPath()%>/categories/add"><i class="fa fa-plus" aria-hidden="true"></i> Add new categories</a>
												</div>
											</div>	
										</div>
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h4 class="panel-title">
													<i class="fa fa-tags" aria-hidden="true"></i><a style="color:white" data-toggle="collapse" href="#collapse3">
													Tags</a>
												</h4>
											</div>
											<div id="collapse3" class="panel-collapse collapse in">
												<div class="panel-body form-group">
													<form:input path="tags"  type="text" name="tags" id="tags" class="input"  data-role="tagsinput" value=""/>
													<button type="button" class="btn btn-sm btn-primary">Add</button>
													<form:errors path="tags" cssClass="error"></form:errors>
													
													<br>
													<a href="#">Choose most tags used</a>
												</div>
											</div>	
										</div>
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h4 class="panel-title">
													<i class="fa fa-picture-o" aria-hidden="true"></i><a style="color:white" data-toggle="collapse" href="#collapse4">
													Image</a>
												</h4>
											</div>
											<div id="collapse4" class="panel-collapse collapse in">
												<div class="panel-body form-group">
												  	<div id="file-upload-form" class="uploader row" style="margin-left:25px;">
													 <form:input path="thumbnail" id="file-upload" type="file" name="thumbnail" accept="image/*" /> 
														<label for="file-upload" id="file-drag"> <img id="file-image" src="#" alt="Preview" class="hidden">
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
														<form:errors path="thumbnail" cssClass="error"></form:errors>
													</div>
												</div>
											</div>	
										</div>
									</div>
								</div>
							</form:form>
						</div>
					</div>
        <!-- /.box-body -->
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
		//ckeditor
		CKEDITOR.replace('content',{
			height:600
		});
		//Tạo slug tự động
		$("#title").on('keyup',function(){
			var ctx = "${pageContext.request.contextPath}";
			 var title, slug;
	         //Lấy text từ thẻ input title 
	         title = $("#title").val();

	         //Đổi chữ hoa thành chữ thường
	         slug = title.toLowerCase();

	         //Đổi ký tự có dấu thành không dấu
	         slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
	         slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
	         slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
	         slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
	         slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
	         slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
	         slug = slug.replace(/đ/gi, 'd');
	         //Xóa các ký tự đặt biệt
	         slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
	         //Đổi khoảng trắng thành ký tự gạch ngang
	         slug = slug.replace(/ /gi, "-");
	         //Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
	         //Phòng trường hợp người nhập vào quá nhiều ký tự trắng
	         slug = slug.replace(/\-\-\-\-\-/gi, '-');
	         slug = slug.replace(/\-\-\-\-/gi, '-');
	         slug = slug.replace(/\-\-\-/gi, '-');
	         slug = slug.replace(/\-\-/gi, '-');
	         //Xóa các ký tự gạch ngang ở đầu và cuối
	         slug = '@' + slug + '@';
	         slug = slug.replace(/\@\-|\-\@|\@/gi, '');
	         //In slug ra textbox có id “slug”
	         if(title!=""){
	        	 $("#slug").val(slug+'-'+random());
	         }else{
	        	 $("#slug").val("");
	         }
	         
		});
		function random(){
			var text = "";
			  var possible = "0123456789";
			  for (var i = 0; i < 5; i++){
                text += possible.charAt(Math.floor(Math.random() * possible.length));
			  }
		   return text;
		}
		//upload ảnh
		ekUpload();
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
	});
</script>