package search;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import obj.Course;

public class SearchDAO {

	String url = "jdbc:mysql://google/RMC?cloudSqlInstance=ornate-course-255422:us-central1:lab-8&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false";
	String sqlUser = "giovannl";
	String sqlPassword = "giovanni";
	
	public List<Course> searchDB(String searchString) throws SQLException, ClassNotFoundException {
		searchString = searchString.toLowerCase();
		searchString = searchString.replaceAll("\\s", "");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword);
		
		String sql = "SELECT * FROM Courses WHERE CourseName = ? OR IntCourseID = ?";
		PreparedStatement statement = conn.prepareStatement(sql); 
		statement.setString(1, searchString);
		statement.setString(2, searchString);
		
		ResultSet result = statement.executeQuery();
		
		List<Course> courses = new ArrayList<Course>();
		while(result.next()) {
			courses.add(new Course(result));
		}
		
		conn.close();
		
		return courses;
	}
}
