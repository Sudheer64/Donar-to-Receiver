<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
	<title>Donor2Receiver</title>
	<!--/tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="DonorToReceiver" />
	<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
		function updatePassword() {
			
			var password = document.getElementById("psw").value;
			
			var rpt = document.getElementById("rpt").value;
			
			if (password==null || rpt==null) {
				document.getElementById('passwordUpdated').innerHTML = 'Both the fields are mandatory'
				return;
			}
			if (password=='' || rpt=='') {
				document.getElementById('passwordUpdated').innerHTML = 'Both the fields are mandatory'
				return;
			}
			
			if (password != rpt) {
				document.getElementById('passwordUpdated').innerHTML = 'Password and repet password should be same'
					return;
			}
			
			
			$.ajax({
				type : "POST",
				url : "updatePassword",
				data : {
					"password" : password
					
				},
				beforeSend : function() {
					
				},
				success : function(data) {
					if (data == "FAIL") {
						/* $('#alertModal').find('.modal-body p').text(
						'unable to process the request');
				$('#alertModal').modal('show'); */
				document.getElementById('passwordUpdated').innerHTML = 'unable to process the request'
					setTimeout("$('#myModalP').modal('hide');",3000);
						
					} else {
						/*myModalF */
						document.getElementById('passwordUpdated').innerHTML = 'Updated successfully'
							setTimeout("$('#myModalP').modal('hide');",3000);
						
					}
				},
				error : function(request, status, error) {
					/* $('#alertModal').find('.modal-body p').text(
					'The request failed:'+ request.responseText);
			$('#alertModal').modal('show'); */
					alert("The request failed: " + request.responseText);
				}
			});

		}
	</script>
	<!--//tags -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/appointment_style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //for bootstrap working -->
	<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700" rel="stylesheet">
</head>

