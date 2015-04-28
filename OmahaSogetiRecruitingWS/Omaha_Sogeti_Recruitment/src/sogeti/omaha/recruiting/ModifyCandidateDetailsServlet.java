package sogeti.omaha.recruiting;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ModifyCandidateDetailsServlet
 */
public class ModifyCandidateDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCandidateDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userGuid = (String) request.getSession().getAttribute("sessionUserGuid");
		if(userGuid == null){
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}
		Map<String,String> candidateDetails = new sogeti.omaha.recruiting.ModifyCandidateDetailsBean().getCandidateDetails();
		request.setAttribute("candidateDetails", candidateDetails);
		request.getRequestDispatcher("ModifyCandidateDetails.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
