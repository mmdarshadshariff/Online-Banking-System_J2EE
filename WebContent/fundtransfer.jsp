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
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    try {
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:inatp02","shobana","shobana");

                    Statement stmt=con.createStatement();  
                   
                   String accno=request.getParameter("d0");
                		  // session.getAttribute("acc")
                		   
                       	
                       	String uname=(String)session.getAttribute("username");
                		 
                		  
                    ResultSet rst=stmt.executeQuery("select username from xbbl6df_db where Accountno='"+request.getParameter("d0")+"'");
                     
                    if(rst.next())
                    {
                    	System.out.println(rst.getString(1)+"  "+uname);
                    if(rst.getString(1).trim().equals(uname))
                    {
                    ResultSet rs=stmt.executeQuery("select Amount from xbbl6df_db where Accountno='"+request.getParameter("d0")+"'");
                    if(rs.next())
                    {
                                    int k=Integer.parseInt((request.getParameter("d2")));
                    
                    if(rs.getInt(1)>k)
                    {
                                    int i=stmt.executeUpdate("update xbbl6df_db set amount=amount+'"+k+"' where Accountno='"+request.getParameter("d1")+"'");
                          int j=stmt.executeUpdate("update xbbl6df_db set amount=amount-'"+k+"' where Accountno='"+request.getParameter("d0")+"'");
                          if(j>0)
                          {
                                                    out.println("<script type=\"text/javascript\">");
                                                    out.println("alert('Transferred Successfully!!');");
                                                       out.println("location='Welcome.jsp';");
                                                    out.println("</script>");
                    }
                          }
                    else
                    {
                                    out.println("<script type=\"text/javascript\">");
                                                    out.println("alert('you don't have enough money to transfer!!');");
                                                       //out.println("location='funds.html';");
                                                    out.println("</script>");
                    }
                    }
                       }
                    else
                    {
                                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sorry !!');");
                       //out.println("location='LoginSuccess.html';");
                    out.println("</script>");
                    }
                    }
    }
                    catch (SQLException e) {
                                    // TODO Auto-generated catch block
                                    e.printStackTrace();
                    }
}
    catch (ClassNotFoundException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
    }                              






%>
</body>
</html>