<body>
	<!-- header -->
	<div class="header" id="home">
		<div class="top_menu_w3layouts">
		<div class="container">
			 <div class="header_left">
				<ul>
					<li><i class="fa fa-map-marker" aria-hidden="true"></i> Thunder Bay, Canada </li>
					<li><i class="fa fa-phone" aria-hidden="true"></i> +(1) 807 356 4561</li>
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:donortoreceiver@gmail.com">donortoreceiver@gmail.com</a></li>
					<c:if test="${userdeatils ne null}">
					<c:choose>
					<c:when test="${userdeatils.firstName ne null}">
    					<li><i class="fa fa-user" aria-hidden="true"></i>${userdeatils.firstName}</li>
 					<li><i class="fa fa-window-close" aria-hidden="true"> </i><a  onclick ="logout()" id='logout' href="logout">logout</a></li>
 					 </c:when>
 					<c:otherwise>
 					<li><i class="fa fa-user" aria-hidden="true"></i>${userdeatils.email}
 					</li>
 					<li><i class="fa fa-window-close" aria-hidden="true"> </i><a onclick ="logout()" id='logout' href="logout">logout</a></li>
 					 
    					
  					</c:otherwise>
					</c:choose>
					</c:if>
					
					
					
				</ul>
			</div>
			<div class="header_right">
				<ul class="forms_right">					
					<li><a href="posts.jsp"action="posts"> Donate  </a> </li>
					<li><a href="message"> Receive  </a> </li>
				</ul>
			</div>
			<div class="clearfix"> </div>
			</div> 
		</div>

		<div class="content white">
			<nav class="navbar navbar-default" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
						<a class="navbar-brand" href="home">
							<h1><span class="fa fa-stethoscope" aria-hidden="true"></span>Donor2Receiver </h1>
						</a>
					</div>
					<!--/.navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<nav>
							<ul class="nav navbar-nav">
								<li><a href="home" class="active">Home</a></li>
								<li class="dropdown">
							<!--  		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Manage accounts <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="#" data-toggle="modal" data-target="#myModalL">LOGIN</a></li>										
										<li class="divider"></li>
										<li><a href="#" data-toggle="modal" data-target="#myModalS">SIGN UP</a></li>
										<li class="divider"></li>										
									</ul>
									-->
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">Manage accounts <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="#" data-toggle="modal" data-target="#myModalL">Update Profile</a></li>										
										<li class="divider"></li>
										<li><a href="#" data-toggle="modal" data-target="#myModalP">Update Password</a></li>	
										<li class="divider"></li>
										<li><a href="#" data-toggle="modal" data-target="#">Subscriptions</a></li>
										<li class="divider"></li>
										</ul>
								</li>
								<li><a href="#">My Donations</a></li>								
								<li><a href="#">Received</a></li>								
								<li><a href="#">Help Others</a></li>
								<!--  <li><a href="logout">logout</a></li> -->
							</ul>
						</nav>
					</div>
					<!--/.navbar-collapse-->
					<!--/.navbar-->
				</div>
			</nav>
		</div>
	</div>
	<!-- banner -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
			<li data-target="#myCarousel" data-slide-to="2" class=""></li>
			<li data-target="#myCarousel" data-slide-to="3" class=""></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="container">
					<div class="carousel-caption">
						<h3>With a Touch of <span>Kindness.</span></h3>
						<div class="header_left">
							<ul class="forms_right">
								<li><a href="posts.jsp" action="posts" > Donate  </a> </li>
							</ul>
						</div>
						<div class="header_right">
							<ul class="forms_right">								
								<li><a href="message"> Receive  </a> </li>
							</ul>
						</div>										
						<p>Join our hands for a healthy society.</p>						
						<h6>Your generous support today means we all have the resources in place to deliver help the moment it is needed, wherever it as needed most across the world.Join one of the world's largest and most impactful charities to help make a difference in the lives of over a million . </h6>
					</div>
				</div>
			</div>
			<div class="item item2">
				<div class="container">0
					<div class="carousel-caption">
						<h3>With a Touch of <span>Kindness.</span></h3>
						<div class="header_left">
							<ul class="forms_right">
								<li><a href="posts.jsp"action="posts"> Donate  </a> </li>
							</ul>
						</div>
						<div class="header_right">
							<ul class="forms_right">								
								<li><a href="message"> Receive  </a> </li>
							</ul>
						</div>	
						<p>Join our hands for a healthy society.</p>
						<h6>Your generous support today means we all have the resources in place to deliver help the moment it is needed, wherever it as needed most across the world.Join one of the world's largest and most impactful charities to help make a difference in the lives of over a million . </h6>
					</div>
				</div>
			</div>
			<div class="item item3">
				<div class="container">
					<div class="carousel-caption">
						<h3>With a Touch of <span>Kindness.</span></h3>
						<div class="header_left">
							<ul class="forms_right">
								<li><a href="posts.jsp"action="posts"> Donate  </a> </li>
							</ul>
						</div>
						<div class="header_right">
							<ul class="forms_right">								
								<li><a href="message"> Receive  </a> </li>
							</ul>
						</div>	
						<p>Join our hands for a healthy society.</p>
						<h6>Your generous support today means we all have the resources in place to deliver help the moment it is needed, wherever it as needed most across the world.Join one of the world's largest and most impactful charities to help make a difference in the lives of over a million . </h6>
					</div>
				</div>
			</div>
			<div class="item item4">
				<div class="container">
					<div class="carousel-caption">
						<h3>With a Touch of <span>Kindness.</span></h3>
						<div class="header_left">
							<ul class="forms_right">
								<li class><a href="posts.jsp"action="posts"> Donate  </a> </li>
							</ul>
						</div>
						<div class="header_right">
							<ul class="forms_right">								
								<li><a href="message"> Receive  </a> </li>
							</ul>
						</div>	
						<p>Join our hands for a healthy society.</p>
						<h6>Your generous support today means we all have the resources in place to deliver help the moment it is needed, wherever it as needed most across the world.Join one of the world's largest and most impactful charities to help make a difference in the lives of over a million . </h6>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="fa fa-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="fa fa-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
		<!-- The Modal -->
	</div>
	<!--//banner -->
	<!-- about -->
	<div class="agile-about w3ls-section">
	<!-- about-bottom -->
	<div class="agileits-about-btm">
	<h3 class="heading-agileinfo">Welcome To The World of Pure Hearts!<span>Thanks for being a part of our Projects.</span></h3>
		<div class="container">
			<div class="w3-flex">
			<!--<div class="col-md-4 col-sm-4 ab1 agileits-about-grid1 post-title">
			<div class="col-md-4 col-sm-4 ab">
				<h4 class="agileinfo-head">BLOOD</h4>
				<p>Donate your Blood for a good cause.</p>
				<h5> * Every two seconds someone in the U.S. needs blood. </h5>
				<h5> * Approximately 36,000 units of red blood cells are needed every day in the U.S.	</h5>
				<h5> * Nearly 7,000 units of platelets and 10,000 units of plasma are needed daily in the U.S. </h5>
				<h5 class="post-title">Be a Donor Now !!!</h5>
			</div>-->		
			<!--<div class="col-md-4 col-sm-4 ab1 agileits-about-grid2">				
				<h4 class="agileinfo-head">ORGAN</h4>
				<p>Donate your Organ for a good cause.</p>
				<h5> * 22 people die every day while waiting for a transplant. </h5>
				<h5> * 1 organ donor can save 8 lives and change the lives of more than 50 people.</h5>
				<h5> * Almost anyone can be an organ donor, regardless of age or medical history.</h5>
				<h5 class="post-title">Be a Donor Now !!!</h5>
			</div>
			<div class="col-md-4 col-sm-4 ab1 agileits-about-grid3">				
				<h4 class="agileinfo-head">TISSUES</h4>
				<p>Donate your Tissues for a good cause.</p>
				<h5> * Tissue donation can greatly enhance a recipient's life quality.</h5>
				<h5> * Nearly a million tissue transplant surgeries are performed every year in U.S</h5>
				<h5> * It is estimated that one in 20 Americans will need some type of tissue transplant.</h5>
				<h5 class="post-title">Be a Donor Now !!!</h5>
			</div>
			<div class="clearfix"></div> -->
			
			<div class="services-bottom-grids">
			<div class="col-md-4">
				<div class="grid1">
					<h4 class="agileinfo-head">BLOOD</h4>
					<p class="post-title">Donate your Blood for a good cause.</p>
					<ul>
						<li> * Every two seconds someone in the U.S. needs blood. </li>
						<li> * Approximately 36,000 units of red blood cells are needed every day in the U.S.	</li>
						<li> * Nearly 7,000 units of platelets and 10,000 units of plasma are needed daily in the U.S. </li>
						<li class="post-title">Be a Donor Now !!!</li>
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="grid1">
				<h4 class="agileinfo-head">ORGAN</h4>
				<p class="post-title">Donate your Organ for a good cause.</p>
				<ul>
				<li> * 22 people die every day while waiting for a transplant. </li>
				<li> * 1 organ donor can save the lives of 8 people and change the lives of more than 50 people.</li>
				<li> * Almost anyone can be an organ donor, regardless of age,race or medical history.</li>
				<li class="post-title">Be a Donor Now !!!</li>
				</ul>
				</div>
			</div>
			<div class="col-md-4">
			<div class="grid1">
				<h4 class="agileinfo-head">TISSUES</h4>
				<p class="post-title">Donate your Tissues for a good cause.</p>
				<ul>
				<li> * Tissue donation can greatly enhance a recipient's life quality.</li>
				<li> * Nearly a million tissue transplant surgeries are performed every year in U.S</li>
				<li> * It is estimated that one in 20 Americans will need some type of tissue transplant.</li>
				<li class="post-title">Be a Donor Now !!!</li>
				</ul>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		</div>
		</div>
	</div>
	<!-- //about-bottom -->
