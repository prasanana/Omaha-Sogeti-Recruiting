package sogeti.omaha.recruiting;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCandidateServlet
 */
public class AddCandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCandidateServlet() {
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
		//System.out.println(request.getSession().getAttribute("sessionUserGuid"));
		
		List<String> addCandidateLevels = new sogeti.omaha.recruiting.AddCandidateBean().getLevels();
		request.setAttribute("addCandidateLevels", addCandidateLevels);
		
		Map<String,String> addCandidateMethods = new sogeti.omaha.recruiting.AddCandidateBean().getMethods();
		request.setAttribute("addCandidateMethods", addCandidateMethods);
		
		Map<String,String> addCandidatePractices = new sogeti.omaha.recruiting.AddCandidateBean().getPractices();
		request.setAttribute("addCandidatePractices", addCandidatePractices);
		
		Map<String,String> addCandidateStages = new sogeti.omaha.recruiting.AddCandidateBean().getStages();
		request.setAttribute("addCandidateStages", addCandidateStages);
		
		String skillSet = new sogeti.omaha.recruiting.AddCandidateBean().getSkillSet();
		request.setAttribute("skillSet", skillSet);
		//System.out.println(skillSet);
		
		request.getRequestDispatcher("AddCandidate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//System.out.println(request.getParameter("AddCandidateFirstName"));
				//System.out.println(request.getParameter("AddCandidateMethod"));
				//System.out.println(request.getParameter("AddCandidateSKill"));
				new sogeti.omaha.recruiting.AddCandidateBean().insertCandidateDetails(request.getParameter("AddCandidateFirstName"), request.getParameter("AddCandidateLastName"), 
						request.getParameter("AddCandidateLinkedIn"), request.getParameter("AddCandidateEmail"), 
						request.getParameter("AddCandidateSKill"), request.getParameter("AddCandidateComments"), 
						request.getParameter("AddCandidateMethod"), request.getParameter("AddCandidateMethodReferal"), 
						request.getParameter("AddCandidateLevel"), request.getParameter("AddCandidatePractice"),
						request.getParameter("AddCandidateStage"), request.getParameter("AddCandidatePhone"),
						request.getParameter("AddCandidateSalary"));
				
				request.getRequestDispatcher("AddCandidateSuccess.jsp").forward(request, response);
	}

}
