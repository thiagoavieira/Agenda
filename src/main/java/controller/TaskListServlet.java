package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TaskDAO;
import dao.UserDAO;
import model.Task;

/**
 * Servlet implementation class TaskListServlet
 */
public class TaskListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            // redireciona para a tela de login se não estiver logado
            response.sendRedirect("login.jsp");
            return;
        }

        // busca as tarefas do usuário
        String username = (String) session.getAttribute("username");
        List<Task> tasks = TaskDAO.getTasksByUsername(username);

        // seta as tarefas como atributo da requisição
        request.setAttribute("tasks", tasks);
        
        System.out.println("OLHA EU AQUI: " + tasks);
        // encaminha para o JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("paginaPrincipal.jsp");
        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if (action != null && action.equals("remove")) {
            // Remove a tarefa do banco de dados
        	String taskIdParam = request.getParameter("taskId");
        	int taskId = Integer.parseInt(taskIdParam);
            System.out.println(taskId);
            TaskDAO.removeTask(taskId);
        } else {
            // Adiciona uma nova tarefa ao banco de dados
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String username = (String) session.getAttribute("username");

            String creationDate = LocalDate.now().toString();

            int userId = UserDAO.getUserIdByUsername(username);

            Task newTask = new Task(title, description, creationDate, null, "incomplete", userId);

            int taskId = TaskDAO.saveTask(newTask); // obtém o ID da tarefa salva
            newTask.setId(taskId);
            System.out.println(taskId);
        }

        response.sendRedirect("TaskListServlet");
    }

}
