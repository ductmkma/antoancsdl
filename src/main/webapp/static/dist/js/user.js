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
  	          	return ' <img style="border-radius:0%;" width="50px" height="50px" src="'+data+'"  alt="avatar"/>'
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
  			    success: function(data){
  			      if(data=="uploaded"){
  			    	$("#err_image").html("");
  			    	 var form= $('#frm-add');
  	  	             var formData= form.serialize();
	 	              $.ajax({
	 	                type:'POST',
	 	                url:  ctx+"/add", 
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
  			var address = $(this).parent().parent().find('td:eq(4)').html();
  			$("#edit_address").val(address);
  			$("#frm-edit").on("submit",function(e){
  				e.preventDefault();
  				 var form= $('#frm-edit');
 	              var formData= form.serialize();
 	              $.ajax({
 	                type:'POST',
 	                url:  ctx+"/list", 
 	              	dataType : 'json',
 	                data:formData,	
 	               	success:function(response){
 	               		if(response.status == "SUCCESS"){
 	               			$("#modal_edit").modal('hide');
 	               			$('#tableuser').DataTable().ajax.reload();
 	               			toastr.success("Cập nhật thành công !");
 	               		}else{
 	               			console.log(response);
 	               			for(var i = 0; i < response.result.length;i++){
 	               				if(response.result[i].field=="name"){
 	               					var err_name = response.result[i].codes[3];
 	               					$("#err_edit_name").html(err_name);
 	               				}
 	               				if(response.result[i].field=="birthday"){
	               					var err_birthday = response.result[i].codes[3];
	               					$("#err_edit_birthday").html(err_birthday);
	               				}
 	               				if(response.result[i].field=="address"){
               						var err_add = response.result[i].codes[3];
               						$("#err_edit_add").html(err_add);
               					}
 	               				if(response.result[i].field=="gender"){
               						var err_gender = response.result[i].codes[3];
               						$("#err_edit_gender").html(err_birthday);
               					}
 	               			}
  	               		
	  	               	}
 	               		
 	                },
 	                error: function (xhr, ajaxOptions, thrownError)
 	                {
						toastr.error(thrownError);
 	                }
 	              });
  				
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