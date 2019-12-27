package user;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		// authenticate user
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDAO userDAO = new UserDAO();
		
		try {
			User user = userDAO.checkLogin(username, password);
			String destination = "LoginPage.jsp";
			if(user == null){//no username
				String m = "This user does not exist.";
				request.setAttribute("message", m);
			}
			else if(user.getPassword() == null){//wrong password
				String m = "Incorrect password";
				request.setAttribute("message", m);
			}
			else {//authenticated
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				destination = request.getParameter("from");
				if (destination.equals("null")) destination = "HomePage.jsp";
			}
			
			response.sendRedirect(destination);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
