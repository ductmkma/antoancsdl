<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Zent Group | Blog - Admin</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="shortcut icon" type="image/x-icon" href="https://www.esportsinlasvegas.com/wp-content/uploads/2017/01/blog-icon.png"/>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<c:url value="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" />">
  <!-- Datatable -->
  <link rel="stylesheet" href="<c:url value='/static/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css'/>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value="/static/bower_components/font-awesome/css/font-awesome.min.css"/>">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<c:url value="/static/bower_components/Ionicons/css/ionicons.min.css"/>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value="/static/dist/css/AdminLTE.min.css" />">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<c:url value="/static/dist/css/skins/_all-skins.min.css"/>">
  <!-- Morris chart -->
  <link rel="stylesheet" href="<c:url value="/static/bower_components/morris.js/morris.css"/>">
  <!-- jvectormap -->
  <link rel="stylesheet" href="<c:url value="/static/bower_components/jvectormap/jquery-jvectormap.css"/>">
  <!-- Date Picker -->
  <link rel="stylesheet" href="<c:url value="/static/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"/>">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<c:url value="/static/bower_components/bootstrap-daterangepicker/daterangepicker.css"/>">
  <!-- toastr css -->
  <link rel="stylesheet" href="<c:url value='/static/dist/css/toastr.min.css'/>">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="<c:url value="/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/static/bower_components/bootstrap-input-tags/bootstrap-tagsinput.css"/>">
  <link rel="stylesheet" href="<c:url value="/static/bower_components/bootstrap-input-tags/bootstrap-tagsinput-typeahead.css"/>">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style type="text/css">
#loader {
    bottom: 0;
    height: 175px;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: -300px;
    width: 175px;
    z-index:1000000000;
    display: none;
}
#loader .dot {
    bottom: 0;
    height: 100%;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: 0;
    width: 87.5px;
}
#loader .dot::before {
    border-radius: 100%;
    content: "";
    height: 87.5px;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    transform: scale(0);
    width: 87.5px;
}
#loader .dot:nth-child(7n+1) {
    transform: rotate(45deg);
}
#loader .dot:nth-child(7n+1)::before {
    animation: 0.8s linear 0.1s normal none infinite running load;
    background: #00ff80 none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+2) {
    transform: rotate(90deg);
}
#loader .dot:nth-child(7n+2)::before {
    animation: 0.8s linear 0.2s normal none infinite running load;
    background: #00ffea none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+3) {
    transform: rotate(135deg);
}
#loader .dot:nth-child(7n+3)::before {
    animation: 0.8s linear 0.3s normal none infinite running load;
    background: #00aaff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+4) {
    transform: rotate(180deg);
}
#loader .dot:nth-child(7n+4)::before {
    animation: 0.8s linear 0.4s normal none infinite running load;
    background: #0040ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+5) {
    transform: rotate(225deg);
}
#loader .dot:nth-child(7n+5)::before {
    animation: 0.8s linear 0.5s normal none infinite running load;
    background: #2a00ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+6) {
    transform: rotate(270deg);
}
#loader .dot:nth-child(7n+6)::before {
    animation: 0.8s linear 0.6s normal none infinite running load;
    background: #9500ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+7) {
    transform: rotate(315deg);
}
#loader .dot:nth-child(7n+7)::before {
    animation: 0.8s linear 0.7s normal none infinite running load;
    background: magenta none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+8) {
    transform: rotate(360deg);
}
#loader .dot:nth-child(7n+8)::before {
    animation: 0.8s linear 0.8s normal none infinite running load;
    background: #ff0095 none repeat scroll 0 0;
}
#loader .lading {
    background-image: url("../images/loading.gif");
    background-position: 50% 50%;
    background-repeat: no-repeat;
    bottom: -40px;
    height: 20px;
    left: 0;
    position: absolute;
    right: 0;
    width: 180px;
}
@keyframes load {
100% {
    opacity: 0;
    transform: scale(1);
}
}
@keyframes load {
100% {
    opacity: 0;
    transform: scale(1);
}
}

