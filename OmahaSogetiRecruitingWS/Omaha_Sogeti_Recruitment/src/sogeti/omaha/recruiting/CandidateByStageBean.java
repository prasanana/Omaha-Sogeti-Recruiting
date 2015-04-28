package sogeti.omaha.recruiting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class CandidateByStageBean {
	
	private Map<String,List<String>> stageContainer;

	@SuppressWarnings("unchecked")
	public Map<String, List<String>> getStageContainer(String candidateByStageDate) {
		//System.out.println("Hello");
		List<String> stages = new ArrayList<String>();
		String queryDate;
		this.stageContainer = new HashMap<String, List<String>>();
		
		if(candidateByStageDate.equals("today")){
			queryDate = " and CAST(CS.Date_Updated AS date) <= CAST(CURRENT_TIMESTAMP AS date)";
		}
		else
		{
			queryDate = " and CAST(CS.Date_Updated AS date) <= CAST('"+candidateByStageDate+"' AS date)";
		}
		String stagesQuery = "select stage,stage_id from Stage_Table order by stage_id";
       	 stages = (ArrayList<String>) new DBConnectHelper().getDbConnection(stagesQuery, "select", "list");;
	         
	         for(int i=0;i<stages.size();i++){	        	 
	        	 String candidateQuery = "WITH CS AS"
	         		+ " ("
	         		+ " SELECT *,"
	         		+ " ROW_NUMBER() OVER"
	         		+ " ("
	         		+ " PARTITION BY Candidate_ID"
	         		+ " ORDER BY Date_Updated DESC "
	         		+ ") AS Recency"
	         		+ " FROM Candidate_Stage_Table "
	         		+ " )"
	         		+ " Select C.First_Name + ' ' + C.Last_Name"
	         		+ " from  Candidate_Table C, Stage_Table S, CS"
	         		+ " where S.Stage_ID = CS.Stage_ID"
	         		+ " and C.Candidate_ID = CS.Candidate_ID"
	         		+ " and CS.Recency = 1"
	         		+ " and S.stage like '"+stages.get(i)+"'"
	         		+ queryDate;
	        	 
	        	 List<String> tempStages = new ArrayList<String>();
	        	 	tempStages = (ArrayList<String>) new DBConnectHelper().getDbConnection(candidateQuery, "select", "list");;
	        	 this.stageContainer.put(stages.get(i), tempStages);
	         }
	        
		return stageContainer;
	}


}
