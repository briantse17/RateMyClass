

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LikeHandler
 */
@WebServlet("/LikeHandler")
public class LikeHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		int LikeValue = Integer.parseInt(request.getParameter("likeValue"));
		String error = "";
		String userID = request.getParameter("user");
		String commentID = request.getParameter("comment");
		String query = "SELECT * FROM Likes WHERE UserID='" + userID + "' AND CommentID='" + commentID + "'; ";
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/Sample?cloudSqlInstance=final-project-db-258304:us-central1:temp-db&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=justinyh&password=justinyh");
			st = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
			rs = st.executeQuery(query);
			if (!rs.next()) {
				st.execute("INSERT INTO Likes (UserID, CommentID, LikeValue) values (" + userID + ", " + commentID + ", " + LikeValue + ");");
			}
			else {
				int currLike = rs.getInt("LikeValue");
				if (currLike == LikeValue) rs.deleteRow();
				else {
					rs.updateInt("LikeValue", LikeValue);
					rs.updateRow();
				}
			}
			conn.close();
			st.close();
			rs.close();
			
		}
		catch (SQLException e) {
			response.setStatus(500);
			PrintWriter pw = response.getWriter();
			pw.print("Error connecting to the database. Try again later.");
			pw.flush();
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
