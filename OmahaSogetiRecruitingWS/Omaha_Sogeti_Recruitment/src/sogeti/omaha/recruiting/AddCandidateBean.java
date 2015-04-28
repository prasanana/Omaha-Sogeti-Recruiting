package sogeti.omaha.recruiting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import sogeti.omaha.recruiting.DBConnectHelper;


public class AddCandidateBean {
	
	private Map<String,String> methods;
	private Map<String,String> practices;
	private Map<String,String> stages;
	private String skillSet;
	private List<String> levels;
	@SuppressWarnings("unchecked")
	public Map<String, String> getMethods() {
		methods = new HashMap<String,String>();

	 String methodsQuery = "SELECT Method_ID, Method FROM Method_Table";
     methods = (Map<String, String>) new DBConnectHelper().getDbConnection(methodsQuery, "select", "Map");
	         
		return methods;
	}
	@SuppressWarnings("unchecked")
	public Map<String, String> getPractices() {
		practices = new HashMap<String,String>();
		String practicesQuery = "SELECT Practice_ID, Practice_Name FROM Practice_Table";
		practices = (HashMap<String, String>) new DBConnectHelper().getDbConnection(practicesQuery, "select", "map");
	    return practices;
	}
	@SuppressWarnings("unchecked")
	public List<String> getLevels() {
		levels = new ArrayList<String>();
		String levelsQuery = "SELECT Level FROM Level_Table";
		levels = (ArrayList<String>) new DBConnectHelper().getDbConnection(levelsQuery, "select", "list");
	    return levels;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, String> getStages() {
		stages = new HashMap<String,String>();
		String stagesQuery = "SELECT Stage_ID, Stage FROM Stage_Table";
		stages = (HashMap<String, String>) new DBConnectHelper().getDbConnection(stagesQuery, "select", "map");
	    return stages;
	}
	
	public String getSkillSet() {
		String skillSetQuery = "SELECT Skill FROM Skills_Table";
		skillSet = (String) new DBConnectHelper().getDbConnection(skillSetQuery, "select", "multipleString");
	    return skillSet;
	}
	
	
	
	public void insertCandidateDetails(String firstName, String lastname,
									   String linkedIn, String email, String skills,
									   String comments, String methodId, String referrer,
									   String level, String practiceId, String stageId, String phoneNumber,
									   String salary){
		String referreName = "";
		/*System.out.println("FistName: " + firstName);
		System.out.println("lastname: " + lastname);
		System.out.println("linkedIn: " + linkedIn);
		System.out.println("email: " + email);
		System.out.println("skils: " + skills);
		System.out.println("comments: " + comments);
		System.out.println("methodId: " + methodId);
		System.out.println("referrer: " + referrer);
		System.out.println("level: " + level);
		System.out.println("practiceId: " + practiceId);
		System.out.println("salary: " + salary);*/
		
		if(methodId.equals("1")){
			referreName = referrer;
		}
			int newCandidateID = 0;
			String lastCandidateIdQuery = "SELECT TOP 1 Candidate_ID FROM Candidate_Table "
	         		+ "ORDER BY Candidate_ID DESC";
	        	 newCandidateID = Integer.parseInt((String)new DBConnectHelper().getDbConnection(lastCandidateIdQuery, "select", "string")) + 1;
	            //System.out.println(newCandidateID);
	         
			String insertCandidateTableQuery = "SET IDENTITY_INSERT Candidate_Table ON;" 
					+ "INSERT INTO Candidate_Table"
					+ "(Candidate_ID, Last_Name, First_Name, LinkedIn_Profile, Skillset, Refered_By, "
					+ "Date_Added, Date_Updated, Comments, Use_Flag, email, phone, salary_expectation)"
					+ " VALUES("+newCandidateID+", '"+lastname+"', '"+firstName+"', '"+linkedIn+"', "
							+ "'"+skills+"', '"+referreName+"',  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, "
									+ "'"+comments+"', 'Y', '"+email+"', '"+phoneNumber+"', '"+salary+"')";
			int insertedRows = (int) new DBConnectHelper().getDbConnection(insertCandidateTableQuery, "update", "");
			
			if(insertedRows>0){
				
				//Insert Into Candidate_Methods Table
				String insertCandidateMethodTableQuery = "INSERT INTO Candidate_Method_Table "
						+ "VALUES("+newCandidateID+", "+methodId+", CURRENT_TIMESTAMP)";
				
				new DBConnectHelper().getDbConnection(insertCandidateMethodTableQuery, "update", "");
				
				
				//Insert into Candidate_Practice Table
				
				String insertCandidatePracticeTableQuery = "INSERT INTO Candidate_Practice_Table "
						+ "VALUES("+newCandidateID+", "+practiceId+", CURRENT_TIMESTAMP)";
				
				new DBConnectHelper().getDbConnection(insertCandidatePracticeTableQuery, "update", "");
				
				//Insert into Candidate_Level Table
				
				String insertCandidateLevelTableQuery = "INSERT INTO Candidate_Level_Table "
						+ "VALUES("+newCandidateID+", '"+level+"', CURRENT_TIMESTAMP)";
				
				new DBConnectHelper().getDbConnection(insertCandidateLevelTableQuery, "update", "");
				
				// Insert into Stage table
				
				String insertCandidateStageTableQuery = "INSERT INTO Candidate_Stage_Table "
						+ "VALUES("+newCandidateID+", "+stageId+", CURRENT_TIMESTAMP, '', 'N')";
				
				new DBConnectHelper().getDbConnection(insertCandidateStageTableQuery, "update", "");
				
				// Insert into Skills table
				String[] skillArray = skills.split(",");
				for(int i =0; i<skillArray.length;i++){
					if(skillArray[i].trim() != null && !skillArray[i].trim().isEmpty()){
				String insertCandidateSkillsTableQuery = "INSERT INTO Candidate_Skills_Table "
						+ "VALUES("+newCandidateID+", '"+skillArray[i].trim()+"', CURRENT_TIMESTAMP)";
				//System.out.println(insertCandidateSkillsTableQuery);
				new DBConnectHelper().getDbConnection(insertCandidateSkillsTableQuery, "update", "");
					}
				}
			}
			
			
	}

}