.swal2-cancel{
	margin-right: 20px;
}
.error{
	color:red;
}
.uploader {
  display: block;
  clear: both;
  margin: 0 100px;
  width: 100%;
  max-width: 200px;
}
#file-upload-form{
	padding-left: 0px;
}
.uploader label {
  float: left;
  clear: both;
  padding: 2rem 1.5rem;
  text-align: center;
  background: #fff;
  border-radius: 7px;
  border: 3px solid #eee;
  -webkit-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.uploader label:hover {
  border-color: #454cad;
}
.uploader label.hover {
  border: 3px solid #454cad;
  box-shadow: inset 0 0 0 6px #eee;
}
.uploader label.hover #start i.fa {
  -webkit-transform: scale(0.8);
          transform: scale(0.8);
  opacity: 0.3;
}
.uploader #start {
  float: left;
  clear: both;
  width: 100%;
}
.uploader #start.hidden {
  display: none;
}
.uploader #start i.fa {
  font-size: 50px;
  margin-bottom: 1rem;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}
.uploader #response {
  float: left;
  clear: both;
  width: 100%;
}
.uploader #response.hidden {
  display: none;
}
.uploader #response #messages {
  margin-bottom: .5rem;
}
.uploader #file-image {
  display: inline;
  width: 100%;
  height: 100%;
}
.uploader #file-image.hidden {
  display: none;
}
.uploader #notimage {
  display: block;
  float: left;
  clear: both;
  width: 100%;
}
.uploader #notimage.hidden {
  display: none;
}
.uploader progress,
.uploader .progress {
  display: inline;
  clear: both;
  margin: 0 auto;
  width: 100%;
  max-width: 180px;
  height: 8px;
  border: 0;
  border-radius: 4px;
  background-color: #eee;
  overflow: hidden;
}
.uploader .progress[value]::-webkit-progress-bar {
  border-radius: 4px;
  background-color: #eee;
}
.uploader .progress[value]::-webkit-progress-value {
  background: -webkit-linear-gradient(left, #393f90 0%, #454cad 50%);
  background: linear-gradient(to right, #393f90 0%, #454cad 50%);
  border-radius: 4px;
}
.uploader .progress[value]::-moz-progress-bar {
  background: linear-gradient(to right, #393f90 0%, #454cad 50%);
  border-radius: 4px;
}
.uploader input[type="file"] {
  display: none;
}
.uploader div {
  margin: 0 0 .5rem 0;
  color: #5f6982;
}
.uploader #file-upload-btn {
  display: inline-block;
  margin: .5rem .5rem 1rem .5rem;
  clear: both;
  font-family: inherit;
  font-weight: 700;
  font-size: 14px;
  text-decoration: none;
  text-transform: initial;
  border: none;
  border-radius: .2rem;
  outline: none;
  padding: 0 1rem;
  height: 36px;
  line-height: 36px;
  color: #fff;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  box-sizing: border-box;
  background: #454cad;
  border-color: #454cad;
  cursor: pointer;
}
/* ngắt */
#file-upload-form1{
	padding-left: 0px;
}
.uploader label {
  float: left;
  clear: both;
  padding: 2rem 1.5rem;
  text-align: center;
  background: #fff;
  border-radius: 7px;
  border: 3px solid #eee;
  -webkit-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.uploader label:hover {
  border-color: #454cad;
}
.uploader label.hover {
  border: 3px solid #454cad;
  box-shadow: inset 0 0 0 6px #eee;
}
.uploader label.hover #start1 i.fa {
  -webkit-transform: scale(0.8);
          transform: scale(0.8);
  opacity: 0.3;
}
.uploader #start1 {
  float: left;
  clear: both;
  width: 100%;
}
.uploader #start1.hidden {
  display: none;
}
.uploader #start1 i.fa {
  font-size: 50px;
  margin-bottom: 1rem;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}
