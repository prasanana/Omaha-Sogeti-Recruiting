package sogeti.omaha.recruiting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class FilterCandidateBean {
	
	List<String> skills;
	List<String> candidateDetails;
	Map<String,List<String>> skillset;
	@SuppressWarnings("unchecked")
	public Map<String, List<String>> getSkills() {
		skillset = new HashMap<String,List<String>>();
		skills = new ArrayList<String>();
		List<String> skillType = new ArrayList<String>();
		String skillTypeQuery = "SELECT DISTINCT Skill_Type FROM Skills_Table";
		skillType = (ArrayList<String>) new DBConnectHelper().getDbConnection(skillTypeQuery, "select", "list");
		for(int i=0; i<skillType.size(); i++){
			String skillsQuery = "SELECT skill FROM Skills_Table where Skill_Type = '"+skillType.get(i)+"'";
		    skills = (ArrayList<String>) new DBConnectHelper().getDbConnection(skillsQuery, "select", "list");
		    skillset.put(skillType.get(i), skills);
		}
	     
	     return skillset;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getCandidateDetails() {
		candidateDetails = new ArrayList<String>();
		Map<String,String> candidateDetailsTemp = new HashMap<String,String>();
		String method = "";
		String practice = "";
		String level = "";
		String candidateId = "";
		String CandidateDetails = "";
		String candidateDetailsQuery = "select Candidate_ID, First_Name + ' ' + Last_Name "
	         		+ " + '_' + ISNULL(LinkedIn_Profile,'no linkedin profile')"
	         		//+ " + '_' + ISNULL(Skillset,'no skills associated') +  "
	         		+ "+ '_' + ISNULL(Refered_By, 'not a referal') + '_' + ISNULL(comments,'') "
	         		+ "+ '_' + ISNULL(email,'') "
	         		+ "from Candidate_Table";
	   candidateDetailsTemp = (HashMap<String, String>) new DBConnectHelper().getDbConnection(candidateDetailsQuery, "select", "map");

	        @SuppressWarnings("rawtypes")
			Iterator it = candidateDetailsTemp.entrySet().iterator();
	         while (it.hasNext()) {
	            @SuppressWarnings("rawtypes")
				Map.Entry pair = (Map.Entry)it.next();
	             //System.out.println(pair.getKey() + " = " + pair.getValue());
	             //it.remove(); // avoids a ConcurrentModificationException
	             candidateId = (String) pair.getKey();
	             CandidateDetails = (String) pair.getValue();
	             List<String> skills = new ArrayList<String>();
	     		String skillSet = "";
	             String skillsQuery = "SELECT Skill"
	             					+ " FROM Candidate_Skills_Table "
	             					+ " WHERE candidate_id = " + Integer.parseInt(candidateId);
	             
	             skills = (List<String>) new DBConnectHelper().getDbConnection(skillsQuery, "select", "list");
	             
	             String methodsQuery = "SELECT m.Method"
		        	 		+ " FROM Method_Table m, Candidate_Method_Table cm"
		        	 		+ " WHERE m.method_id = cm.method_id"
		        	 		+ " and cm.candidate_id = " + Integer.parseInt(candidateId);
		        	 method = (String)new DBConnectHelper().getDbConnection(methodsQuery, "select", "string");
		        	 
		        	 String levelQuery = "SELECT l.Level"
			        	 		+ " FROM Level_Table l, Candidate_Level_Table cl"
			        	 		+ " WHERE l.level = cl.level"
			        	 		+ " and cl.candidate_id = " + Integer.parseInt(candidateId);
			        	level = (String)new DBConnectHelper().getDbConnection(levelQuery, "select", "string");
			        	 
		        	 String practiceQuery = "SELECT p.practice_name"
			        	 		+ " FROM Practice_Table p, Candidate_Practice_Table cp"
			        	 		+ " WHERE p.practice_id = cp.practice_id"
			        	 		+ " and cp.candidate_id = " + Integer.parseInt(candidateId);
			        	 practice = (String)new DBConnectHelper().getDbConnection(practiceQuery, "select", "string");	
			        	 
			        	 for(int j=0; j<skills.size();j++){
			        		 skillSet = skillSet + " " + skills.get(j);
			        	 }
			        	 
			        	 candidateDetails.add(CandidateDetails + "_" + skillSet + "_" + method + "_" + level + "_" + practice);
			        	 //System.out.println(candidateId + "=" + CandidateDetails + "#" + method + "#" + level + "#" + practice);
	         }
	        return candidateDetails;
	}

}
