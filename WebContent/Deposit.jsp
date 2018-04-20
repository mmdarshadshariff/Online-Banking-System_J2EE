<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deposit</title>
</head>
<body>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:inatp02","shobana","shobana");

       Statement stmt=con.createStatement();  

       int j=Integer.parseInt(request.getParameter("d1"));
       
       int i=stmt.executeUpdate("update xbbl6df_db set amount=amount+'"+j+"' where username='"+session.getAttribute("username")+"'");
       ResultSet rs=stmt.executeQuery("select amount from xbbl6df_db where username='"+session.getAttribute("username")+"'");
       
       if(rs.next())
       {
    	 //  System.out.println("hello");
              int amount=rs.getInt(1);
            //  System.out.println(amount);
                           
       %>
       <script>
       
       alert('deposited successfully!! your new balance is <%=amount%>');
       
       location='Welcome.jsp';   
       </script>
       <%
       }
       %>
</body>
</html>

