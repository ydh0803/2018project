<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html lang="en">

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
 
    <%
    // �α׾ƿ� ��ư�� ������ ���ԵǴ� ���ε�
    // session�� ������ؼ� ����� ������ ������
    session.invalidate();
    // �׸��� �ٽ� LOGIN.jsp�� ���ư��� �Ѵ�
    response.sendRedirect("LOGIN.jsp"); 
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
