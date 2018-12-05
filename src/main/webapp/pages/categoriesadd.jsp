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
        Quản lý danh mục
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li><a href="#">Quản lý bài viết</a></li>
        <li class="active">Quản lý danh mục</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Thêm mới danh mục</h3>
        </div>
        <div class="box-body">
         		<form:form modelAttribute="category" action="add"  method="post" id="frm-add" enctype="multipart/form-data">
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Tên danh mục</label> 
						<div class="col-sm-10">
							<form:input path="name" type="text" class="form-control"  name="name" id="name"/>
							<form:errors path="name" cssClass="error"></form:errors>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Slug</label> 
						<div class="col-sm-10">
							<form:input path="slug"  readonly = "true" type="text" class="form-control"  name="slug" id="slug"/>
							<form:errors path="slug" cssClass="error"></form:errors>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Mô tả</label> 
						<div class="col-sm-10">
							<form:input path="description" type="text" class="form-control"  name="description" id="description"/>
							<form:errors path="description" cssClass="error"></form:errors>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Trạng thái</label> 
						<div class="col-sm-10">
							<form:select path="status" class="form-control">
								<form:option value="0">Ẩn</form:option>
								<form:option value="1">Hiện</form:option>
							</form:select>
							<form:errors path="status" cssClass="error"></form:errors>
						</div>
					</div>
					<!-- <label style="padding: 0" for="inputEmail3" class="col-sm-2 form-control-label">Avatar</label> 
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
					<p id="err_image" class="error"></p> -->
			        <div class="modal-footer">
			          <form:button type="submit" id="themmoi" class="btn btn-primary">Thêm mới</form:button>
			        </div>
		 		</form:form>
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
		//Tạo slug tự động
		$("#name").on('keyup',function(){
			 var title, slug;
	         //Lấy text từ thẻ input title 
	         title = $("#name").val();

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
	});
</script>