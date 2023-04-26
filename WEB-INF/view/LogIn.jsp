<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>밴드 갤러리</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="index.html">
                        밴드 갤러리
                    </a>
                </li>
                <li>
                    <a href="BandInfo.jsp">밴드 정보</a>
                </li>
                <li>
                    <a href="SongReview.jsp">감상 후기</a>
                </li>
                <li>
                    <a href="TodayLegend.jsp">오늘의 명곡</a>
                </li>
                <li>
                    <a href="LogIn.jsp">마이페이지</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <%
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        if(session.getAttribute("id") == null) {
            %>
            <h1> 로그인 페이지 </h1> 
            <br /> <form action="LoginCheck.jsp" method="post">
            <br />
            <br /> 아이디 <input name="id" type="text">
            <br />
            <br /> 비밀번호 <input name="pw" type="password"> <button> 로그인 </button>
            <br /> </form>
            <br /> <button onClick="location.href='JoinUs.jsp'"> 아이디 찾기 </button>
            <button onClick="location.href='JoinUs.jsp'"> 비밀번호 찾기 </button>
            <button onClick="location.href='Join.jsp'"> 회원가입 </button>
            <%
        } 
        // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
        else {
            out.print(session.getAttribute("id") + " 님 환영합니다");
            %>
            <h1> 로그인 페이지 </h1> 
            <br /> <form action="LogOut.jsp" method="post">
            <br />
            <br /> <button> 로그아웃 </button>
            <br />
            <br /> </form>
            <br /> <button onClick="location.href='CHANGEPROFILE.jsp'"> 개인정보 변경</button>
            <%
        }
    %>
    
                
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>

        $("#wrapper").toggleClass("toggled");
    
    </script>

</body>

</html>
