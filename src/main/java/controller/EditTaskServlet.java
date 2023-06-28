package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TaskDAO;
import model.Task;

/**
 * Servlet implementation class EditTaskServlet
 */
public class EditTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String taskIdParam = request.getParameter("taskId");
	    int taskId = Integer.parseInt(taskIdParam);
	    System.out.println(taskId);
	    
	    Task task = TaskDAO.getTaskById(taskId);
	    
	    System.out.println(task.getCreationDate());
	    request.setAttribute("task", task);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("editTask.jsp");
	    dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String taskIdParam = request.getParameter("taskId");
	    int taskId = Integer.parseInt(taskIdParam);

	    String title = request.getParameter("title");
	    String description = request.getParameter("description");
	    String creationDate = request.getParameter("creationDate");
	    String completionDate = request.getParameter("completionDate");

	    Task task = TaskDAO.getTaskById(taskId);
	    if (completionDate.isEmpty()) {
	        completionDate = null;
	    } else {
	    	task.setStatus("completed");
	    }
	    task.setTitle(title);
	    task.setDescription(description);
	    task.setCreationDate(creationDate);
	    task.setCompletionDate(completionDate);
	    
	    TaskDAO.updateTask(task);

	    response.sendRedirect("TaskListServlet");
	}

}
