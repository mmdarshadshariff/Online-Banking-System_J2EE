package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class signup_servlet
 */
@WebServlet("/Banking/signupservlet")
public class signup_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public signup_servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		//out.print("welcome");
		 try 
		 {
        Class.forName("oracle.jdbc.driver.OracleDriver");
       
        try{
        
              Connection con=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:inatp02","shobana","shobana");
             
            	  Statement stmt=con.createStatement(); 
                  Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
                  Date date = calendar.getTime();
                  int year = calendar.get(Calendar.YEAR);

              String s=String.valueOf(year);
              String b="RBM";
              String ac=b.concat(s);
              long d=100000001;
              String count="select count(*) from xbbl6df_db";
              ResultSet rs=stmt.executeQuery(count);
            //  System.out.println(count);
              
              if(!rs.next())
              { 
            	  System.out.println("hi");
              }
              else{
                     //out.println("welcome"+rs.getString(1)); 
                   //  if(Integer.parseInt(rs.getString(1))!=0)
                   //  {
            	  System.out.println("hai");
                    d=d+Integer.parseInt(rs.getString(1));
                     String a=String.valueOf(d);
                    String AccountNo=ac.concat(a);
                  // out.println(AccountNo); 
                    String query="insert into xbbl6df_db  values('"+request.getParameter("t1")+"','"+request.getParameter("t2")+"',"+request.getParameter("t3")+",'"+request.getParameter("t4")+"','"+request.getParameter("t6")+"','"+request.getParameter("t8")+"',"
                            + "'"+request.getParameter("t9")+"','"+request.getParameter("t10")+"','"+request.getParameter("t0")+"',"+request.getParameter("t11")+","
                            		+ "'"+request.getParameter("t12")+"','"+request.getParameter("t13")+"','"+request.getParameter("t14")+"','"+AccountNo+"','"+request.getParameter("t15")+"')";
                    System.out.println(query);
                    int i=stmt.executeUpdate(query);
              //System.out.println(query);
                    System.out.println("hai wel");
                           if(i>0)    
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

//	}

}catch (SQLException e) {
	// TODO: handle exception
}
		 }
		catch (ClassNotFoundException e) {
			// TODO: handle exception
		}
		
	}
}
