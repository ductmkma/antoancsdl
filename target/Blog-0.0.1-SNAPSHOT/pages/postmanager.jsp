<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
	<b>${sessionScope.edited}</b>
    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Danh sách bài viết</h3>
            <div class=" pull-right">
            <a id="btn-add"class="btn btn-primary" href="<%=request.getContextPath()%>/post/add"><i class="fa fa-user-plus" aria-hidden="true"></i>Thêm mới</a>
          </div>
        </div>
        <div class="box-body">
         	 <table id="tableposts" class="table table-striped table-responsive table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Thumbnail</th>
						<th>Tiêu đề</th>
						<th>Mô tả</th>
						<th>Trạng thái</th>
						<th>Danh mục</th>
						<th>Tác giả</th>
						<th>Lượt xem</th>
						<th>Ngày tạo</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
		</table>
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
		var ctx = "${pageContext.request.contextPath}";
  		var table = $("#tableposts").dataTable( {
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
  	        "sAjaxSource": ctx+"/listposts",
  	      	"columnDefs" : [ {
				"className" : "text-center",
				"targets" : 1
			},{
				"className" : "text-center",
				"targets" : 3
			},
			{
				"className" : "text-center",
				"targets" : 4
			},
			{
				"className" : "text-center",
				"targets" : 5
			},
			{
				"className" : "text-center",
				"targets" : 7
			},
			{
				"className" : "text-center",
				"targets" : 9
			},{
				"className" : "text-center",
				"targets" : 8,
			}],
  	        "aoColumns": [
  	            { "data": "id" },
  	          	{ "data": "thumbnail",render:function(data,type,row){
  	          		return '<img style="border-radius:0%;" width="50px" height="50px" src="http://localhost:8080/Blog/displaythumbnail/'+row.id+'"  alt="thumbnail"/>'
  	          	}},
  	            { "data": "title" },
  	            { "data": "description" },
  	         	{ "data": "status",render:function(data,type,row){
  	         		if(data==0){
  	         			return "Bản nháp";
  	         		}else{
  	         			return "Công khai";
  	         		}
  	         	} },
  	         	{ "data": "categoriesName" },
  	         	{ "data": "username" },
  	         	{ "data": "viewCount" },
  	         	{ "data": "createdAt",render:function(data){
  	         		return moment(data).format("HH:mm DD/MM/YYYY");
  	         	} },
  	         	{ "data": "action",
  	            	render: function (data, type, row) {
  	                    return ' <a class="btn btn-primary btn-sm btn-edit" href="post/edit/'+row.id+'" id="'+row.id+'"  title="Sửa"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <spring:message code="edit"></spring:message></a> <a id="'+row.id+'" class="btn btn-danger btn-sm btn-delete " href="javascript:;" title="Xóa" ><i id="deleteUnit" class="fa fa-trash-o" aria-hidden="true"></i> <spring:message code="delete"></spring:message></a>';
  	            }},  
  	        ]
  	    });
  		$('th').css('text-align','center');
  		$("#tableposts").on("click",'.btn-delete',function(){
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
		              url: ctx+"/post/delete",
		              data:{
		            	  action: 'delete',
		            	  id: code
		              },
		              success: function(res)
		              {
		                if(res.status=="SUCCESS") {
		                  	$('#tableposts').DataTable().ajax.reload();   
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