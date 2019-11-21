package obj;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Course {
	int CourseID;
	String CourseName;
	String IntCourseID;
	String CourseDesc;
	int Difficulty;
	int Workload;
	int GPA;
	int NumOfRatings;
	List<Comment> Comments;
	boolean currUserCommented;
	
	public Course(ResultSet res) throws SQLException {
		CourseID = res.getInt(1);
		CourseName = res.getString(2);
		IntCourseID = res.getString(3);
		CourseDesc = res.getString(4);
		Difficulty = res.getInt(5);
		Workload = res.getInt(6);
		GPA = res.getInt(7);
		NumOfRatings = res.getInt(8);
		Comments = new ArrayList<Comment>();
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
	
	public int getDifficulty() {
		return Difficulty;
	}
	
	public int getWorkload() {
		return Workload;
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
	
	/**
	 * Adds comment to the comment list.
	 * @param comment
	 */
	public void addComment(Comment comment) {
		Comments.add(comment);
	}
}
