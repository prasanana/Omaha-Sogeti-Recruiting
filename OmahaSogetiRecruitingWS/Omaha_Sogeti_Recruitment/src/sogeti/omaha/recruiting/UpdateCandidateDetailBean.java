package sogeti.omaha.recruiting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UpdateCandidateDetailBean {

	String firstName;
	String lastname;
	String linkedIn;
	String referrer;
	String skillSet;
	String email;
	String phoneNo;
	String salary;
	String comments;
	Map<String, String> method;
	String level;
	Map<String, String> practice;
	Map<String, String> methodList;
	List<String> levelList;
	Map<String, String> practiceList;
	private String skillSets;

	public String getFirstName(String candidateID) {
		String firstNameQuery = "SELECT first_name" + " FROM Candidate_Table"
				+ " WHERE candidate_id = " + Integer.parseInt(candidateID);
		firstName = (String) new DBConnectHelper().getDbConnection(
				firstNameQuery, "select", "string");
		return firstName;
	}

	public String getLastname(String candidateID) {
		String lastNameQuery = "SELECT last_name" + " FROM Candidate_Table"
				+ " WHERE candidate_id = " + Integer.parseInt(candidateID);
		lastname = (String) new DBConnectHelper().getDbConnection(
				lastNameQuery, "select", "string");
		return lastname;
	}

	public String getLinkedIn(String candidateID) {
		String linkedInQuery = "SELECT ISNULL(linkedin_profile,'Enter LinkedIn Profile')"
				+ " FROM Candidate_Table"
				+ " WHERE candidate_id = "
				+ Integer.parseInt(candidateID);
		linkedIn = (String) new DBConnectHelper().getDbConnection(
				linkedInQuery, "select", "string");
		return linkedIn;
	}

	public String getReferrer(String candidateID) {
		String referrerQuery = "SELECT ISNULL(refered_by,'No Referrer')"
				+ " FROM Candidate_Table" + " WHERE candidate_id = "
				+ Integer.parseInt(candidateID);
		referrer = (String) new DBConnectHelper().getDbConnection(
				referrerQuery, "select", "string");
		return referrer;
	}

	public String getSkillSet(String candidateID) {
		String skillsQuery = "SELECT ISNULL(skillset,'Add Skills')"
				+ " FROM Candidate_Table" + " WHERE candidate_id = "
				+ Integer.parseInt(candidateID);
		skillSet = (String) new DBConnectHelper().getDbConnection(skillsQuery,
				"select", "string");
		return skillSet;
	}

	public String getEmail(String candidateID) {
		String emailQuery = "SELECT ISNULL(email,'Enter Email')"
				+ " FROM Candidate_Table" + " WHERE candidate_id = "
				+ Integer.parseInt(candidateID);
		email = (String) new DBConnectHelper().getDbConnection(emailQuery,
				"select", "string");
		return email;
	}

	public String getPhoneNo(String candidateID) {
		String phoneQuery = "SELECT ISNULL(phone, 'Enter Phone Number')"
				+ " FROM Candidate_Table" + " WHERE candidate_id = "
				+ Integer.parseInt(candidateID);
		phoneNo = (String) new DBConnectHelper().getDbConnection(phoneQuery,
				"select", "string");
		return phoneNo;
	}

	public String getSalary(String candidateID) {
		String salaryQuery = "SELECT ISNULL(salary_expectation,'Enter Salary Expectations')"
				+ " FROM Candidate_Table"
				+ " WHERE candidate_id = "
				+ Integer.parseInt(candidateID);
		salary = (String) new DBConnectHelper().getDbConnection(salaryQuery,
				"select", "string");
		return salary;
	}

	public String getComments(String candidateID) {
		String commentsQuery = "SELECT ISNULL(comments,'Enter Comments')"
				+ " FROM Candidate_Table" + " WHERE candidate_id = "
				+ Integer.parseInt(candidateID);
		comments = (String) new DBConnectHelper().getDbConnection(
				commentsQuery, "select", "string");
		return comments;
	}

	@SuppressWarnings("unchecked")
	public Map<String, String> getMethod(String candidateID) {
		method = new HashMap<String, String>();
		String methodsQuery = "Select m.method_id, m.method"
				+ " from Method_Table m, Candidate_Method_Table cm"
				+ " where cm.Method_ID = m.Method_ID"
				+ " and cm.Candidate_ID = " + Integer.parseInt(candidateID);
		method = (Map<String, String>) new DBConnectHelper().getDbConnection(
				methodsQuery, "select", "Map");
		return method;
	}

	public String getLevel(String candidateID) {
		String levelsQuery = "SELECT level " + " FROM Candidate_Level_Table"
				+ " WHERE Candidate_ID = " + Integer.parseInt(candidateID);
		level = (String) new DBConnectHelper().getDbConnection(levelsQuery,
				"select", "string");
		return level;
	}

	@SuppressWarnings("unchecked")
	public Map<String, String> getPractice(String candidateID) {
		practice = new HashMap<String, String>();
		String practicesQuery = "Select p.practice_id, p.practice_name"
				+ " from Practice_Table p, Candidate_Practice_Table cp"
				+ " where cp.Practice_ID = p.Practice_ID"
				+ " and cp.Candidate_ID = " + Integer.parseInt(candidateID);
		practice = (HashMap<String, String>) new DBConnectHelper()
				.getDbConnection(practicesQuery, "select", "map");
		return practice;
	}

	@SuppressWarnings("unchecked")
	public Map<String, String> getMethodList() {
		methodList = new HashMap<String, String>();

		String methodsQuery = "SELECT Method_ID, Method FROM Method_Table";
		methodList = (Map<String, String>) new DBConnectHelper()
				.getDbConnection(methodsQuery, "select", "Map");
		return methodList;
	}

	@SuppressWarnings("unchecked")
	public List<String> getLevelList() {
		levelList = new ArrayList<String>();
		String levelsQuery = "SELECT Level FROM Level_Table";
		levelList = (ArrayList<String>) new DBConnectHelper().getDbConnection(
				levelsQuery, "select", "list");
		return levelList;
	}

	@SuppressWarnings("unchecked")
	public Map<String, String> getPracticeList() {
		practiceList = new HashMap<String, String>();
		String practicesQuery = "SELECT Practice_ID, Practice_Name FROM Practice_Table";
		practiceList = (HashMap<String, String>) new DBConnectHelper()
				.getDbConnection(practicesQuery, "select", "map");
		return practiceList;
	}

	public String getSkillSets() {
		String skillSetQuery = "SELECT Skill FROM Skills_Table";
		skillSets = (String) new DBConnectHelper().getDbConnection(
				skillSetQuery, "select", "multipleString");
		return skillSets;
	}

	public void updateCandidateDetails(String firstName, String lastname,
			String linkedIn, String email, String skills, String comments,
			String methodId, String referrer, String level, String practiceId,
			String phoneNumber, String salary, String newCandidateID) {
		
		String referreName = "";
		/*
		 * System.out.println("FistName: " + firstName);
		 * System.out.println("lastname: " + lastname);
		 * System.out.println("linkedIn: " + linkedIn);
		 * System.out.println("email: " + email); System.out.println("skils: " +
		 * skills); System.out.println("comments: " + comments);
		 * System.out.println("methodId: " + methodId);
		 * System.out.println("referrer: " + referrer);
		 * System.out.println("level: " + level); 
		 * System.out.println("practiceId: " + practiceId);
		 */

		if (methodId.equals("1")) {
			referreName = referrer;
		}

		String updateCandidateTableQuery = "UPDATE Candidate_Table SET "
						+ " Last_Name = '"+lastname+"',"
						+ " First_Name = '"+firstName+"',"
						+ " LinkedIn_Profile = '"+linkedIn+"',"
						+ " Skillset = '"+skills+"',"
						+ " Refered_By = '"+referreName+"', "
						+ " Date_Updated = CURRENT_TIMESTAMP,"
						+ " Comments = '"+comments+"',"
						+ " email = '"+email+"',"
						+ " phone = '"+phoneNumber+"',"
						+ " salary_expectation= '"+salary+"'"
						+ " WHERE Candidate_ID = " + Integer.parseInt(newCandidateID);
		
		int updatedRows = (int) new DBConnectHelper().getDbConnection(
				updateCandidateTableQuery, "update", "");

		if (updatedRows > 0) {

			// Insert Into Candidate_Methods Table
			String updateCandidateMethodTableQuery = "UPDATE Candidate_Method_Table SET "
					+ "Method_ID = " + Integer.parseInt(methodId)
					+ ", Date_Updated = CURRENT_TIMESTAMP"
					+ " WHERE Candidate_ID = " + Integer.parseInt(newCandidateID);

			new DBConnectHelper().getDbConnection(
					updateCandidateMethodTableQuery, "update", "");

			// Insert into Candidate_Practice Table

			String updateCandidatePracticeTableQuery = "UPDATE Candidate_Practice_Table SET"
					+ " Practice_ID = " + Integer.parseInt(practiceId)
					+ ", Date_Updated = CURRENT_TIMESTAMP"
					+ " WHERE Candidate_ID = " + Integer.parseInt(newCandidateID);
			
			new DBConnectHelper().getDbConnection(
					updateCandidatePracticeTableQuery, "update", "");

			// Insert into Candidate_Level Table

			String updateCandidateLevelTableQuery = "UPDATE Candidate_Level_Table SET "
					+ "Level = '" + level + "'"
					+ ", Date_Updated = CURRENT_TIMESTAMP"
					+ " WHERE Candidate_ID = " + Integer.parseInt(newCandidateID);

			new DBConnectHelper().getDbConnection(
					updateCandidateLevelTableQuery, "update", "");

			// Insert into Skills table
			String[] skillArray = skills.split(",");
			for (int i = 0; i < skillArray.length; i++) {
				if (skillArray[i].trim() != null
						&& !skillArray[i].trim().isEmpty()) {
					
					//Delete all existing records for this candidate and insert back the new records
					
					String deleteCandidateSkillsQuery = "DELETE FROM Candidate_Skills_Table "
							+ " WHERE Candidate_ID = " + Integer.parseInt(newCandidateID);
					
					new DBConnectHelper().getDbConnection(
							deleteCandidateSkillsQuery, "update", "");
					
					String insertCandidateSkillsTableQuery = "INSERT INTO Candidate_Skills_Table "
							+ "VALUES("
							+ newCandidateID
							+ ", '"
							+ skillArray[i].trim() + "', CURRENT_TIMESTAMP)";
					// System.out.println(insertCandidateSkillsTableQuery);
					new DBConnectHelper().getDbConnection(
							insertCandidateSkillsTableQuery, "update", "");
				}
			}
		}

	}
}
