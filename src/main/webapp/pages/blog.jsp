<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Zent Group - Blog</title>
		<!--meta-->
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.2" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="keywords" content="Medic, Medical Center" />
		<meta name="description" content="Responsive Medical Health Template" />
		<!--style-->
		
		<link rel="shortcut icon" type="image/x-icon" href="https://www.esportsinlasvegas.com/wp-content/uploads/2017/01/blog-icon.png"/>
		<link href='//fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>
		<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/reset.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/superfish.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/prettyPhoto.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/jquery.qtip.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/style.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/menu_styles.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/animations.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/responsive.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/style/odometer-theme-default.css"/>">
		<!--<link rel="stylesheet" type="text/css" href="style/dark_skin.css">-->
		<!--<link rel="stylesheet" type="text/css" href="style/high_contrast_skin.css">-->
		<link rel="shortcut icon" href="images/favicon.ico">
	</head>
	<!--<body class="image_1">
	<body class="image_1 overlay">
	<body class="image_2">
	<body class="image_2 overlay">
	<body class="image_3">
	<body class="image_3 overlay">
	<body class="image_4">
	<body class="image_4 overlay">
	<body class="image_5">
	<body class="image_5 overlay">
	<body class="pattern_1">
	<body class="pattern_2">
	<body class="pattern_3">
	<body class="pattern_4">
	<body class="pattern_5">
	<body class="pattern_6">
	<body class="pattern_7">
	<body class="pattern_8">
	<body class="pattern_9">
	<body class="pattern_10">-->
	<body>
		<div class="site_container">
			<!--<div class="header_top_bar_container style_2 clearfix">
			<div class="header_top_bar_container style_2 border clearfix">
			<div class="header_top_bar_container style_3 clearfix">
			<div class="header_top_bar_container style_3 border clearfix">
			<div class="header_top_bar_container style_4 clearfix">
			<div class="header_top_bar_container style_4 border clearfix">
			<div class="header_top_bar_container style_5 clearfix">
			<div class="header_top_bar_container style_5 border clearfix"> -->
			<div class="header_top_bar_container clearfix">
				<div class="header_top_bar">
					<form class="search" action="search.html" method="get">
						<input type="text" name="s" placeholder="Search..." value="Search..." class="search_input hint">
						<input type="submit" class="search_submit" value="">
					</form>
					<!--<ul class="social_icons dark clearfix">
					<ul class="social_icons colors clearfix">-->
					<ul class="social_icons clearfix">
						<li>
							<a target="_blank" href="http://facebook.com/QuanticaLabs" class="social_icon facebook" title="facebook">
								&nbsp;
							</a>
						</li>
						<li>
							<a target="_blank" href="https://twitter.com/QuanticaLabs" class="social_icon twitter" title="twitter">
								&nbsp;
							</a>
						</li>
						<li>
							<a href="mailto:contact@pressroom.com" class="social_icon mail" title="mail">
								&nbsp;
							</a>
						</li>
						<li>
							<a href="http://themeforest.net/user/QuanticaLabs/portfolio" class="social_icon envato" title="envato">
								&nbsp;
							</a>
						</li>
					</ul>
					<div class="latest_news_scrolling_list_container">
						<ul>
							<li class="category">LATEST</li>
							<li class="left"><a href="#"></a></li>
							<li class="right"><a href="#"></a></li>
							<li class="posts">
								<ul class="latest_news_scrolling_list">
									<c:forEach items="${lastestPost }" var="test">
									<li>
										<a href="<%=request.getContextPath() %>/${test.slug}" title="">${test.title}</a>
									</li>
								</c:forEach>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--<div class="header_container small">
			<div class="header_container style_2">
			<div class="header_container style_2 small">
			<div class="header_container style_3">
			<div class="header_container style_3 small">-->
			<div class="header_container">
				<div class="header clearfix">
					<div class="logo">
						<h1><a href="<%=request.getContextPath() %>" title="Pressroom">News and Blog</a></h1>
						<h4>Trang thông tin của Zent Group</h4>
					</div>
					<div class="placeholder">728 x 90</div>
				</div>
			</div>
			<!-- <div class="menu_container style_2 clearfix">
			<div class="menu_container style_3 clearfix">
			<div class="menu_container style_... clearfix">
			<div class="menu_container style_10 clearfix">
			<div class="menu_container sticky clearfix">-->
			<div class="menu_container clearfix">
				<nav>
				<ul class="sf-menu">
					<li class="submenu">
						<a href="#" title="Home">
							Home
						</a>
						<ul>
							<li>
								<a href="home.html" title="Home Style 1">
									Home Style 1
								</a>
							</li>
							<li>
								<a href="home_2.html" title="Home Style 2">
									Home Style 2
								</a>
							</li>
							<li>
								<a href="home_3.html" title="Home Style 3">
									Home Style 3
								</a>
							</li>
							<li>
								<a href="home_4.html" title="Home Style 3">
									Home Style 4
								</a>
							</li>
							<li>
								<a href="home_5.html" title="Home Style 5">
									Home Style 5
								</a>
							</li>
							<li>
								<a href="home_6.html" title="Home Style 6">
									Home Style 6
								</a>
							</li>
							<li>
								<a href="home_7.html" title="Home Style 7">
									Home Style 7
								</a>
							</li>
						</ul>
					</li>
					<li class="submenu">
						<a href="#" title="Pages">
							Pages
						</a>
						<ul>
							<li>
								<a href="about.html" title="About Style 1">
									About Style 1
								</a>
							</li>
							<li>
								<a href="about_2.html" title="About Style 2">
									About Style 2
								</a>
							</li>
							<li>
								<a href="default.html" title="Default">
									Default
								</a>
							</li>
							<li>
								<a href="404.html" title="404 Not Found">
									404 Not Found
								</a>
							</li>
						</ul>
					</li>
					<li class="submenu mega_menu_parent">
						<a href="#" title="Mega Menu">
							Mega Menu
						</a>
						<ul>
							<li class="submenu">
								<a href="blog.html" title="Latest Posts">
									Latest Posts
								</a>
								<ul class="mega_menu blog">
									<li class="post">
										<a href="post.html" title="New Painkiller Rekindles Addiction Concerns">
											<img src="<c:url value="/static/images/samples/330x242/image_08.jpg"/>"alt='img'>
										</a>
										<h5><a href="post.html" title="New Painkiller Rekindles Addiction Concerns">New Painkiller Rekindles Addiction Concerns</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post">
										<a href="post.html" title="High Altitudes May Aid Weight Control">
											<img src='<c:url value="/static/images/samples/330x242/image_11.jpg"/>' alt='img'>
										</a>
										<h5><a href="post.html" title="High Altitudes May Aid Weight Control">High Altitudes May Aid Weight Control</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post">
										<a href="post.html" title="Build on Brotherhood, Club Lives Up to Name">
											<img src='<c:url value="/static/images/samples/330x242/image_06.jpg"/>' alt='img'>
										</a>
										<h5><a href="post.html" title="Build on Brotherhood, Club Lives Up to Name">Build on Brotherhood, Club Lives Up to Name</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="submenu">
								<a href="blog.html" title="Recent Galleries">
									Recent Galleries
								</a>
								<ul class="mega_menu blog">
									<li class="post">
										<a href="post_gallery.html" title="Build on Brotherhood, Club Lives Up to Name">
											<span class="icon gallery"></span>
											<img src='<c:url value="/static/images/samples/330x242/image_03.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_gallery.html" title="Build on Brotherhood, Club Lives Up to Name">Build on Brotherhood, Club Lives Up to Name</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post">
										<a href="post_gallery.html" title="High Altitudes May Aid Weight Control">
											<span class="icon gallery"></span>
											<img src='<c:url value="/static/images/samples/330x242/image_05.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_gallery.html" title="High Altitudes May Aid Weight Control">High Altitudes May Aid Weight Control</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post">
										<a href="post_gallery.html" title="New Painkiller Rekindles Addiction Concerns">
											<span class="icon gallery"></span>
											<img src='<c:url value="/static/images/samples/330x242/image_04.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_gallery.html" title="New Painkiller Rekindles Addiction Concerns">New Painkiller Rekindles Addiction Concerns</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="submenu">
								<a href="blog.html" title="Recent Reviews">
									Recent Reviews
								</a>
								<ul class="mega_menu blog">
									<li class="post">
										<a href="post_review.html" title="New Painkiller Rekindles Addiction Concerns">
											<span class="icon"><span>8.7</span></span>
											<img src='<c:url value="/static/images/samples/330x242/image_07.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_review.html" title="New Painkiller Rekindles Addiction Concerns">New Painkiller Rekindles Addiction Concerns</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post">
										<a href="post_review_2.html" title="High Altitudes May Aid Weight Control">
											<span class="icon"><span>9.5</span></span>
											<img src='<c:url value="/static/images/samples/330x242/image_09.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_review_2.html" title="High Altitudes May Aid Weight Control">High Altitudes May Aid Weight Control</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post">
										<a href="post_review.html" title="Build on Brotherhood, Club Lives Up to Name">
											<span class="icon"><span>7.8</span></span>
											<img src='<c:url value="/static/images/samples/330x242/image_14.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_review.html" title="Build on Brotherhood, Club Lives Up to Name">Build on Brotherhood, Club Lives Up to Name</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post first">
										<a href="post_review.html" title="Nuclear Fusion Closer to Becoming a Reality">
											<span class="icon"><span>8.0</span></span>
											<img src='<c:url value="/static/images/samples/330x242/image_13.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_review.html" title="Nuclear Fusion Closer to Becoming a Reality">Nuclear Fusion Closer to Becoming a Reality</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post first">
										<a href="post_review_2.html" title="The Public Health Crisis Hiding in Our Food">
											<span class="icon"><span>9.1</span></span>
											<img src='<c:url value="/static/images/samples/330x242/image_02.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_review_2.html" title="The Public Health Crisis Hiding in Our Food">The Public Health Crisis Hiding in Our Food</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
									<li class="post first">
										<a href="post_review_2.html" title="Study Linking Illnes and Salt Leaves Researchers Doubtful">
											<span class="icon"><span>6.7</span></span>
											<img src='<c:url value="/static/images/samples/330x242/image_01.jpg"/>' alt='img'>
										</a>
										<h5><a href="post_review_2.html" title="Study Linking Illnes and Salt Leaves Researchers Doubtful">Study Linking Illnes and Salt Leaves Researchers Doubtful</a></h5>
										<ul class="post_details simple">
											<li class="category"><a title="HEALTH" href="category_health.html">HEALTH</a></li>
											<li class="date">
												10:11 PM, Feb 02
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="submenu">
								<a href="blog.html" title="Most Read">
									Most Read
								</a>
								<div class="mega_menu row">
									<div class="column column_1_2">
										<ul class="blog small">
											<li class="post">
												<a href="post.html" title="Study Linking Illnes and Salt Leaves Researchers Doubtful">
													<img src='<c:url value="/static/images/samples/100x100/image_06.jpg"/>' alt='img'>
												</a>
												<div class="post_content">
													<h5>
														<a href="post.html" title="Study Linking Illnes and Salt Leaves Researchers Doubtful">Study Linking Illnes and Salt Leaves Researchers Doubtful</a>
													</h5>
													<ul class="post_details simple">
														<li class="category"><a href="category_health.html" title="HEALTH">HEALTH</a></li>
														<li class="date">
															10:11 PM, Feb 02
														</li>
													</ul>
												</div>
											</li>
											<li class="post">
												<a href="post.html" title="Syrian Civilians Trapped For Months Continue To Be Evacuated">
													<img src='<c:url value="/static/images/samples/100x100/image_12.jpg"/>' alt='img'>
												</a>
												<div class="post_content">
													<h5>
														<a href="post.html" title="Syrian Civilians Trapped For Months Continue To Be Evacuated">Syrian Civilians Trapped For Months Continue To Be Evacuated</a>
													</h5>
													<ul class="post_details simple">
														<li class="category"><a href="category_world.html" title="WORLD">WORLD</a></li>
														<li class="date">
															10:11 PM, Feb 02
														</li>
													</ul>
												</div>
											</li>
											<li class="post">
												<a href="post.html" title="Built on Brotherhood, Club Lives Up to Name">
													<img src='<c:url value="/static/images/samples/100x100/image_02.jpg"/>' alt='img'>
												</a>
												<div class="post_content">
													<h5>
														<a href="post.html" title="Built on Brotherhood, Club Lives Up to Name">Built on Brotherhood, Club Lives Up to Name</a>
													</h5>
													<ul class="post_details simple">
														<li class="category"><a href="category_sports.html" title="SPORTS">SPORTS</a></li>
														<li class="date">
															10:11 PM, Feb 02
														</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
									<div class="column column_1_2">
										<ul class="blog small">
											<li class="post">
												<a href="post.html" title="Study Linking Illnes and Salt Leaves Researchers Doubtful">
													<img src='<c:url value="/static/images/samples/100x100/image_04.jpg"/>' alt='img'>
												</a>
												<div class="post_content">
													<h5>
														<a href="post.html" title="Study Linking Illnes and Salt Leaves Researchers Doubtful">Study Linking Illnes and Salt Leaves Researchers Doubtful</a>
													</h5>
													<ul class="post_details simple">
														<li class="category"><a href="category_health.html" title="HEALTH">HEALTH</a></li>
														<li class="date">
															10:11 PM, Feb 02
														</li>
													</ul>
												</div>
											</li>
											<li class="post">
												<a href="post.html" title="Syrian Civilians Trapped For Months Continue To Be Evacuated">
													<img src='<c:url value="/static/images/samples/100x100/image_10.jpg"/>' alt='img'>
												</a>
												<div class="post_content">
													<h5>
														<a href="post.html" title="Syrian Civilians Trapped For Months Continue To Be Evacuated">Syrian Civilians Trapped For Months Continue To Be Evacuated</a>
													</h5>
													<ul class="post_details simple">
														<li class="category"><a href="category_world.html" title="WORLD">WORLD</a></li>
														<li class="date">
															10:11 PM, Feb 02
														</li>
													</ul>
												</div>
											</li>
											<li class="post">
												<a href="post.html" title="Built on Brotherhood, Club Lives Up to Name">
													<img src='<c:url value="/static/images/samples/100x100/image_07.jpg"/>' alt='img'>
												</a>
												<div class="post_content">
													<h5>
														<a href="post.html" title="Built on Brotherhood, Club Lives Up to Name">Built on Brotherhood, Club Lives Up to Name</a>
													</h5>
													<ul class="post_details simple">
														<li class="category"><a href="category_sports.html" title="SPORTS">SPORTS</a></li>
														<li class="date">
															10:11 PM, Feb 02
														</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</li>
					<li class="submenu">
						<a href="#" title="Post Formats">
							Post
						</a>
						<ul>
							<li>
								<a href="post.html" title="Post Default">
									Post Default
								</a>
							</li>
							<li>
								<a href="post_gallery.html" title="Post Gallery">
									Post Gallery
								</a>
							</li>
							<li>
								<a href="post_small_image.html" title="Post Small Image">
									Post Small Image
								</a>
							</li>
							<li>
								<a href="post_video.html" title="Post Video YouTube">
									Post Video Youtube
								</a>
							</li>
							<li>
								<a href="post_video_2.html" title="Post Video Vimeo">
									Post Video Vimeo
								</a>
							</li>
							<li>
								<a href="post_soundcloud.html" title="Post Soundcloud">
									Post Soundcloud
								</a>
							</li>
							<li>
								<a href="post_review.html" title="Post Review Style 1">
									Post Review Style 1
								</a>
							</li>
							<li>
								<a href="post_review_2.html" title="Post Review Style 2">
									Post Review Style 2
								</a>
							</li>
							<li>
								<a href="post_quote.html" title="Post Quote Style 1">
									Post Quote Style 1
								</a>
							</li>
							<li>
								<a href="post_quote_2.html" title="Post Quote Style 2">
									Post Quote Style 2
								</a>
							</li>
						</ul>
					</li>
					<li class="submenu selected">
						<a href="blog.html" title="Blog">
							Blog
						</a>
						<ul>
							<li>
								<a href="blog_small_slider.html" title="Blog Small Slider">
									Blog Small Slider
								</a>
							</li>
							<li class="submenu selected">
								<a href="#" title="Blog 1 column">
									Blog 1 Column
								</a>
								<ul>
									<li class="selected">
										<a href="blog.html" title="Blog With Right Sidebar">
											Blog With Right Sidebar
										</a>
									</li>
									<li>
										<a href="blog_left_sidebar.html" title="Blog With Left Sidebar">
											Blog With Left Sidebar
										</a>
									</li>
								</ul>
							</li>
							<li class="submenu">
								<a href="#" title="Blog 2 columns">
									Blog 2 Columns
								</a>
								<ul>
									<li>
										<a href="blog_2_columns.html" title="Right Sidebar">
											Right Sidebar
										</a>
									</li>
									<li>
										<a href="blog_2_columns_left_sidebar.html" title="Left Sidebar">
											Left Sidebar
										</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="blog_3_columns.html" title="Blog 3 Columns">
									Blog 3 Columns
								</a>
							</li>
							<li>
								<a href="search.html?s=Maecenas+Mauris" title="Search Page Template">
									Search Page Template
								</a>
							</li>
						</ul>
					</li>
					<li class="submenu">
						<a href="authors.html" title="Authors">
							Authors
						</a>
						<ul>
							<li>
								<a href="authors.html" title="Authors List">
									Authors List
								</a>
							</li>
							<li>
								<a href="author.html" title="Author Single">
									Author Single
								</a>
							</li>
						</ul>
					</li>
					<li class="submenu">
						<a href="#" title="Categories">
							Categories
						</a>
						<ul>
							<li>
								<a href="category_health.html" title="Health">
									Health
								</a>
							</li>
							<li>
								<a href="category_science.html" title="Science">
									Science
								</a>
							</li>
							<li>
								<a href="category_sports.html" title="Sports">
									Sports
								</a>
							</li>
							<li>
								<a href="category_world.html" title="World">
									World
								</a>
							</li>
							<li>
								<a href="category_lifestyle.html" title="Lifestyle">
									Lifestyle
								</a>
							</li>
						</ul>
					</li>
					<li class="submenu">
						<a href="contact.html" title="Contact">
							Contact
						</a>
						<ul class="expand_left_contact">
							<li>
								<a href="contact.html" title="Contact Style 1">
									Contact Style 1
								</a>
							</li>
							<li>
								<a href="contact_2.html" title="Contact Style 2">
									Contact Style 2
								</a>
							</li>
						</ul>
					</li>
				</ul>
				</nav>
				<div class="mobile_menu_container">
					<a href="#" class="mobile-menu-switch">
						<span class="line"></span>
						<span class="line"></span>
						<span class="line"></span>
					</a>
					<div class="mobile-menu-divider"></div>
					<nav>
					<ul class="mobile-menu">
						<li class="submenu">
							<a href="home.html" title="Home">
								Home
							</a>
							<ul>
								<li>
									<a href="home.html" title="Home Style 1">
										Home Style 1
									</a>
								</li>
								<li>
									<a href="home_2.html" title="Home Style 2">
										Home Style 2
									</a>
								</li>
								<li>
									<a href="home_3.html" title="Home Style 3">
										Home Style 3
									</a>
								</li>
								<li>
									<a href="home_4.html" title="Home Style 3">
										Home Style 4
									</a>
								</li>
								<li>
									<a href="home_5.html" title="Home Style 5">
										Home Style 5
									</a>
								</li>
								<li>
									<a href="home_6.html" title="Home Style 6">
										Home Style 6
									</a>
								</li>
								<li>
									<a href="home_7.html" title="Home Style 7">
										Home Style 7
									</a>
								</li>
							</ul>
						</li>
						<li class="submenu">
							<a href="about.html" title="Pages">
								Pages
							</a>
							<ul>
								<li>
									<a href="about.html" title="About Style 1">
										About Style 1
									</a>
								</li>
								<li>
									<a href="about_2.html" title="About Style 2">
										About Style 2
									</a>
								</li>
								<li>
									<a href="default.html" title="Default">
										Default
									</a>
								</li>
								<li>
									<a href="404.html" title="404 Not Found">
										404 Not Found
									</a>
								</li>
							</ul>
						</li>
						<li class="submenu">
							<a href="post.html" title="Post Formats">
								Post Formats
							</a>
							<ul>
								<li>
									<a href="post.html" title="Post Default">
										Post Default
									</a>
								</li>
								<li>
									<a href="post_gallery.html" title="Post Gallery">
										Post Gallery
									</a>
								</li>
								<li>
									<a href="post_small_image.html" title="Post Small Image">
										Post Small Image
									</a>
								</li>
								<li>
									<a href="post_video.html" title="Post Video YouTube">
										Post Video Youtube
									</a>
								</li>
								<li>
									<a href="post_video_2.html" title="Post Video Vimeo">
										Post Video Vimeo
									</a>
								</li>
								<li>
									<a href="post_soundcloud.html" title="Post Soundcloud">
										Post Soundcloud
									</a>
								</li>
								<li>
									<a href="post_review.html" title="Post Review Style 1">
										Post Review Style 1
									</a>
								</li>
								<li>
									<a href="post_review_2.html" title="Post Review Style 2">
										Post Review Style 2
									</a>
								</li>
								<li>
									<a href="post_quote.html" title="Post Quote Style 1">
										Post Quote Style 1
									</a>
								</li>
								<li>
									<a href="post_quote_2.html" title="Post Quote Style 2">
										Post Quote Style 2
									</a>
								</li>
							</ul>
						</li>
						<li class="submenu selected">
							<a href="blog.html" title="Blog">
								Blog
							</a>
							<ul>
								<li>
									<a href="blog_small_slider.html" title="Blog Small Slider">
										Blog Small Slider
									</a>
								</li>
								<li class="submenu selected">
									<a href="blog.html" title="Blog 1 column">
										Blog 1 Column
									</a>
									<ul>
										<li class="selected">
											<a href="blog.html" title="Blog With Right Sidebar">
												Blog With Right Sidebar
											</a>
										</li>
										<li>
											<a href="blog_left_sidebar.html" title="Blog With Left Sidebar">
												Blog With Left Sidebar
											</a>
										</li>
									</ul>
								</li>
								<li class="submenu">
									<a href="blog_2_columns.html" title="Blog 2 columns">
										Blog 2 Columns
									</a>
									<ul>
										<li>
											<a href="blog_2_columns.html" title="Right Sidebar">
												Right Sidebar
											</a>
										</li>
										<li>
											<a href="blog_2_columns_left_sidebar.html" title="Left Sidebar">
												Left Sidebar
											</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="blog_3_columns.html" title="Blog 3 Columns">
										Blog 3 Columns
									</a>
								</li>
								<li>
									<a href="search.html?s=Maecenas+Mauris" title="Search Page Template">
										Search Page Template
									</a>
								</li>
							</ul>
						</li>
						<li class="submenu">
							<a href="authors.html" title="Authors">
								Authors
							</a>
							<ul>
								<li>
									<a href="authors.html" title="Authors List">
										Authors List
									</a>
								</li>
								<li>
									<a href="author.html" title="Author Single">
										Author Single
									</a>
								</li>
							</ul>
						</li>
						<li class="submenu">
							<a href="category_health.html" title="Categories">
								Categories
							</a>
							<ul>
								<li>
									<a href="category_health.html" title="Health">
										Health
									</a>
								</li>
								<li>
									<a href="category_science.html" title="Science">
										Science
									</a>
								</li>
								<li>
									<a href="category_sports.html" title="Sports">
										Sports
									</a>
								</li>
								<li>
									<a href="category_world.html" title="World">
										World
									</a>
								</li>
								<li>
									<a href="category_lifestyle.html" title="Lifestyle">
										Lifestyle
									</a>
								</li>
							</ul>
						</li>
						<li class="submenu">
							<a href="contact.html" title="Contact">
								Contact
							</a>
							<ul class="expand_left_contact">
								<li>
									<a href="contact.html" title="Contact Style 1">
										Contact Style 1
									</a>
								</li>
								<li>
									<a href="contact_2.html" title="Contact Style 2">
										Contact Style 2
									</a>
								</li>
							</ul>
						</li>
					</ul>
					</nav>
				</div>
			</div>			
			<div class="page">
				<div class="page_header clearfix page_margin_top">
					<div class="page_header_left">
						<h1 class="page_title">Blog</h1>
					</div>
					<div class="page_header_right">
						<ul class="bread_crumb">
							<li>
								<a title="Home" href="home.html">
									Home
								</a>
							</li>
							<li class="separator icon_small_arrow right_gray">
								&nbsp;
							</li>
							<li>
								Blog
							</li>
						</ul>
					</div>
				</div>
				<div class="page_layout clearfix">
					<div class="divider_block clearfix">
						<hr class="divider first">
						<hr class="divider subheader_arrow">
						<hr class="divider last">
					</div>
					<div class="row">
						<div class="column column_2_3">
							<div class="row">
								<ul class="blog big">
								<c:forEach items="${listPosts}" var="post">
									<li class="post">
										<a href="<%=request.getContextPath() %>/${post.slug}" title="${post.title}">
											<img src='<%=request.getContextPath()%>/displaythumbnail/${post.id}' alt='img'>
										</a>
										<div class="post_content">
											<h2 class="with_number">
												<a href="${post.slug}" title="${post.title }">${post.title }</a>
												<a class="comments_number" href="#" title="${post.viewCount } views"><i class="fa fa-eye" aria-hidden="true"></i>${post.viewCount }<span class="arrow_comments"></span></a>
											</h2>
											<ul class="post_details">
												<li class="category"><a href="category_world.html" title="WORLD">${post.categoriesName }</a></li>
												<li class="date">
													<fmt:formatDate type = "both"  dateStyle = "short" timeStyle = "short" value = "${post.createdAt}" />
												</li>
											</ul>
											<p>${post.description}</p>
											<a class="read_more" href="<%=request.getContextPath() %>/${post.slug}" title="Read more"><span class="arrow"></span><span>READ MORE</span></a>
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
							<ul class="pagination clearfix page_margin_top_section">
								<li class="left">
									<a href="#" title="">&nbsp;</a>
								</li>
								<c:forEach begin="1" end="${page}" step="1" var="index">
									<li <c:if test="${defaultPage==index}"><%out.print("class='selected'"); %></c:if> <c:if test="${currentPage==index}"><%out.print("class='selected'"); %></c:if> >
										<a href="<%=request.getContextPath()%>?page=${index}" title="">
											${index}
										</a>
									</li>
								</c:forEach>
								
								<li class="right">
									<a href="#" title="">&nbsp;</a>
								</li>
							</ul>
						</div>
						<div class="column column_1_3 page_margin_top">
							<div class="tabs no_scroll clearfix">
								<ul class="tabs_navigation clearfix">
									<li>
										<a href="#sidebar-most-read" title="Most Read">
											Most Read
										</a>
										<span></span>
									</li>
									<li>
										<a href="#sidebar-most-commented" title="Commented">
											Commented
										</a>
										<span></span>
									</li>
								</ul>
								<div id="sidebar-most-read">
									<ul class="blog rating page_margin_top clearfix">
									<c:forEach items="${topView}" var="topView">
										<li class="post">
											<a href="<%=request.getContextPath() %>/${topView.slug}" title="${topView.title}">
												<img src='<%=request.getContextPath() %>/displaythumbnail/${topView.id}' alt='img'>
											</a>
											<div class="post_content">
												<span class="number animated_element" data-value='<c:out value="${topView.viewCount}"></c:out>'></span>
												<h5><a href="<%=request.getContextPath() %>/${topView.slug}" title="${topView.title}">${topView.title}</a></h5>
												<ul class="post_details simple">
													<li class="category"><a href="#" title="<c:out value="${topView.categoriesName}"></c:out>"><c:out value="${topView.categoriesName}"></c:out></a></li>
												</ul>
											</div>
										</li>
										</c:forEach>
									</ul>
									<a class="more page_margin_top" href="#">SHOW MORE</a>
								</div>
								<div id="sidebar-most-commented">
									<ul class="blog rating page_margin_top clearfix">
										<li class="post">
											<a href="post_soundcloud.html" title="Nuclear Fusion Closer to Becoming a Reality">
												<img src='<c:url value="/static/images/samples/510x187/image_02.jpg"/>' alt='img'>
											</a>
											<div class="post_content">
												<span class="number animated_element" data-value="70"></span>
												<h5><a href="post_soundcloud.html" title="New Painkiller Rekindles Addiction Concerns">New Painkiller Rekindles Addiction Concerns</a></h5>
												<ul class="post_details simple">
													<li class="category"><a href="category_health.html" title="HEALTH">HEALTH</a></li>
												</ul>
											</div>
										</li>
										<li class="post">
											<div class="post_content">
												<span class="number animated_element" data-value="62"></span>
												<h5><a href="post.html" title="New Painkiller Rekindles Addiction Concerns">New Painkiller Rekindles Addiction Concerns</a></h5>
												<ul class="post_details simple">
													<li class="category"><a href="category_world.html" title="WORLD">WORLD</a></li>
												</ul>
											</div>
										</li>
										<li class="post">
											<div class="post_content">
												<span class="number animated_element" data-value="30"></span>
												<h5><a href="post_quote_2.html" title="Seeking the Right Chemistry, Drug Makers Hunt for Mergers">Seeking the Right Chemistry, Drug Makers Hunt for Mergers</a></h5>
												<ul class="post_details simple">
													<li class="category"><a href="category_sports.html" title="SPORTS">SPORTS</a></li>
												</ul>
											</div>
										</li>
										<li class="post">
											<div class="post_content">
												<span class="number animated_element" data-value="25"></span>
												<h5><a href="post_small_image.html" title="Study Linking Illnes and Salt Leaves Researchers Doubtful">Study Linking Illnes and Salt Leaves Researchers Doubtful</a></h5>
												<ul class="post_details simple">
													<li class="category"><a href="category_science.html" title="SCIENCE">SCIENCE</a></li>
												</ul>
											</div>
										</li>
										<li class="post">
											<div class="post_content">
												<span class="number animated_element" data-value="4"></span>
												<h5><a href="post_quote.html" title="Syrian Civilians Trapped for Months Continue to be Evacuated">Syrian Civilians Trapped for Months Continue to be Evacuated</a></h5>
												<ul class="post_details simple">
													<li class="category"><a href="category_science.html" title="SCIENCE">SCIENCE</a></li>
												</ul>
											</div>
										</li>
									</ul>
									<a class="more page_margin_top" href="#">SHOW MORE</a>
								</div>
							</div>
							<h4 class="box_header page_margin_top_section">Latest Posts</h4>
							<div class="vertical_carousel_container clearfix">
								<ul class="blog small vertical_carousel autoplay-1 scroll-1 navigation-1 easing-easeInOutQuint duration-750">
									 <c:forEach items="${lastestPost}" var="lastestPost">
									<li class="post">
										<a href="<%=request.getContextPath() %>/${lastestPost.slug}" title="${lastestPost.title}">
											<span class="icon small gallery"></span>
											<img style="max-height: 100px;max-width: 100px" src='<%=request.getContextPath() %>/displaythumbnail/${lastestPost.id}' alt='img'>
										</a>
										<div class="post_content">
											<h5>
												<a href="<%=request.getContextPath() %>/${lastestPost.slug}" title="${lastestPost.title}">${lastestPost.title}</a>
											</h5>
											<ul class="post_details simple">
												<li class="category"><a href="#" title="${lastestPost.categoriesName}">${lastestPost.categoriesName}</a></li>
												<li class="date">
													<fmt:formatDate type = "both"  dateStyle = "short" timeStyle = "short" value = "${lastestPost.createdAt}" />
												</li>
											</ul>
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
							<h4 class="box_header page_margin_top_section">Top Authors</h4>
							<ul class="authors rating clearfix">
								<c:forEach items="${author}" var="item">
									<li class="author">
										<a class="thumb" href="#" title="${item.fullname}">
											<img style="width: 100px;height: 100px" src='<%=request.getContextPath() %>/displayimage/${item.id}' alt='img'>
											<span class="number animated_element" data-value=""></span>
										</a>
										<div class="details">
											<h5><a href="#" title="${item.fullname}">${item.fullname}</a></h5>
											<h6>Admin</h6>
										</div>
									</li>
								</c:forEach> 
							</ul>
						</div>
					</div>
				</div>
			</div>
						<div class="footer_container">
				<div class="footer clearfix">
					<div class="row">
						<div class="column column_1_3">
							<h4 class="box_header">About Zent Group</h4>
							<p class="padding_top_bottom_25">Là một công ty giáo dục và phần mềm</p>
							<div class="row">
								<div class="column column_1_2">
									<h5>Zent.,Copt</h5>
									<p>
										2A Trại Cá<br>
										Trương Định - Hai Bà Trưng,<br>
										Hà Nội - Việt Nam
									</p>
								</div>
								<div class="column column_1_2">
									<h5>Phone &amp; Fax</h5>
									<p>
										Phone: 0971541692<br>
										Fax: 0012243432
									</p>
								</div>
							</div>
							<h4 class="box_header page_margin_top">Get In Touch With Us</h4>
							<ul class="social_icons dark page_margin_top clearfix">
								<li>
									<a target="_blank" title="" href="http://facebook.com/QuanticaLabs" class="social_icon facebook">
										&nbsp;
									</a>
								</li>
								<li>
									<a target="_blank" title="" href="https://twitter.com/QuanticaLabs" class="social_icon twitter">
										&nbsp;
									</a>
								</li>
								<li>
									<a title="" href="mailto:contact@pressroom.com" class="social_icon mail">
										&nbsp;
									</a>
								</li>
								<li>
									<a title="" href="#" class="social_icon skype">
										&nbsp;
									</a>
								</li>
								<li>
									<a title="" href="http://themeforest.net/user/QuanticaLabs?ref=QuanticaLabs" class="social_icon envato">
										&nbsp;
									</a>
								</li>
								<li>
									<a title="" href="#" class="social_icon instagram">
										&nbsp;
									</a>
								</li>
								<li>
									<a title="" href="#" class="social_icon pinterest">
										&nbsp;
									</a>
								</li>
							</ul>
						</div>
						<div class="column column_1_3">
							<h4 class="box_header">Latest Posts</h4>
							<div class="vertical_carousel_container clearfix">
								<ul class="blog small vertical_carousel autoplay-1 scroll-1 navigation-1 easing-easeInOutQuint duration-750">
									<c:forEach items="${lastestPost}" var="lastestPost">
									<li class="post">
										<a href="<%=request.getContextPath() %>/${lastestPost.slug}" title="${lastestPost.title}">
											<span class="icon small gallery"></span>
											<img style="max-height: 100px;max-width: 100px" src='<%=request.getContextPath() %>/displaythumbnail/${lastestPost.id}' alt='img'>
										</a>
										<div class="post_content">
											<h5>
												<a href="<%=request.getContextPath() %>/${lastestPost.slug}" title="${lastestPost.title}">${lastestPost.title}</a>
											</h5>
											<ul class="post_details simple">
												<li class="category"><a href="#" title="${lastestPost.categoriesName}">${lastestPost.categoriesName}</a></li>
												<li class="date">
													<fmt:formatDate type = "both"  dateStyle = "short" timeStyle = "short" value = "${lastestPost.createdAt}" />
												</li>
											</ul>
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="column column_1_3">
							<h4 class="box_header">Latest Galleries</h4>
							<div class="horizontal_carousel_container big page_margin_top">
								<ul class="blog horizontal_carousel visible-1 autoplay-0 scroll-1 navigation-1 easing-easeInOutQuint duration-750">
									 <c:forEach items="${lastestPost}" var="lastestPost">
										<li class="post">
											<a href="%=request.getContextPath() %>/${lastestPost.slug}" title="${lastestPost.title}">
												<span class="icon gallery"></span>
												<img style="width: 300px;height: 200px" src='<%=request.getContextPath() %>/displaythumbnail/${lastestPost.id}' alt='img'>
											</a>
											<h5 class="with_number">
												<a href="%=request.getContextPath() %>/${lastestPost.slug}" title="${lastestPost.title}">${lastestPost.title}</a>
												<a class="comments_number" href="<% %>" title="${lastestPost.viewCount}Views">${lastestPost.viewCount}<span class="arrow_comments"></span></a>
											</h5>
											<ul class="post_details simple">
												<li class="category"><a href="#" title="${lastestPost.categoriesName}">${lastestPost.categoriesName}</a></li>
												<li class="date">
													<fmt:formatDate type = "both"  dateStyle = "short" timeStyle = "short" value = "${lastestPost.createdAt}" />
												</li>
											</ul>
										</li>
									</c:forEach>
									
									
								</ul>
							</div>
						</div>
					</div>
					<div class="row page_margin_top_section">
						<div class="column column_3_4">
							<ul class="footer_menu">
								<li>
									<h4><a href="category_world.html" title="World">World</a></h4>
								</li>
								<li>
									<h4><a href="category_health.html" title="Health">Health</a></h4>
								</li>
								<li>
									<h4><a href="category_sports.html" title="Sports">Sports</a></h4>
								</li>
								<li>
									<h4><a href="category_science.html" title="Science">Science</a></h4>
								</li>
								<li>
									<h4><a href="category_lifestyle.html" title="Lifestyle">Lifestyle</a></h4>
								</li>
							</ul>
						</div>
						<div class="column column_1_4">
							<a class="scroll_top" href="#top" title="Scroll to top">Top</a>
						</div>
					</div>
					<div class="row copyright_row">
						<div class="column column_2_3">
							© Copyright <a href="http://quanticalabs.com" title="QuanticaLabs" target="_blank">QuanticaLabs</a> - PressRoom Template. <a href="https://themeforest.net/cart/add_items?item_ids=9066845&ref=QuanticaLabs" title="PressRoom Template" target="_blank">Click here to buy it</a> 
						</div>
						<div class="column column_1_3">
							<ul class="footer_menu">
								<li>
									<h6><a href="about.html" title="About">About</a></h6>
								</li>
								<li>
									<h6><a href="authors.html" title="Authors">Authors</a></h6>
								</li>
								<li>
									<h6><a href="contact.html" title="Contact Us">Contact Us</a></h6>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="background_overlay"></div>
		<!--js-->
		<script type="text/javascript" src="<c:url value="/static/js/jquery-1.12.4.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery-migrate-1.4.1.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.ba-bbq.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.11.1.custom.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.easing.1.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.carouFredSel-6.2.1-packed.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.touchSwipe.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.transit.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.sliderControl.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.timeago.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.hint.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.prettyPhoto.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.qtip.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.blockUI.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/main.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/odometer.min.js"/>"></script>
	</body>
</html>