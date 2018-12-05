<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Quản lý thẻ
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li><a href="#">Quản lý bài viết</a></li>
        <li class="active">Quản lý thẻ</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Danh sách thẻ</h3>
            <div class=" pull-right">
            <a id="btn-add"class="btn btn-primary" href="javascript:;"><i class="fa fa-user-plus" aria-hidden="true"></i>Thêm mới</a>
          </div>
        </div>
        <div class="box-body">
         	 <table id="tabletags" class="table table-striped table-responsive table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên danh mục</th>
						<th>Slug</th>
						<th>SL sử dụng</th>
						<th>Ngày tạo</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
		</table>
        </div>
        <!-- Modal -->
		  <div class="modal fade" id="modal-add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Add new tags</h4>
		        </div>
		        <div class="modal-body">
					<form  method="post" id="frm-add" enctype="multipart/form-data">
					<input type="hidden" class="form-control" name="action" id="action" value="add"/>
					
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Tags Name</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control"  name="name" id="name" placeholder="Tags Name"/>
							<p id="err_tagsname" class="error"></p>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 form-control-label">Slug tags</label> 
						<div class="col-sm-10">
							<input type="text" readonly="readonly" class="form-control"  name="slug" id="slug" placeholder=""/>
						</div>
					</div>
			        <div class="modal-footer">
			          <button  type="button" class="btn btn-default" data-dismiss="modal">Cancle</button>
			          <button type="submit" id="themmoi" class="btn btn-primary">Add Tags</button>
			        </div>
		 		</form>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal -->
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
		var ctx = "${pageContext.request.contextPath}";
  		var table = $("#tabletags").dataTable( {
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
  	        "sAjaxSource": ctx+"/listtags",
  	      	"columnDefs" : [ {
				"className" : "text-center",
				"targets" : 0
			},{
				"className" : "text-center",
				"targets" : 5
				//render: $.fn.dataTable.render.moment( 'DD-MM-YYYY' )
			},{
				"className" : "text-center",
				"targets" : 4,
				"bSortable": true,
			}],
  	        "aoColumns": [
  	            { "data": "id" },
  	          	{ "data": "name"},
  	            { "data": "slug" },
  	            { "data": "count" },
  	         	{ "data": "createdAt", },
  	         	{ "data": "action",
  	            	render: function (data, type, row) {
  	                    return ' <a class="btn btn-primary btn-sm btn-edit" href="javascript:;" id="'+row.id+'"  title="Sửa"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sửa</a> <a id="'+row.id+'" class="btn btn-danger btn-sm btn-delete " href="javascript:;" title="Xóa" ><i id="deleteUnit" class="fa fa-trash-o" aria-hidden="true"></i> Xóa</a>';
  	            }},  
  	        ]
  	    });
  		$('th').css('text-align','center');
  		$("#btn-add").on('click',function(){
  			$("#modal-add").modal('show');
  		});
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
	     
	        	 $("#slug").val(slug);
	       
		});
  		//add tags
  		$("#frm-add").on('submit',function(e){
  			  e.preventDefault();
  			 	var form= $('#frm-add');
	             var formData= form.serialize();
	              $.ajax({
	                type:'POST',
	                url:  ctx+"/tag", 
	              	dataType : 'json',
	                data:formData,	
	               	success:function(response){
	               		if(response.status=="SUCCESS"){
	               				debugger;
		               			$("#modal-add").modal('hide');
		               			$('#tabletags').DataTable().ajax.reload();   
			                  	toastr.success('Thêm mới thành công!');
	               			}else{
               					var err_tagsname = response.result[0].codes[3];
               					$("#err_tagsname").html(err_tagsname);
               				}
	               		
	                },
	               	 error: function (xhr, ajaxOptions, thrownError)
	                {
						toastr.error(thrownError);
	                }
	              });
  		});
  		//edit tags
  		
  		//delete tags
  		$("#tabletags").on("click",'.btn-delete',function(){
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
		              url: ctx+"/tag",
		              data:{
		            	  action: 'delete',
		            	  id: code
		              },
		              success: function(res)
		              {
		                if(res.status=="SUCCESS") {
		                  	$('#tabletags').DataTable().ajax.reload();   
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
	});
</script>