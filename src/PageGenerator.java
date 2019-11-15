

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PageGenerator
 */
@WebServlet("/PageGenerator")
public class PageGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageGenerator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null, rsLikes = null;
		String courseID =  request.getParameter("courseID");
		try {
			conn = DriverManager.getConnection("");
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM Courses;");
			rs = st.executeQuery("SELECT * FROM Comments WHERE CourseId=" + courseID + ";");
			while (rs.next()) {
				// make comment objects, put into course objects
				int CommentID = rs.getInt("CommentID");
				String CommentBody = rs.getString("Body");
				Date date = rs.getDate("Time");
				Comment temp = new Comment(CommentID, CommentBody, date);
				rsLikes = st.executeQuery("SELECT LikeValue FROM Likes WHERE CommentID='" + CommentID + "';");
				while (rsLikes.next()) {
					temp.addLikeValue(rsLikes.getInt("LikeValue"));
				}
			}
			rs = st.executeQuery("SELECT * FROM Likes WHERE ;");
			while (rs.next()) {
				// add like information to comment objects
			}
			request.setAttribute("Page", "");
			RequestDispatcher rd = request.getRequestDispatcher("");
			rd.forward(request, response);
		} catch (SQLException e) {
			
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