</div>
<!-- emergency -->
<div class="emergency_cases_w3ls">
<div class="emergency_cases_bt">
	<div class="container">
	<div class="emergency_cases_top">
		<div class="col-md-6 emergency_cases_w3ls_left">
			<h4>Customer Care Hours</h4>
			<h6>Monday - Friday&nbsp;<span class="eme">00.00 - 24.00</span></h6>
			<h6>Weekends &nbsp;<span class="eme">06.00 - 20.00</span></h6>
		</div>
		<div class="col-md-6 emergency_cases_w3ls_right">
			<h4>Need help?</h4>
			<h5><i class="fa fa-phone" aria-hidden="true"></i>+1 807 356 4561 </h5>
			<p>Clear all your queries about the donation process,with our set of qualified professionals.</p>
		</div>
		
		<div class="clearfix"></div>
		</div>
	</div>
	</div>
</div>
<!-- //emergency -->
<!-- services -->
<!-- div class="services">
<div class="container">
		<h3 class="heading-agileinfo">Therapies & Treatments<span>We offer extensive medical procedures to outbound and inbound patients.</span></h3>	
		<div class="services-top-grids">
			<div class="col-md-6">
				<div class="grid1">
					<i class="fa fa-heartbeat" aria-hidden="true"></i>
					<h4>Anxiety</h4>
					<p>Anxiety can be treated with medication, but several mind-body approaches may also be effective. Hypnosis is sometimes used along with cognitive behavioral therapy to treat anxiety. It can help people focus their attention, rethink problems, relax, and respond to helpful suggestions. </p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="grid1">
					<i class="fa fa-user-md" aria-hidden="true"></i>
					<h4>Stress Management</h4>
					<p>Managing stress / What does stress feel like? When we are stressed, our bodies may show physical signs of tension. Sometimes irritation, anger, nervousness or sadness can be a clue you are feeling stressed. You may have difficulty concentrating or feel like you can't stop worrying about something. </p>
				</div>
			</div>
			
			<div class="clearfix"></div>
		</div>
		<div class="services-bottom-grids">
			<div class="col-md-6">
				<div class="grid1">
					<i class="fa fa-wheelchair-alt" aria-hidden="true"></i>
					<h4>Depression</h4>
					<p>While some illnesses have a specific medical cause, making treatment straightforward, depression is more complicated. Depression is not just the result of a chemical imbalance in the brain that can be simply cured with medication. It's caused by a combination of biological, psychological, and social factors. </p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="grid1">
					<i class="fa fa-ambulance" aria-hidden="true"></i>
					<h4>Support Group</h4>
					<p>Support groups bring people together who are living with similar dependency issues. This peer to peer support will often be facilitated by a trained professional or volunteer. Members of the group share their experiences and receive practical tips. All of our groups are offered free of charge, but registration is required. </p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div-->
