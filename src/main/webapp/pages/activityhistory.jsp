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
        Lịch sử truy cập CSDL
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li class="active"><a href="#">Lịch sử truy cập </a></li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Danh sách lịch sử truy cập</h3>
            
        </div>
        <div class="box-body">
         	 <table style="width:100%" id="tabletags" class="table table-striped table-responsive table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Địa chỉ IP</th>
						<th >Người dùng</th>
						<th>Phương thức </th>
						<th>Database</th>
						<th >Link</th>
						<th >Trình duyệt</th>
						<th>Hệ điều hành</th>
						<th>Máy kết nối</th>
						<th>Host</th>
						<th>Account User DB </th>
						<th>Thời gian truy cập</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
		</table>
        </div>

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
  	        "sAjaxSource": ctx+"/listactivitylogs",
  	      	"columnDefs" : [ {
				"className" : "text-center",
				"targets" : 0
			},{
				"className" : "text-center",
				"targets" : 1
			},
			{
				"className" : "text-center",
				"targets" : 2
			},
			{
				"className" : "text-center",
				"targets" : 3
			},
			{
				"className" : "text-center",
				"targets" : 4
			},
			{
				"className" : "text-center",
				"targets" : 6
			},
			{
				"className" : "text-center",
				"targets" : 7
			},
			{
				"className" : "text-center",
				"targets" : 8
			},
			{
				"className" : "text-center",
				"targets" : 3,
				"bSortable": true,
			}],
  	        "aoColumns": [
  	            { "data": "id" },
  	          	{ "data": "ipaddress"},
  	          	{ "data": "username",
  	            	render: function (data, type, row) {
  	                    if(data=="Không xác định"||data=="null"){
  	                    	return "<p style='color:red'>Không xác định</p>"
  	                    }else{
  	                    	return data;
  	                    }
  	            }},
  	            { "data": "method",
  	            	render: function (data, type, row) {
  	                    if(data=="POST"){
  	                    	return "<span class='dt-method' style='background-color: #659be0;'>"+data+"</span>"
  	                    }else if(data=="GET"){
  	                    	return "<span class='dt-method' style='background-color: orange;'>"+data+"</span>"
  	                    }
  	            } },
  	            { "data": "databaseName" },
  	          { "data": "link", render: function (data, type, row) {
            		if(data.length < 20){
            			return "<a href='"+data+"'>"+data+"</a>"
            		}else {
            			var a = data;
            			a = a.substring(0, 21)+"...";
            			return "<a href='"+data+"'>"+a+"</a>"
            		}
                    
            } },
  	          	{ "data": "browser"},
  	          	{ "data": "os",
  	            	render: function (data, type, row) {
  	                    if(data=='Mac'){
  	                    	return "<i class='fa fa-apple'>&nbsp;<span>"+data+"</span></i>"
  	                    }else if(data=="Windows"){
  	                    	return "<i class='fa fa-windows'>&nbsp;<span>"+data+"</span></i>"
  	                    }else if(data=="Unix"){
  	                    	return "<i class='fa fa-linux'>&nbsp;<span>"+data+"</span></i>"
  	                    }else if(data=="Iphone"){
  	                    	return "<i class='fa fa-mobile'>&nbsp;<span>"+data+"</span></i>"
  	                    }else if(data=="Android"){
  	                    	return "<i class='fa fa-android'>&nbsp;<span>"+data+"</span></i>"
  	                    }
  	            } },
  	          	{ "data": "machineConnect" },
  	          	
  	          	
  	         	 { "data": "hostName" },
  	         	{ "data": "account" },
  	         	{ "data": "createdAt","render": function (data) {
  	         	        var date = new Date(data);
  	         	        var month = date.getMonth() + 1;
  	         	        return date.getHours() +":"+date.getMinutes()+":"+date.getSeconds() + " | " +date.getDate() +"-" +(month >=10 ? month : "0" + month) + "-" + date.getFullYear();
  	         	    }	 },
  	         	 
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
  		$("#name-edit").on('keyup',function(){
			 var title, slug;
	         //Lấy text từ thẻ input title 
	         title = $("#name-edit").val();
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
	     
	        	 $("#slug-edit").val(slug);
	       
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
  		$("#tabletags").on('click','.btn-edit',function(){
  			$('#modal-edit').modal('show');
  			$("#id-edit").val($(this).attr('id'));
  			var tagname = $(this).parent().parent().find('td:eq(1)').html();
  			$("#name-edit").val(tagname);
  			var slug = $(this).parent().parent().find('td:eq(2)').html();
  			$("#slug-edit").val(slug);
  			$("#frm-edit").on('submit',function(e){
    			  e.preventDefault();
    			  var form= $('#frm-edit');
 	              var formData= form.serialize();
    			  $.ajax({
    			    url: ctx+'/tag',
    			    data: formData,
    			    dataType: 'json',
    			    type: 'POST',
    			    beforeSend: function(){
		                  $("#loader").show();
		              },
		              complete: function(){
		            	  $("#loader").hide();
		              },
    			    success: function(response){
    			    	debugger;
    			    	if(response.status=="SUCCESS"){
	               			$("#modal-edit").modal('hide');
	               			$('#tabletags').DataTable().ajax.reload();   
		                  	toastr.success('Cập nhật thành công!');
               			}else{
           					var err_tagsname = response.result[0].codes[3];
           					$("#err_tagsname").html(err_tagsname);
           				}
    			    },
    	             error: function (xhr, ajaxOptions, thrownError)
    	              {
    	            	 
    	              }
    			  });
    		});
  			  
  		});
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
		              beforeSend: function(){
		                  $("#loader").show();
		              },
		              complete: function(){
		            	  $("#loader").hide();
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