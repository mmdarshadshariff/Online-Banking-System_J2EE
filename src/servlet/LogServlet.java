package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Banking/LogServlet")  

public class LogServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request,
                     HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs=  request.getSession();    
		//used to create a session
		String name=request.getParameter("t1");
		
		System.out.println(name);
		hs.setAttribute("nnname", name);
              PrintWriter out = response.getWriter();
         
              
              System.out.println("success");
              String login_id = request.getParameter("t1");  
              String pass = request.getParameter("t4");
              try {
                     Class.forName("oracle.jdbc.driver.OracleDriver");    
                     Connection conn = DriverManager.getConnection(
                                  "jdbc:oracle:thin:@10.232.71.29:1521:inatp02", "shobana",
                                  "shobana");  
                   
                     
                     Statement pstmt = conn.createStatement();

                     String sql = "select * from xbbl6df_db where username='"+login_id+"' and password='"+pass+"'";
                                  
                     System.out.println(sql);
      
                     
                     ResultSet rs = pstmt.executeQuery(sql);
                     if (rs.next()) {
                           String uname1 = rs.getString("username");      
                           String email1 = rs.getString("email");  // REFERS TO 2ND COLUMN
                           String mob1=rs.getString("mobile");
                           String pass1=rs.getString("password");
                           String addr1=rs.getString("address");
                           String city1=rs.getString("city");
                           String state1=rs.getString("state");
                           String country1=rs.getString("country");
                           String name1=rs.getString("name");
                           String age1=rs.getString("age");
                           String gender1=rs.getString("gender");
                           String acctype1=rs.getString("account_type");
                           
                           String dob1=rs.getString("dateofbirth");
                           int amount1=rs.getInt("amount");
                           
                           
                           
                           hs.setAttribute("username", uname1);
                           hs.setAttribute("email", email1);
                           hs.setAttribute("name", name1);
                           hs.setAttribute("address", addr1);                                                 
                           hs.setAttribute("mobno", mob1);
                           hs.setAttribute("country", country1);
                           hs.setAttribute("state", state1);
                           hs.setAttribute("age", age1); 
                           hs.setAttribute("gender", gender1); 
                           hs.setAttribute("acctype", acctype1);                            
                           hs.setAttribute("dob", dob1); 
                           hs.setAttribute("amount", amount1); 
                          // System.out.println(uname1);
                           

                           
                          /* 
                           * System.out.println(uname);
                           System.out.println(pass1);
                           
                         */
                           response.sendRedirect("Welcome.jsp"); 
                           
                     }
                     else
                     {
                    	                    	 
                    	
                     }
                           rs.close();
                           pstmt.close();
                           conn.close();
                     
              } catch (Exception e) {
                     // TODO Auto-generated catch block
                     e.printStackTrace();
              }

       }

}


