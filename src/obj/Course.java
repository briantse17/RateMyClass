package obj;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Course {
	int CourseID;
	String CourseName;
	String IntCourseID;
	String CourseDesc;
	float Difficulty;
	float Usefulness;
	float Workload;
	float GPA;
	int NumOfRatings;
	List<Comment> Comments;
	List<Integer> DifficultyDist;
	List<Integer> GradeDist;
	List<Integer> UsefulDist;
	List<Integer> WorkloadDist;
	boolean currUserCommented;
	
	public Course(ResultSet res) throws SQLException {
		CourseID = res.getInt(1);
		CourseName = res.getString(2);
		IntCourseID = res.getString(3);
		CourseDesc = res.getString(4);
		Difficulty = 0.0f;
		Usefulness = 0.0f;
		Workload = 0.0f;
		GPA = 0.0f;
		NumOfRatings = res.getInt("NumOfRatings");
		Comments = new Vector<Comment>();
		DifficultyDist = new Vector<Integer>();
		GradeDist = new Vector<Integer>();
		UsefulDist = new Vector<Integer>();
		WorkloadDist = new Vector<Integer>();
		for (int i = 0; i < 5; i++) {
			DifficultyDist.add(0);
			GradeDist.add(0);
			UsefulDist.add(0);
			WorkloadDist.add(0);
		}
		currUserCommented = false;
	}
	
	public void toggleCurrUser() {
		currUserCommented = !currUserCommented;
	}
	
	public boolean getCurrUser() {
		return currUserCommented;
	}
	
	public int getCourseID() {
		return CourseID;
	}
	
	public String getCourseName() {
		return CourseName;
	}
	
	public String getIntCourseID() {
		return IntCourseID;
	}
	
	public String getCourseDesc() {
		return CourseDesc;
	}
	
	public float getDifficulty() {
		return Difficulty/NumOfRatings;
	}
	
	public float getUsefulness() {
		return Usefulness/NumOfRatings;
	}
	
	public int getNumOfRatings() {
		return NumOfRatings;
	}
	
	/**
	 * Returns a list of comments in the course.
	 * @return
	 */
	public List<Comment> getComments() {
		return Comments;
	}
	
	public boolean getUserCommented() {
		return this.currUserCommented;
	}
	
	public float getGPA() {
		System.out.println(GPA);
		System.out.println(NumOfRatings);
		return GPA/NumOfRatings;
	}
	
	public void addGrade(float grade) {
		String gradeToAdd;
		if(grade > 3.33) {
			int acount = GradeDist.get(0);
			GradeDist.set(0, acount+1);
		}
		else if (grade > 2.33) {
			int bcount = GradeDist.get(1);
			GradeDist.set(1, bcount+1);
		}
		else if (grade > 1.33) {
			int ccount = GradeDist.get(2);
			GradeDist.set(2, ccount+1);
		}
		else if (grade > 0.33) {
			int dcount = GradeDist.get(3);
			GradeDist.set(3, dcount+1);
		}
		else {
			int fcount = GradeDist.get(4);
			GradeDist.set(4, fcount+1);
		}
		
		GPA += grade;
		
	}
	
	public void addDifficulty(int difficulty){
		int count = this.DifficultyDist.get(difficulty-1);
		this.DifficultyDist.set(difficulty-1, count+1);
		Difficulty += difficulty;
	}
	
	public void addUsefulness(int usefulness){
		int count = this.UsefulDist.get(usefulness-1);
		this.UsefulDist.set(usefulness-1, count+1);
		Usefulness += usefulness;
	}
	
	public void addWorkload(int workload) {
		this.WorkloadDist.add(workload);
		Workload += workload;
	}
	
	public List<Integer> getDifficultyDist(){
		return this.DifficultyDist;
	}
	
	public List<Integer> getUsefulnessDist(){
		return this.UsefulDist;
	}
	
	public List<Integer> getGradeDist(){
		return this.GradeDist;
	}
	public List<Integer> getWorkloadDist(){
		return this.WorkloadDist;
	}
	/**
	 * Adds comment to the comment list.
	 * @param comment
	 */
	public void addComment(Comment comment) {
		Comments.add(comment);
	}
}
