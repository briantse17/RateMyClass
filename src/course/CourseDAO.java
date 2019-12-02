package course;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

	String url = "jdbc:mysql://google/RMC?cloudSqlInstance=ornate-course-255422:us-central1:lab-8&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false";
	String sqlUser = "giovannl";
	String sqlPassword = "giovanni";
	
	public int createCourse(String name, String id, String desc) throws ClassNotFoundException, SQLException {
		//attempts to create a course, if succeed then return 0, if course already exist then returns 1
		
		//check if class already exist by internal course id
		List<Course> result = searchCourse(id);
		if(result.size() != 0) return 1;
		
		//create class
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword);
		
		String sql = "INSERT INTO Courses(CourseName, IntCourseID, CourseDesc, Difficulty, Workload, GPA, NumOfRatings) VALUES(?, ?, ?, 0,0,0,0)";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, name);
		statement.setString(2, id);
		statement.setString(3, desc);
		
		statement.execute();
		
		conn.close();
		
		return 0;
	}
	
	public List<Course> searchCourse(String searchString) throws SQLException, ClassNotFoundException {
		searchString = searchString.toLowerCase();
		searchString = searchString.replaceAll("\\s", "");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword);
		
		String sql = "SELECT * FROM Courses";
		PreparedStatement statement = conn.prepareStatement(sql);
		
		ResultSet result = statement.executeQuery();
		
		List<Course> courses = new ArrayList<Course>();
		while(result.next()) {
			String intCourseID = result.getString("IntCourseID");
			if(intCourseID.contentEquals(searchString) || intCourseID.substring(0,4).contentEquals(searchString)) {
				courses.add(new Course(result));
			}
		}
		
		conn.close();
		
		return courses;
	}
}

