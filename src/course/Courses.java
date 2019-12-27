package course;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.*;

/**
 * Servlet implementation class Courses
 */
@WebServlet("/Courses")
public class Courses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String CREDENTIALS_STRING = "jdbc:mysql://google/Sample?cloudSqlInstance=phonic-agility-255419:us-central1:fproject&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=username&password=password";
	static Connection connection = null;
	
    public Courses() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(CREDENTIALS_STRING);
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from Courses");
			ResultSet resultSet = preparedStatement.executeQuery();
			String id = request.getParameter("id");
			List<String> list = new ArrayList<>();
			while(resultSet.next()) {
				String IntCourseID = resultSet.getString("IntCourseID");
				if (IntCourseID.substring(0, Math.min(IntCourseID.length(), 4)).contentEquals(id)) {
					list.add("<tr><td class=\"link\" onclick=\"location.href=\'classpage?class="+resultSet.getInt("CourseID")+"\'\"><div style=\"text-align: left;\"><a style=\"text-decoration: none; color: black;\""+
				" href=\"classpage?class="+resultSet.getInt("CourseID")+"\">"+"<b>"+resultSet.getString("IntCourseID")+"</b>: "+resultSet.getString("CourseName")+"</a></div></td><td class=\"desc\"><div style=\"text-align: left;\">"+resultSet.getString("CourseDesc")+"</div></td></tr>");
				}
			}
			if (list.isEmpty()) {
				list.clear();
				list.add("<tr><td>There are no classes under this id in the database.</td></tr>");
			}
		    String json = new Gson().toJson(list);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
