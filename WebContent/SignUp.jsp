<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.io.PrintWriter"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	
	String uname=request.getParameter("t1");
	String eid=request.getParameter("t2");
	String num=request.getParameter("t3");
	String pass=request.getParameter("t4");
	String cpass=request.getParameter("t5");
	String addr=request.getParameter("t6");
	String city=request.getParameter("t8");
	String state=request.getParameter("t9");
	String country=request.getParameter("t10");	
	String name=request.getParameter("t0");
	String age=request.getParameter("t11");
	String gender=request.getParameter("t12");
	String acctype=request.getParameter("t13");
	String dob=request.getParameter("t14");
	
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:inatp02", "shobana",
                "shobana");
		Statement stmt=conn.createStatement();
		
		Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        Date date = calendar.getTime();
        int year = calendar.get(Calendar.YEAR);

    String s=String.valueOf(year);
    String b="RBM";
    String ac=b.concat(s);
    long d=100000001;
		
		String sql="select * from xbbl6df_db where username='"+uname+"'";
		ResultSet rs=stmt.executeQuery(sql);
		
		if(rs.next()){      // compares the value in the ResultSet to the element present in the database rows using next() function
			out.println("<h1>Already Exists</h1>");
		}
		else{
			 if(Integer.parseInt(rs.getString(1))!=0)
             {
            d=d+Integer.parseInt(rs.getString(1));
             String a=String.valueOf(d);
            String AccountNo=ac.concat(a);
          // out.println(AccountNo); 
          			
			
		sql = "INSERT INTO xbbl6df_db VALUES ('"+uname+"','"+eid+"','"+num+"','"+pass+"','"+addr+"','"+city+"','"+state+"','"+country+"','"+name+"','"+age+"','"+gender+"','"+acctype+"','"+dob+"','"+AccountNo+"')";
		
		 System.out.println(sql);
		 
		 int noOfRows = stmt.executeUpdate(sql);
               
		 if(noOfRows>0)    
         {
         /*  out.println("<script type=\"text/javascript\">");
                        out.println("alert('Inserted successfully!!');");
                           out.println("location='Login.html';");
                        out.println("</script>");
            */
      	 response.sendRedirect("Login.html");
         }         
                         else  
                         {
                               out.println("<script type=\"text/javascript\">");
                               out.println("alert('please try again!!');");
                                  out.println("location='Signup.html';");
                               out.println("</script>");
                         }
       
		}
		rs.close();
         stmt.close();
         conn.close();
	}
	}catch(SQLException e){
		 e.printStackTrace();
	}
%>


</body>
</html>