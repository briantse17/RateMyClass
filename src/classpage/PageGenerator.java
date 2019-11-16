package classpage;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import obj.Comment;
import obj.Course;
import obj.DAO;

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
		
		String CourseJson =  request.getParameter("course");
		int UserID = Integer.parseInt(request.getParameter("user"));
		Gson gson = new Gson();
		Course curr = gson.fromJson(CourseJson, Course.class);
		
		try {
			DAO db = new DAO("root", "Jk3v1n$$7$$7");
			List<Comment> comments = db.getComments(curr.getCourseID(), UserID);
			curr.setComments(comments);
			
			request.setAttribute("Page", curr);
			RequestDispatcher rd = request.getRequestDispatcher("");
			rd.forward(request, response);
		} catch (SQLException e) {
			request.setAttribute("error", "There was an error.");
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
