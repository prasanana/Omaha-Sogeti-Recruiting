package sogeti.omaha.recruiting;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCandidateStageServlet
 */
public class UpdateCandidateStageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCandidateStageServlet() {
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
		
		List<String> updateStage = new sogeti.omaha.recruiting.UpdateCandidateStageBean().getUpdateStage();
		Map<String,String> updateStageStages = new sogeti.omaha.recruiting.UpdateCandidateStageBean().getStages();
		request.setAttribute("updateStage", updateStage);
		request.setAttribute("updateStageStages", updateStageStages);
		request.getRequestDispatcher("UpdateCandidateStage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("In Post");
				//here is update call
				//System.out.println(request.getParameter("updatedStages"));
				//System.out.println(request.getParameter("updatedComments"));
				new sogeti.omaha.recruiting.UpdateCandidateStageBean().updateStageDetails(request.getParameter("updatedStages"), request.getParameter("updatedComments"));
				request.getRequestDispatcher("UpdateStageSuccess.jsp").forward(request, response);
	}

}
