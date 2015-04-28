package sogeti.omaha.recruiting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UpdateCandidateStageBean {
	
	private List<String> updateStage;
	private Map<String, String> stages;

	@SuppressWarnings("unchecked")
	public Map<String, String> getStages() {
		this.stages = new HashMap<String, String>();
		 String stagesQuery = "select stage_id,stage from Stage_Table order by stage_id";
       
		 this.stages = (HashMap<String, String>) new DBConnectHelper().getDbConnection(stagesQuery, "select", "map");
        
		return stages;
	}

	@SuppressWarnings("unchecked")
	public List<String> getUpdateStage() {
		this.updateStage = new ArrayList<String>();
		
	         String updateStageQuery = "WITH CS AS"
	         		+ " ("
	         		+ " SELECT *,"
	         		+ " ROW_NUMBER() OVER"
	         		+ " ("
	         		+ " PARTITION BY Candidate_ID"
	         		+ " ORDER BY Date_Updated DESC "
	         		+ ") AS Recency"
	         		+ " FROM Candidate_Stage_Table "
	         		+ " )"
	         		+ " Select C.First_Name + '|' + C.Last_Name + '|' + S.stage"
	         		+ " + '|' + CONVERT(Varchar,CS.Date_Updated,0) + '|' +"
	         		+ " ISNULL(CS.comments,'Enter Comments Here') + '|' +"
	         		+ " CAST(C.Candidate_ID as varchar(5))"
	         		+ " + '|' + CAST(S.Stage_ID as varchar(5))"
	         		+ " from  Candidate_Table C, Stage_Table S, CS"
	         		+ " where S.Stage_ID = CS.Stage_ID"
	         		+ " and C.Candidate_ID = CS.Candidate_ID"
	         		+ " and CS.Recency = 1";
	         
	         this.updateStage = (ArrayList<String>) new DBConnectHelper().getDbConnection(updateStageQuery, "select", "list");
	         
		return updateStage;
	}
	
	public void updateStageDetails(String stages, String comments){
		
			String[] stagesParts = stages.split("\\|", -1);
			String[] commentsParts = comments.split("\\|", -1);
			
			for (int i=0; i<stagesParts.length; i++){
				String updateStageQuery = "INSERT INTO Candidate_Stage_Table"
						+ "(Candidate_ID, Stage_ID, Date_Updated, comments) "
						+ " VALUES("+Integer.parseInt(stagesParts[i].split("\\#")[0])+","+Integer.parseInt((stagesParts[i].split("\\#")[1]))+""
								+ ",CURRENT_TIMESTAMP, null)";
				new DBConnectHelper().getDbConnection(updateStageQuery, "update", "");
			}
			
			for (int i=0; i<commentsParts.length; i++){
				String updateCommentsQuery = "UPDATE Candidate_Stage_Table"
						+ " SET comments = '" +commentsParts[i].split("\\#")[1]+ "', "
								+ "Date_Updated = CURRENT_TIMESTAMP"
								+ " FROM Candidate_Stage_Table t1"
								+ " INNER JOIN "
								+ " (SELECT candidate_id,max(Date_Updated) as LatestDate FROM Candidate_Stage_Table "
								+ " GROUP BY candidate_id) t2 "
								+ " ON t1.candidate_id = t2.candidate_id and t1.Date_Updated = t2.LatestDate "
								+ " and t1.candidate_id = " + Integer.parseInt(commentsParts[i].split("\\#")[0]);
				new DBConnectHelper().getDbConnection(updateCommentsQuery, "update", "");
			}
		
	}

}