<!-- //services -->
<!-- Clients -->
<div class="tesimonials">
<div class="tesimonials_tp">
		<div class="container">
			<div class="tittle_head_w3layouts">
				<h3 class="heading-agileinfo te">Our Testimonials<span class="te">Here is a display of our work.</span></h3>
			</div>
			<div class="inner_sec_info_agileits_w3">
				<div class="test_grid_sec">
					<div class="col-md-offset-2 col-md-8">
						<div class="carousel slide two" data-ride="carousel" id="quote-carousel">
							<!-- Bottom Carousel Indicators -->
							<ol class="carousel-indicators two">
								<li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
								<li data-target="#quote-carousel" data-slide-to="1"></li>
								<li data-target="#quote-carousel" data-slide-to="2"></li>
								<li data-target="#quote-carousel" data-slide-to="3"></li>
							</ol>

							<!-- Carousel Slides / Quotes -->
							<div class="carousel-inner">

								<!-- Quote 1 -->
								<div class="item active">
									<blockquote>
										<div class="test_grid">
											<div class="col-sm-3 text-center test_img">
												<img src="images/Pramod.jpeg" alt=" " class="img-responsive" />

											</div>
											<div class="col-sm-9 test_img_info">
												<p>I want everyone to know and understand what it really means to be an organ donor. You can save someones life.</p>
												<h6>Jack</h6>
											</div>
										</div>
									</blockquote>
								</div>
								<!-- Quote 2 -->
								<div class="item">
									<blockquote>
										<div class="test_grid">
											<div class="col-sm-3 text-center test_img">
												<img src="images/Raj.JPG" alt=" " class="img-responsive" />
											</div>
											<div class="col-sm-9 test_img_info">
												<p>When she left us, her organs went on to save four lives of four strangers. I can't tell you how much more proud I am now.</p>
												<h6>Jane Wearne</h6>
											</div>
										</div>
									</blockquote>
								</div>
								<!-- Quote 3 -->
								<div class="item">
									<blockquote>
										<div class="test_grid">
											<div class="col-sm-3 text-center test_img">
												<img src="images/Anil.JPG" alt=" " class="img-responsive" />
											</div>
											<div class="col-sm-9 test_img_info">
												<p>My sister got a tissue transplantation, we found the donor through D2R.Thank you D2R</p>
												<h6> Williams</h6>
											</div>
										</div>
									</blockquote>
								</div>
								<!-- Quote 4 -->
								<div class="item">
									<blockquote>
										<div class="test_grid">
											<div class="col-sm-3 text-center test_img">
												<img src="images/syed.JPG" alt=" " class="img-responsive" />
											</div>
											<div class="col-sm-9 test_img_info">
												<p>The only change I have had is in my heart. It is a tremendous feeling knowing I was blessed and able to help save his life. I now join this group to encourage people to donate,and I do not take even the little things in life for granted.</p>
												<h6>Ron</h6>
											</div>
										</div>
									</blockquote>
								</div>
							</div>

							<!-- Carousel Buttons Next/Prev -->
							<a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-chevron-left"></i></a>
							<a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //Clients -->

