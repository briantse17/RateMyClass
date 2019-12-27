package course;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CourseCreationServlet
 */
@WebServlet("/createCourse")
public class CourseCreationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseCreationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// clean up fields and attempts to create course, if succeed redirects to course page,
		//if not then redirects back to creation page and outputs error message.
		String courseName = request.getParameter("courseName").trim();
		String courseID = request.getParameter("courseID");
		String description = request.getParameter("courseDesc").trim();
		courseID = courseID.replaceAll("\\s", "");
		courseID = courseID.toUpperCase();
		
		CourseDAO courseDAO = new CourseDAO();
		
		try {
			String destination = "ClassCreation.jsp";
			
			if(courseDAO.createCourse(courseName, courseID, description) == 1) {
				String m = "Course already exists.";
				request.setAttribute("message", m);
			}
			else {
				destination = "HomePage.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(destination);
			dispatcher.forward(request, response);
			
		} catch (SQLException | ClassNotFoundException e) {
			throw new ServletException(e);
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
