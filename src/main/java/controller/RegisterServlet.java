package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;
import java.sql.SQLException;

/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
	    String username = request.getParameter("login");
	    String email = request.getParameter("email");

	    UserDAO userDAO = null;
		try {
			userDAO = new UserDAO();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    if (userDAO.isUserExists(username, email)) {
	    	String errorMessage = "The username or email is already in use. Please, choose another one.";
	    	request.setAttribute("errorMessage", errorMessage);
	    	request.getRequestDispatcher("index.jsp").forward(request, response);
	    } else {
	        String password = request.getParameter("password");
	        String name = request.getParameter("name");

	        User newUser = new User(username, password, name, email);
	        userDAO.insertUser(newUser);

	        response.sendRedirect("paginaPrincipal.jsp");
	    }
        
    }

}
