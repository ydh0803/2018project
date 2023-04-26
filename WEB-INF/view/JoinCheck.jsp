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
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar.css" rel="stylesheet" type="text/css">

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="index.jsp">
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
        // JOIN.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다
        String his_id     = request.getParameter("JOIN_id");
        String his_pw     = request.getParameter("JOIN_pw");
        String his_hobby= request.getParameter("JOIN_hobby");
        
        try {
            // 드라이버 로딩
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            
            // 관리자 Login
            String url = "jdbc:oracle:thin:@192.168.54.82:1521:myoracle";
            String id = "qwerasdf";
            String pw = "12345678";
            
            // 연결
            // INSERT 해달라 USERTABLE에 
            // id, pw, hobby 라는 필드를 가진
            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();
            String sql = "INSERT INTO USERTABLE VALUES ('" + his_id + 
                    "','" + his_pw + 
                    "','" + his_hobby + 
                    "')";
            st.executeUpdate(sql);
            
            // 회원가입에 성공하였으면 첫 페이지로 보낸다
            response.sendRedirect("LogIn.jsp");        
            
        } catch (Exception e) {       
            out.println("DB 연동 실패");
        }    
    %>


출처: http://parkdex.tistory.com/145 [PARKDEX]
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