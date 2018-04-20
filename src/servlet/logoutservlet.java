package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
* Servlet implementation class Logout_servlet
*/
@WebServlet("/Banking/logoutservlet")
public class logoutservlet extends HttpServlet {
                private static final long serialVersionUID = 1L;
   
                protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                                // TODO Auto-generated method stub
                                
                                PrintWriter out=response.getWriter();  
                                 
                                  request.getRequestDispatcher("Login.html").include(request, response);  
                                  
                                  HttpSession session = request.getSession(false);
                                  if(session!=null)
                                  session.invalidate();
                                  out.println("<script type=\"text/javascript\">");
                                                out.println("alert('Logout successful!!');");
                                                  
                                                 out.println("</script>");
         
           
                }

}
