<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>FHAK</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/assets/img/logo.png" rel="icon">
  <link href="/assets/img/logo.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/css/style.css" rel="stylesheet">
  <style>
	.block {
		display: inline-block; margin-right: 60px;
	}
	
	.sliderImg {
		width: 400px; height: 200px;
	}
  </style>

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Mar 09 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
</head>

<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="/home" class="logo d-flex align-items-center">
        <img src="/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">FHAK</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item dropdown pe-3">
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <c:choose>           
	            <c:when test = "${userInfo.authority eq 'manager'}">
			    	<i class="ri-admin-line"></i>
			    </c:when>
			    <c:when test = "${userInfo.authority eq 'admin'}">
			    	<i class="ri-aliens-line"></i>
			    </c:when>
			    <c:otherwise>
			    	<i class="ri-user-line"></i>
		        </c:otherwise>
            </c:choose>
			<span class="d-none d-md-block dropdown-toggle ps-2">${userInfo.userName}</span>
          </a>

		<!-- 유저 정보  -->
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${userInfo.userName}</h6>
              <span>${userInfo.userId}</span>
            </li>
            
            <li>
              <hr class="dropdown-divider">
            </li>
			
			<c:if test="${userInfo.authority ne 'admin'}">
	            <li>
	              <a class="dropdown-item d-flex align-items-center" href="/mypage">
	                <i class="bi bi-person"></i>
	                <span>My Profile</span>
	              </a> 
	            </li>
            </c:if>   
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="
	              	<c:choose>
	              		<c:when test="${userInfo.authority eq 'admin'}">
	              			/admin/viewTables
	              		</c:when>
	              		<c:when test="${userInfo.authority eq 'manager'}">
	              			/manager/clubUsers
	              		</c:when>
	              		<c:when test="${userInfo.authority eq 'user'}">
	              			<!-- 내 동아리들 -->
	              		</c:when>
	              	</c:choose>              		
				">
                <i class="bi bi-gear"></i>
                <span>
	              	<c:choose>
	              		<c:when test="${userInfo.authority eq 'admin'}">
	              			Administrator
	              		</c:when>
	              		<c:when test="${userInfo.authority eq 'manager'}">
	              			Manage Club
	              		</c:when>
	              		<c:when test="${userInfo.authority eq 'user'}">
	              			Club
	              		</c:when>
	              	</c:choose>
                </span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="/logoutProc">
                <i class="bi bi-box-arrow-right"></i>
                <span>Logout</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">
    
      <li class="nav-heading">Main</li>

	<!--  MAIN PAGE -->
	 <c:if test="${userInfo.authority ne 'admin'}">
      <li class="nav-item">
        <a class="nav-link " href="/mypage">
          <i class="bi bi-grid"></i>
          <span>MY PAGE</span>
        </a>
      </li>
     </c:if>
      
      <c:choose>
	      <c:when test = "${userInfo.authority eq 'manager'}">
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="/manager/clubUsers">
		          <i class="ri-team-line"></i>
		          <span>Manage Club</span>
		        </a>
		      </li>
	      </c:when>
	      <c:when test = "${userInfo.authority eq 'user'}">
		      <li class="nav-item">
		        <a class="nav-link collapsed" data-bs-toggle="modal" data-bs-target="#signInClubModal">
		          <i class="ri-pencil-line"></i>
		          <span>Sign in Club</span>
		        </a>
		      </li>
	      </c:when>
	      <c:otherwise>
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="/admin/viewTables">
		          <i class="ri-settings-5-line"></i>
		          <span>Administrator</span>
		        </a>
		      </li>
	      </c:otherwise>
      </c:choose>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="/logoutProc">
          <i class="bi bi-box-arrow-right"></i>
          <span>LOGOUT</span>
        </a>
      </li><!-- End Login Page Nav -->

      <li class="nav-heading">DEPARTMENT</li>
      
      <!-- 학과 배열 선언 -->
      <c:forEach items="${depts}" var="dept">
      
      	<c:if test="${!dept.nameEn.contains('Advanced') || !dept.nameKr.contains('심화')}">	<!-- 심화 과정이 포함된 학과는 하나만 출력하기 위함 -->
      	
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-toggle="collapse" href="#${dept.nameKr}">
            <i class="bi bi-menu-button-wide"></i><span>${dept.nameEn}</span><i class="bi bi-chevron-down ms-auto"></i>
          </a>
          <ul id="${dept.nameKr}" class="nav-content collapse " data-bs-parent="#sidebar-nav">
            <c:forEach items="${clubs}" var="club">
              <c:if test="${club.deptNameEn == dept.nameEn && club.clubState == 1}">
              
             	<!-- <script>console.log('-> ${club.clubName}');</script> -->
              	
                <li>
                  <a href="#" onclick="changeMainBoard('club', '${club.clubId}')">
                    <i class="bi bi-circle"></i>
                    <span>${club.clubName} </span>
                  </a>
                </li>
              </c:if>
            </c:forEach>
          </ul>
        </li>
        
        </c:if>
        
      </c:forEach>

    </ul>

  </aside><!-- 사이드바 끝 -->

  <main id="main" class="main">
    <section class="section dashboard">
  	 		<!-- Modal을 이용한 동아리 가입 신청 페이지 -->
			<div class="modal fade" id="signInClubModal" tabindex="-1">
				<c:if test="${!empty alert}">${alert}</c:if>
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Sign in Club</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form:form modelAttribute="clubUser" action="/enterclub"
							method="post">

							<div class="modal-body">
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">이름</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											value="${userInfo.userName}" disabled>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">학번</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											value="${userInfo.userId}" disabled>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">연락처</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											value="${userInfo.userPhoneNumber}" disabled>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">동아리</label>
									<div class="col-sm-10">
										<select class="form-select" id="clubSelect" name="clubName">
											<c:forEach items="${clubsForSignIn}" var="club">
												<option value="${club.clubName}">
													<c:if test="${club.division eq '일반'}">[일반]</c:if>
													<c:if test="${club.division eq '전공'}">[전공]</c:if>
													${club.clubName}
												</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="row mb-3">
									<label for="Introduce" class="col-sm-2 col-form-label">인사말</label>
									<div class="col-sm-10">
										<textarea class="form-control" style="height: 50px"
											id="Introduce" name="Introduce" required></textarea>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Sign in
									Club</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>

			<!-- 게시글 모달 -->
			<div class="modal fade closeModalAndincreaseViewCount" id="postModal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content" id="postModalBody">
						<!-- 모달 내용 -->
					</div>
				</div>
			</div>
			
			<!-- 게시글 상세 내용 출력 모달 
			<div class="modal fade closeModalAndincreaseViewCount" id="viewPostModal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						
						<div class="modal-header">
							<h5 class="modal-title">Post Detail</h5>
							<button type="button" class="btn-close" 
								data-bs-dismiss="modal"	aria-label="Close"></button>
						</div>
						<div class="modal-body" id="viewPostModalBody">
							모달 내용
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
						
					</div>
				</div>
			</div>
			-->

			<div class="row">
        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">
          
           <!-- 회원 게시판-->
            <div class="col-xxl-4 col-md-6" onclick="changeMainBoard('allpost', 'pub')">
              <div class="card info-card">
                <div class="card-body">
                  <div class="d-flex align-items-center" style="margin-top : 30px">
                    <!-- <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div> -->
                    <div class="ps-3">
                      <h6>Public</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-xxl-4 col-md-6" onclick="changeMainBoard('allpost', 'pri')">
              <div class="card info-card">
                <div class="card-body">
                  <div class="d-flex align-items-center" style="margin-top : 30px">
                    <!-- <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div> -->
                    <div class="ps-3">
                      <h6>Private</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-xxl-4 col-md-6" onclick="changeMainBoard('allpost', 'qna')">
              <div class="card info-card">
                <div class="card-body">
                  <div class="d-flex align-items-center" style="margin-top : 30px">
                    <!-- <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div> -->
                    <div class="ps-3">
                      <h6>QnA</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <input type = "hidden" id ="boardId"/>
          
          <!-- 게시판 -->
						<div class="col-md-12" style="height: 500px">
							<div class="card top-selling">
								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>POST</h6>
										</li>

										<!-- add 누르면 게시글 작성페이지로 이동(임시) -->
										<li><a class="dropdown-item" 
											data-bs-target="#postModal" onclick="changeModal('post', null)">New Post</a></li>	<!-- data-bs-toggle="modal" -->
										<li><a class="dropdown-item" href="/viewallpost">View All Post</a></li>
									</ul>
								</div>
								<div class="card-body" style="height: 500px">
									<div id="mainBoard">	<!-- 게시판 뷰 -->
										<jsp:include page="viewAccordion.jsp"/>
									</div>
								</div>
							</div>
						</div>
						<!-- 게시판 끝-->

          </div>
        </div><!-- End Left side columns -->

        <!-- 채팅창 시작 -->
        <div class="col-lg-4">

          
          <div class="card-body" style="height:50px; margin-bottom:0;">
          	<h1>Chat</h1>
          </div>
          <div class="card" style="height : 450px; margin-bottom:0;" id="chatTable">
            <!-- 채팅 페이지 include -->
            <jsp:include page="chat.jsp"/>	
            
            
            <!-- 추후 랭킹 페이지 -->
