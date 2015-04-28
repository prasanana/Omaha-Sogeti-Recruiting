package sogeti.omaha.recruiting;

import java.util.HashMap;
import java.util.Map;

public class ModifyCandidateDetailsBean {
	
	private Map<String, String> candidateDetails;

	@SuppressWarnings("unchecked")
	public Map<String, String> getCandidateDetails() {
		
		this.candidateDetails = new HashMap<String, String>();
		String candidateDetailsQuery = "SELECT candidate_id, "
									+ " first_name + ' ' + last_name"
									+ " FROM Candidate_Table";
		
		this.candidateDetails = (HashMap<String, String>) new DBConnectHelper().getDbConnection(candidateDetailsQuery, "select", "map");
		
		return candidateDetails;
	}

}
