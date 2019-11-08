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
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
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
		//register a new user
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordConf = request.getParameter("password-conf");
		
		UserDAO userDAO = new UserDAO();
		
		try {
			String destination = "RegisterPage.jsp";
			
			if(!password.equals(passwordConf)) {//password dont match
				String m = "The passwords do not match";
				request.setAttribute("message", m);
			}
			else if(password.isEmpty() || username.isEmpty()) {
				String m = "Password and Username cannot be empty.";
				request.setAttribute("message", m);
			}
			else if(!username.matches("^[a-zA-Z0-9]*$")) {
				String m = "Username should be alphanumeric.";
				request.setAttribute("message", m);
			}
			else if(userDAO.createUser(username, password) == 1) {//username taken
				String m = "This username is already taken";
				request.setAttribute("message", m);
			}
			else {//user created
				User user = userDAO.checkLogin(username, password);
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				destination = "HomePage.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(destination);
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
