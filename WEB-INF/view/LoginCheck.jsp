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

    <title>��� ������</title>

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
                        ��� ������
                    </a>
                </li>
                <li>
                    <a href="BandInfo.jsp">��� ����</a>
                </li>
                <li>
                    <a href="SongReview.jsp">���� �ı�</a>
                </li>
                <li>
                    <a href="TodayLegend.jsp">������ ���</a>
                </li>
                <li>
                    <a href="LogIn.jsp">����������</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
    <h1> �α��� üũ ������ </h1>
    
    <%
    try {
        // ����̹� �ε�
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        // ������ Login
        String url = "jdbc:oracle:thin:@192.168.54.82:1521:myoracle";
        String id = "qwerasdf";
        String pw = "12345678";
        
        // ����
        Connection conn = DriverManager.getConnection(url, id, pw);
        
         // sql ����
         // �� �������� LOGIN.jsp input�� �Է��� ������ ������ ��´�
         String user_id= request.getParameter("input_id");
         String user_pw= request.getParameter("input_pw");
         
        Statement st = conn.createStatement();
        // ���� �Է��� id�� pw ���� DB�ȿ� �ִ��� Ȯ���Ѵ�
        String sql = "SELECT * FROM USERTABLE WHERE USER_ID='" + user_id + "' AND USER_PW='" + user_pw + "'";
        st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);
        
        // isLogin �� �α��� Ȯ�� ������ ���� ����
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next�� true ��� = ������ �ִ�
            isLogin = true;
        }
        
        // DB�� ���� ���� ������ �ִٸ�
        if(isLogin) {
            // ���� �α����� id�� pw�� session�� �����ϰ�
            session.setAttribute("id", user_id); 
            session.setAttribute("pw", user_pw);
            // ù �������� ����������
            response.sendRedirect("LogIn.jsp");    
        } else {
            // DB�� �������� ������ ���ٸ� ���â�� ����ش�
            %> <script> alert("�α��� ����"); history.go(-1); </script> <%            
        }
        
        
    } catch (Exception e) {       
        out.println("���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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