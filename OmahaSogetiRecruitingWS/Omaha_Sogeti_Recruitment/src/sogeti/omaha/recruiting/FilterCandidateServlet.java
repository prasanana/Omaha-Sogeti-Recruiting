package sogeti.omaha.recruiting;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FilterCandidateServlet
 */
public class FilterCandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterCandidateServlet() {
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
		
		Map<String, List<String>> filterCandidateSkills = new sogeti.omaha.recruiting.FilterCandidateBean().getSkills();
		List<String> filterCandidatesDetails = new sogeti.omaha.recruiting.FilterCandidateBean().getCandidateDetails();
		request.setAttribute("filterCandidateSkills", filterCandidateSkills);
		request.setAttribute("filterCandidatesDetails", filterCandidatesDetails);
		request.getRequestDispatcher("FilterCandidates.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
