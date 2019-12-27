package classpage;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import obj.Course;
import obj.ClassDAO;
import user.User;

/**
 * Servlet implementation class PageGenerator
 */
@WebServlet("/classpage")
public class ClassPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int UserID = -1;
		if (user != null) {
			UserID = user.getID();
		}
		int CourseID = Integer.parseInt(request.getParameter("class"));
		try {
			ClassDAO db = new ClassDAO();
			Course currCourse = db.getCourseInfo(CourseID, UserID);
			System.out.println(currCourse);
			session.setAttribute("Course", currCourse);
			request.setAttribute("Course", currCourse);
			RequestDispatcher rd = request.getRequestDispatcher("/ClassPage.jsp");
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
