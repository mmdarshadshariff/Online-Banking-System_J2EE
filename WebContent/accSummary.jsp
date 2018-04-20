<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String uname=request.getParameter("val");  
		System.out.println(uname);
	if(uname==null||uname.trim().equals("")){  
	      // System.out.println("sahana");

	}
	else
	{  
	try{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con = DriverManager.getConnection(
	              "jdbc:oracle:thin:@10.232.71.29:1521:inatp02",
	              "shobana", "shobana");
	Statement pstmt = con.createStatement();
	String sql="select * from xbbl6df_db where username like'"+uname+"%'";  // h% means names starting with h
	System.out.println(sql);
	ResultSet rs=pstmt.executeQuery(sql);  
	 System.out.println("sahana1");
	if(rs.isBeforeFirst()) {      
		out.println("<table class='table' ");
	    out.println("<tr>");
	    out.println("<th>Username</th>");
	    out.println("<th>Email</th>");
	    out.println("<th>Mobile</th>");
	    out.println("<th>Password</th>");
	    out.println("<th>Address</th>");
	    out.println("<th>City</th>");
	    out.println("<th>State</th>");
	    out.println("<th>Country</th>");
	    out.println("<th>Name</th>");
	    out.println("<th>Age</th>");
	    out.println("<th>Gender</th>");
	    out.println("<th>Account Type</th>");
	    out.println("<th>Date Of Birth</th>");
	    out.println("<th>Account No</th>");
	    out.println("<th>Amount</th>");
	    out.println("</tr>");
	    while(rs.next())
	    {
	    	/* String username=rs.getString(1);
	    	System.out.print(username); */
	    	out.print("<tr><td>"+rs.getString(1)+"</td>");
	    	out.print("<td>"+rs.getString(2)+"</td>");
	    	out.print("<td>"+rs.getString(3)+"</td>");
	    	out.print("<td>"+rs.getString(4)+"</td>");
	    	out.print("<td>"+rs.getString(5)+"</td>");
	    	out.print("<td>"+rs.getString(6)+"</td>");
	    	out.print("<td>"+rs.getString(7)+"</td>");
	    	out.print("<td>"+rs.getString(8)+"</td>");
	    	out.print("<td>"+rs.getString(9)+"</td>");
	    	out.print("<td>"+rs.getString(10)+"</td>");
	    	out.print("<td>"+rs.getString(11)+"</td>");
	    	out.print("<td>"+rs.getString(12)+"</td>");
	    	out.print("<td>"+rs.getString(13)+"</td>");
	    	out.print("<td>"+rs.getString(14)+"</td>");
	    	out.print("<td>"+rs.getString(15)+"</td></tr>");
	    	
	    }
	    out.println("</table>");
	   
	con.close();  

	}
	else{
		 System.out.println("sahana1456");

	}

	}catch(Exception e){
		out.print(e);
		}  
	}
	%>


</body>
</html>