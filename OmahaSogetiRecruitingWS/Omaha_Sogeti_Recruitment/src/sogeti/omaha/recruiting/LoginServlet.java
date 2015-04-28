package sogeti.omaha.recruiting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("Username and Password - " + request.getParameter("userName") + " " + request.getParameter("password"));
		String checkUser = new sogeti.omaha.recruiting.LoginBean().checkUser(request.getParameter("userName"), request.getParameter("password"));
		if(checkUser.equalsIgnoreCase("userExists")){
			String userGuid = Long.toString(System.currentTimeMillis()) + request.getParameter("userName").replace(".","");
			request.getSession().setAttribute("sessionUserGuid", userGuid);
			request.getRequestDispatcher("Index.jsp").forward(request, response);
		}
		else {
			request.setAttribute("NoUser", "User Name or Password does not match!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);	
		}
	}

}
