package sogeti.omaha.recruiting;

import java.util.ArrayList;
import java.util.List;


public class SendEmailBean {
	
private List<String> sogetiPassCandidates;
	
	@SuppressWarnings("unchecked")
	public List<String> getSogetiPassCandidates(){
		sogetiPassCandidates = new ArrayList<String>();
		String sendEmailQuery = "WITH CS AS"
	         		+ " ("
	         		+ " SELECT *,"
	         		+ " ROW_NUMBER() OVER"
	         		+ " ("
	         		+ " PARTITION BY Candidate_ID"
	         		+ " ORDER BY Date_Updated DESC"
	         		+ " ) AS Recency"
	         		+ " FROM Candidate_Stage_Table"
	         		+ " )"
	         		+ " Select C.First_Name + ' ' + C.Last_Name + '|' + ISNULL(C.email,'no-email-in-record')"
	         		+ " from  Candidate_Table C, Stage_Table S, CS"
	         		+ " where S.Stage_ID = CS.Stage_ID"
	         		+ " and C.Candidate_ID = CS.Candidate_ID"
	         		+ " and CS.Recency = 1"
	         		+ " and S.Stage_ID = 9"
	         		+ " and CS.email_sent_flag = 'N'";
	    
		sogetiPassCandidates = (ArrayList<String>) new DBConnectHelper().getDbConnection(sendEmailQuery, "select", "list");;
	        
		return sogetiPassCandidates;		
	}

}
