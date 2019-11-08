package course;

import java.sql.*;

public class Course {
	int CourseID;
	String CourseName;
	String IntCourseID;
	String CourseDesc;
	int Difficulty;
	int Workload;
	int GPA;
	int NumOfRatings;
	
	public Course(ResultSet res) throws SQLException {
		CourseID = res.getInt(1);
		CourseName = res.getString(2);
		IntCourseID = res.getString(3);
		CourseDesc = res.getString(4);
		Difficulty = res.getInt(5);
		Workload = res.getInt(6);
		GPA = res.getInt(7);
		NumOfRatings = res.getInt(8);
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
}