.uploader #response1 {
  float: left;
  clear: both;
  width: 100%;
}
.uploader #response1.hidden {
  display: none;
}
.uploader #response1 #messages1 {
  margin-bottom: .5rem;
}
.uploader #file-image1 {
  display: inline;
  width: 100%;
  height: 100%;
}
.uploader #file-image1.hidden {
  display: none;
}
.uploader #notimage1 {
  display: block;
  float: left;
  clear: both;
  width: 100%;
}
.uploader #notimage1.hidden {
  display: none;
}
.uploader progress,
.uploader .progress {
  display: inline;
  clear: both;
  margin: 0 auto;
  width: 100%;
  max-width: 180px;
  height: 8px;
  border: 0;
  border-radius: 4px;
  background-color: #eee;
  overflow: hidden;
}
.uploader .progress[value]::-webkit-progress-bar {
  border-radius: 4px;
  background-color: #eee;
}
.uploader .progress[value]::-webkit-progress-value {
  background: -webkit-linear-gradient(left, #393f90 0%, #454cad 50%);
  background: linear-gradient(to right, #393f90 0%, #454cad 50%);
  border-radius: 4px;
}
.uploader .progress[value]::-moz-progress-bar {
  background: linear-gradient(to right, #393f90 0%, #454cad 50%);
  border-radius: 4px;
}
.uploader input[type="file"] {
  display: none;
}
.uploader div {
  margin: 0 0 .5rem 0;
  color: #5f6982;
}
.uploader #file-upload-btn1 {
  display: inline-block;
  margin: .5rem .5rem 1rem .5rem;
  clear: both;
  font-family: inherit;
  font-weight: 700;
  font-size: 14px;
  text-decoration: none;
  text-transform: initial;
  border: none;
  border-radius: .2rem;
  outline: none;
  padding: 0 1rem;
  height: 36px;
  line-height: 36px;
  color: #fff;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  box-sizing: border-box;
  background: #454cad;
  border-color: #454cad;
  cursor: pointer;
}

</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b> MD,Corp</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="<c:url value="/static/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="<c:url value="/static/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        AdminLTE Design Team
                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="<c:url value="/static/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Developers
                        <small><i class="fa fa-clock-o"></i> Today</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="<c:url value="/static/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Sales Department
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="<c:url value="/static/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Reviewers
                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                      page and may cause design problems
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-red"></i> 5 new members joined
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> You changed your username
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Create a nice theme
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Some task I need to do
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Make beautiful transitions
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<%=request.getContextPath() %>/displayimage/${sessionScope.userId}" class="user-image" alt="User Image">
              <span class="hidden-xs"><c:out value="${sessionScope.fullname}"></c:out> </span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="<c:url value="/static/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">

                <p>
                  <c:out value="${sessionScope.fullname}"></c:out> - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="<%=request.getContextPath() %>/logout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<%=request.getContextPath() %>/displayimage/${sessionScope.userId}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><c:out value="${sessionScope.fullname}"></c:out></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">BẢNG ĐIỀU KHIỂN</li>
        <li class="active treeview">
          <a href="<%=request.getContextPath()%>/dashboard">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>
        <li class="header">QUẢN LÝ</li>
        <li class='treeview <c:out value="${openMenuManagerPosts}"></c:out>'>
          <a href="#">
            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> <span>QUẢN LÝ BÀI VIẾT</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class='<c:out value="${activeMenuPosts}"></c:out>' ><a href="<%=request.getContextPath()%>/post"><i class="fa fa-file-text" aria-hidden="true"></i> Quản lý bài viết</a></li>
            <li class='<c:out value="${activeMenuCategories}"></c:out>' ><a href="<%=request.getContextPath()%>/categories"><i class="fa fa-list-ul" aria-hidden="true"></i> Quản lý danh mục</a></li>
            <li class='<c:out value="${activeMenuTags}"></c:out>' ><a href="<%=request.getContextPath()%>/tag"><i class="fa fa-tags" aria-hidden="true"></i> Quản lý thẻ</a></li>
          </ul>
        </li>
        <li class="header">NGƯỜI DÙNG</li>
        <li class = '<c:out value="${activeMenuUser}"></c:out>'>
          <a href="<%=request.getContextPath()%>/admin">
            <i class="fa fa-users" aria-hidden="true"></i> <span>QUẢN LÝ NGƯỜI DÙNG</span>
          </a>
        </li>
         <li class="header">HỆ THỐNG</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-cogs" aria-hidden="true"></i> <span>QUẢN LÝ HỆ THỐNG</span>
          </a>
        </li>   
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>