<!--/icons-->
<!--
	<div class="banner-bottom">
		<div class="container">
			<div class="tittle_head_w3layouts">
				<h3 class="heading-agileinfo">Case Studies<span>We offer extensive medical procedures to outbound and inbound patients.</span></h3>
			</div>
			<div class="inner_sec_info_agileits_w3">
				<div class="col-md-4 grid_info">
					<div class="icon_info">
						<img src="images/g4.jpg" alt=" " class="img-responsive">
						<h5>Nutrition Reference</h5>
						<p>Lorem ipsum dolor sit amet,vehicula vel sapien et, feugiat sapien amet.</p>
						<a href="#" class="read-agileits" data-toggle="modal" data-target="#myModal">Read More</a>
					</div>
				</div>
				<div class="col-md-4 grid_info">
					<div class="icon_info">
						<img src="images/g7.jpg" alt=" " class="img-responsive">
						<h5>Injury Prevention</h5>
						<p>Lorem ipsum dolor sit amet,vehicula vel sapien et, feugiat sapien amet.</p>
						<a href="#" class="read-agileits" data-toggle="modal" data-target="#myModal">Read More</a>
					</div>
				</div>
				<div class="col-md-4 grid_info">
					<div class="icon_info">
						<img src="images/g6.jpg" alt=" " class="img-responsive">
						<h5>Catheterization Lab</h5>
						<p>Lorem ipsum dolor sit amet,vehicula vel sapien et, feugiat sapien amet.</p>
						<a href="#" class="read-agileits" data-toggle="modal" data-target="#myModal">Read More</a>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	-->
	<!--//icons-->

	<!-- footer -->
	<!-- div class="footer_top_agile_w3ls">
		<div class="container">
			<div class="col-md-3 footer_grid">
				<h3>About Us</h3>
				<p>We are a Non Profit Organization,Working towards the welfare of the human race.</p>				
			</div>
			<div class="col-md-3 footer_grid">
				<h3>Latest News</h3>
				<ul class="footer_grid_list">
					<li><i class="fa fa-angle-right" aria-hidden="true"></i>
						<a href="#" data-toggle="modal" data-target="#myModal">Lorem ipsum neque vulputate </a>
					</li>
					<li><i class="fa fa-angle-right" aria-hidden="true"></i>
						<a href="#" data-toggle="modal" data-target="#myModal">Dolor amet sed quam vitae</a>
					</li>
					<li><i class="fa fa-angle-right" aria-hidden="true"></i>
						<a href="#" data-toggle="modal" data-target="#myModal">Lorem ipsum neque, vulputate </a>
					</li>
				</ul>
			</div>
			<div class="col-md-3 footer_grid">
				<h3>Contact Info</h3>
				<ul class="address">
					<li><i class="fa fa-map-marker" aria-hidden="true"></i>Thunder Bay,Canada </li>
					<li><i class="fa fa-envelope" aria-hidden="true"></i> <a href="mailto:customer.care@d2r.com">customer.care@d2r.com</a></li>
					<li><i class="fa fa-phone" aria-hidden="true"></i>+1 807 123 1234</li>
				</ul>
			</div>
			<div class="col-md-3 footer_grid ">
				<h3>Sign up for our Newsletter</h3>
				<p>Get Started For Free</p>
				<div class="footer_grid_right">

					<form action="#" method="post">
						<input type="email" name="Email" placeholder="Email Address..." required="">
						<input type="submit" value="Submit">
					</form>
				</div>
			</div>
			<div class="clearfix"> </div>

		</div>
	</div-->
	<div class="footer_wthree_agile">
		<p>A � 2018 Donor2Receiver. All rights reserved </p>
	</div>
	<!-- //footer -->
	<!-- bootstrap-modal-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					New Clinic
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
					<div class="modal-body">
						<img src="images/g7.jpg" alt=" " class="img-responsive" />
						<p>Ut enim ad minima veniam, quis nostrum 
							exercitationem ullam corporis suscipit laboriosam, 
							nisi ut aliquid ex ea commodi consequatur? Quis autem 
							vel eum iure reprehenderit qui in ea voluptate velit 
							esse quam nihil molestiae consequatur, vel illum qui 
							dolorem eum fugiat quo voluptas nulla pariatur.
							<i>" Quis autem vel eum iure reprehenderit qui in ea voluptate velit 
								esse quam nihil molestiae consequatur.</i></p>
					</div>
			</div>
		</div>
	</div>
