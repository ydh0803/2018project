<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>밴드 갤러리</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="main.do">
                        밴드 갤러리
                    </a>
                </li>
                <li>
                    <a href="/WEB-INF/view/BandInfo.jsp">밴드 정보</a>
                </li>
                <li>
                    <a href="/WEB-INF/view/SongReview.jsp">감상 후기</a>
                </li>
                <li>
                    <a href="/WEB-INF/view/TodayLegend.jsp">오늘의 명곡</a>
                </li>
                <li>
                    <a href="/WEB-INF/view/LogIn.jsp">마이페이지</a>
                </li>
            </ul>
            
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
            <table style="height: 100%; width: 100%">
	<tr height="7%">
		<td>
				<%@include file="/WEB-INF/view/top.jsp" %>	
			</td>
	</tr>
</table>
                <h1>밴드 갤러리</h1>
                <p>여기는 밴드 갤러리 입니다.</p>
                <p>여러 밴드 정보를 볼 수 있습니다.</p>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    
        $("#wrapper").toggleClass("toggled");
    
    </script>

</body>

</html>