<!--            <div class="card" style="height : 200px;">
            	<div class="filter">
              		<a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              		<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                		<li class="dropdown-header text-start">
                  			<h6>Filter</h6>
                		</li>

		                <li><a class="dropdown-item" href="#">Today</a></li>
		                <li><a class="dropdown-item" href="#">This Month</a></li>
		                <li><a class="dropdown-item" href="#">This Year</a></li>
              		</ul>
            	</div>
            	<h5 class="card-title">Budget Report <span>| This Month</span></h5>
            	<div id="budgetChart" style="min-height: 400px;" class="echart"></div>
            	<script>
                document.addEventListener("DOMContentLoaded", () => {
                  var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                    legend: {
                      data: ['Allocated Budget', 'Actual Spending']
                    },
                    radar: {
                      // shape: 'circle',
                      indicator: [{
                          name: 'Sales',
                          max: 6500
                        },
                        {
                          name: 'Administration',
                          max: 16000
                        },
                        {
                          name: 'Information Technology',
                          max: 30000
                        },
                        {
                          name: 'Customer Support',
                          max: 38000
                        },
                        {
                          name: 'Development',
                          max: 52000
                        },
                        {
                          name: 'Marketing',
                          max: 25000
                        }
                      ]
                    },
                    series: [{
                      name: 'Budget vs spending',
                      type: 'radar',
                      data: [{
                          value: [4200, 3000, 20000, 35000, 50000, 18000],
                          name: 'Allocated Budget'
                        },
                        {
                          value: [5000, 14000, 28000, 26000, 42000, 21000],
                          name: 'Actual Spending'
                        }
                      ]
                    }]
                  });
                });
              </script>
            </div>
          </div>
           -->
          
        </div><!-- End Right side columns -->
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
  
  	<!-- 이미지 슬라이드 페이지 불러오기 -->
	<div class="marquee_text">
		<c:forEach items="${clubs}" var="club">
	        <c:if test="${club.clubState == 1}">			<!-- 생성 승인된 동아리만 출력 가능 -->
			<div class="block">
				<a href="#" onclick="changeMainBoard('club', '${club.clubId}')">
					<img class="sliderImg" src="/upload/club/${club.clubImage}"><br>
					<!--  <img class="sliderImg" src="/assets/img/clubs/${club.clubId}.jpg"><br> -->
				</a>
				<center><span><b>[${club.deptNameEn}]<br>${club.clubName}</b></span></center>
			</div>
			</c:if>
		</c:forEach>
	</div>
 	
 	<div class="copyright" style="display:block;">
    	<br>
      	&copy; Copyright <strong><span>Nice Admin</span></strong>. All Rights Reserved
    </div>
  </footer><!-- End Foo ter -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="/assets/vendor/echarts/echarts.min.js"></script>
  <script src="/assets/vendor/quill/quill.min.js"></script>
  <script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>
  
  
  <!--  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
	<script src="/assets/js/jquery.marquee.js"></script>
	-->
  <!-- Template Main JS File -->
  <!-- 
  <script src="/assets/js/jquery-1.10.2.js"></script>
   -->
  <script src="/assets/js/main.js"></script>
  <script src="/assets/js/additionalFunc.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="/assets/js/jquery.marquee.js"></script>
  <script>
    
	$(function() {
		$('.marquee_text').marquee({
	    	speed: 60,//속도
	        direction: 'left',//방향
	        duration: 50000,
	        gap: 50,//간격
	        delayBeforeStart: 0,//시작 delay값
	        duplicated: true,//선택 영역 복제
	        startVisible: true,
	        pauseOnHover: true//hover시 일시중지
	    	
	    });
	});
	
	// 게시글 열람 모달 닫기(버튼 및 외부 클릭)시, 조회수 증가 및 비동기 처리로 내용 갱신
	function handleModalClose() {
		changeMainBoard('allpost', null);
	}
	var modal = new bootstrap.Modal(document.getElementById('postModal'));
	modal._element.addEventListener('hidden.bs.modal', handleModalClose);

  </script>
  <script>
    if("${message}" != "") {
    	alert("${message}");
    }
  </script>
  
</body>

</html>