<!-- //bootstrap-modal-pop-up --> 

<!-- Login -->
	<div class="modal video-modal fade" id="myModalL" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						My Profile
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
						<div class="modal-body">
						<div class="col-sm-3 text-center test_img">
							<img src="images/avatar.png" alt=" " class="img-responsive" /></div>
							<form:form action="update" name="updateForm" method="post" modelAttribute="detailsUpdate" class="niceform">
							<fieldset>
							<table>
								<tr>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;">First
											Name</span></td>
									<td><form:input path="firstName" type="text" value="${detailsUpdate.firstName}"
											class="form-control"
											style="margin-bottom: 10px; width: 250px;" /></td>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;"><form:errors
												path="firstName" cssClass="error" style="font:red" /></span></td>
								</tr>
								<tr>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;">LastName
								 </span></td>
									<td><form:input path="lastName" type="text" value="${detailsUpdate.lastName}"
											class="form-control"
											style="margin-bottom: 10px; width: 250px;" /></td>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;"><form:errors
												path="lastName" cssClass="error" style="font:red" /></span></td>
								</tr>
								<tr>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;">Contact
											Number</span></td>
									<td><form:input path="phone" type="text" value="${detailsUpdate.phone}"
											class="form-control"
											style="margin-bottom: 10px; width: 250px;" /></td>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;"><form:errors
												path="phone" cssClass="error" style="font:red" /></span></td>
								</tr>
								<tr>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;">City
								 </span></td>
									<td><form:input path="city" type="text" value="${detailsUpdate.city}"
											class="form-control"
											style="margin-bottom: 10px; width: 250px;" /></td>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;"><form:errors
												path="city" cssClass="error" style="font:red" /></span></td>
								</tr>
								<tr>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;">Country
								 </span></td>
									<td><form:input path="country" type="text" value="${detailsUpdate.country}"
											class="form-control"
											style="margin-bottom: 10px; width: 250px;" /></td>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;"><form:errors
												path="country" cssClass="error" style="font:red" /></span></td>
								</tr>
							
								<tr>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;">Date:
									</span></td>
									<td><form:input path="dob" class="form-control" type="date"
											style="margin-bottom: 10px; width: 250px;" id="date" /></td>
									<td><span
										style="margin: 15px 54px 10px 0px; display: inline-block;"><form:errors
												path="dob" cssClass="error" /></span></td>
								</tr>
								
								

								<tr class="submit">
									<td colspan="1" align="center"><input type="submit"
										name="submit" id="submit" value="Submit" /></td>
										
								</tr>

							</table>

						</fieldset>
							
							</form:form>
						</div>
				</div>
			</div>
		</div>
<!-- Login -->
	<!-- Update Password-->
		<div class="modal video-modal fade" id="myModalP" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						Update Password
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
						<div class="modal-body">
						<p>
							<label for="psw"><b>Password</b></label>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
							<input type="password" placeholder=" Enter Password" name="psw" id="psw" required><br><br>
							<label for="psw-repeat"><b>Repeat Password</b></label>&nbsp &nbsp
							<input type="password" placeholder=" Repeat Password" name="psw-repeat" id="rpt" required>	
							<p><label id="passwordUpdated"></label></p>
							<p><button type="submit" onclick="javascript:updatePassword()" class="">Update</button>
						</P>						
					</div>
				</div>
			</div>
		</div>
	<!-- Sign up-->
	<!-- forgot password-->
	<div class="modal video-modal fade" id="myModalF" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						Forgot Password
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
						<div class="modal-body">
						<p>
							<label for="email"><b>Email ID</b></label>
							<input type="text" placeholder="Enter Email" name="email" required><br>
							<p><button type="submit" class="">Send Mail</button>
						</P>						
					</div>
				</div>
			</div>
		</div>
	<!-- forgot password-->
	


	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script>
	/*function logout(){
		alert("You have been logged out successfully");
	}*/
	
	</script>
	<script>
		$('ul.dropdown-menu li').hover(function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
		}, function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
		});
		
		
	</script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>

</html>