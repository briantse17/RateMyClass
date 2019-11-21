package classpage;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import obj.DAO;

/**
 * Servlet implementation class LikeHandler
 */
@WebServlet("/like")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int LikeValue = Integer.parseInt(request.getParameter("likeValue"));
		int UserID = Integer.parseInt(request.getParameter("user"));
		int CommentID = Integer.parseInt(request.getParameter("comment"));
		
		try {
			DAO dbHandler = new DAO();
			dbHandler.updateLikes(UserID, CommentID, LikeValue);
		} catch(SQLException e) {
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
