<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

       Connection con=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:inatp02","shobana","shobana");

       Statement stmt=con.createStatement();  

       String o=request.getParameter("opas");
       String n=request.getParameter("npas");
       
       int i=stmt.executeUpdate("update xbbl6df_db set password='"+n+"' where username='"+session.getAttribute("username")+"' and password='"+o+"'");
     
       
       if(i>0)
       {
    	 //  System.out.println("hello");
            
            //  System.out.println(amount);
                           
      
       
       out.print("<script>");
       out.print("alert('changed successful!!');");
       out.print("location='Welcome.jsp'"); 
       out.print("</script>");
       
         
       
       
       }
      
       else{
    	   out.println("failure");
       }
       %>
</body>
</html>