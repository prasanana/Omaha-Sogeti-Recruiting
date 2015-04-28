package sogeti.omaha.recruiting;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CandidateByStageServlet
 */
public class CandidateByStageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateByStageServlet() {
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
		
		Map<String, List<String>> stagesAndCandidates;
		String candidateByStageDate = request.getParameter("candidateByStageDate");
		if(candidateByStageDate == null){
			stagesAndCandidates = new sogeti.omaha.recruiting.CandidateByStageBean().getStageContainer("today");
		}else{
			stagesAndCandidates = new sogeti.omaha.recruiting.CandidateByStageBean().getStageContainer(candidateByStageDate);
		}
			
		request.setAttribute("stagesAndCandidates", stagesAndCandidates);
		request.getRequestDispatcher("CandidateByStage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
