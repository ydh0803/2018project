<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

<title> Login_Check </title>
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
    <h1> 로그인 체크 페이지 </h1>
    
    <%
    try {
        // 드라이버 로딩
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        // 관리자 Login
        String url = "jdbc:oracle:thin:@192.168.54.82:1521:myoracle";
        String id = "qwerasdf";
        String pw = "12345678";
        
        // 연결
        Connection conn = DriverManager.getConnection(url, id, pw);
        
         // sql 구사
         // 전 페이지인 LOGIN.jsp input에 입력한 값들을 변수에 담는다
         String user_id= request.getParameter("input_id");
         String user_pw= request.getParameter("input_pw");
         
        Statement st = conn.createStatement();
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        String sql = "SELECT * FROM USERTABLE WHERE USER_ID='" + user_id + "' AND USER_PW='" + user_pw + "'";
        st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);
        
        // isLogin 은 로그인 확인 유무를 위한 변수
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
            isLogin = true;
        }
        
        // DB에 내가 적은 정보가 있다면
        if(isLogin) {
            // 지금 로그인할 id와 pw를 session에 저장하고
            session.setAttribute("id", user_id); 
            session.setAttribute("pw", user_pw);
            // 첫 페이지로 돌려보낸다
            response.sendRedirect("LogIn.jsp");    
        } else {
            // DB에 내가적은 정보가 없다면 경고창을 띄워준다
            %> <script> alert("로그인 실패"); history.go(-1); </script> <%            
        }
        
        
    } catch (Exception e) {       
        out.println("아이디 또는 비밀번호가 일치하지 않습니다.");
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