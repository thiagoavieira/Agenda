package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Task;


public class TaskDAO {
    public static List<Task> getTasksByUsername(String username) {
        List<Task> tasks = new ArrayList<>();
        String queryUserId = "SELECT id FROM usuarios WHERE login = ?";
        String queryTasks = "SELECT * FROM tarefas WHERE usuario_id = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statementUserId = connection.prepareStatement(queryUserId);
             PreparedStatement statementTasks = connection.prepareStatement(queryTasks)) {

            statementUserId.setString(1, username);
            ResultSet resultSetUserId = statementUserId.executeQuery();
            int userId = 0;

            if (resultSetUserId.next()) {
                userId = resultSetUserId.getInt("id");
            }

            statementTasks.setInt(1, userId);
            ResultSet resultSetTasks = statementTasks.executeQuery();

            while (resultSetTasks.next()) {
            	int taskId = resultSetTasks.getInt("id");
                String title = resultSetTasks.getString("titulo");
                String description = resultSetTasks.getString("descricao");
                String creationDate = resultSetTasks.getString("data_criacao");
                String completionDate = resultSetTasks.getString("data_conclusao");
                String status = resultSetTasks.getString("status");

                Task task = new Task(title, description, creationDate, completionDate, status, userId);
                task.setId(taskId);
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }
    
    public static int saveTask(Task task) {
        String query = "INSERT INTO tarefas (titulo, descricao, data_criacao, data_conclusao, status, usuario_id) VALUES (?, ?, ?, ?, ?, ?)";
        int taskId = -1;

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, task.getTitle());
            statement.setString(2, task.getDescription());
            statement.setString(3, task.getCreationDate());
            statement.setString(4, task.getCompletionDate());
            statement.setString(5, task.getStatus());
            statement.setInt(6, task.getUserId());
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                taskId = generatedKeys.getInt(1); // obtém o ID gerado
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return taskId; // retorna o ID da tarefa salva
    }
    
    public static void removeTask(int taskId) {
        String query = "DELETE FROM tarefas WHERE id = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, taskId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static Task getTaskById(int taskId) {
        String query = "SELECT * FROM tarefas WHERE id = ?";
        Task task = null;
        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, taskId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String title = resultSet.getString("titulo");
                String description = resultSet.getString("descricao");
                String creationDate = resultSet.getString("data_criacao");
                String completionDate = resultSet.getString("data_conclusao");
                String status = resultSet.getString("status");
                int userId = resultSet.getInt("usuario_id");
                
                task = new Task(title, description, creationDate, completionDate, status, userId);
                task.setId(taskId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return task;
    }
    
    public static void updateTask(Task task) {
        String query = "UPDATE tarefas SET titulo = ?, descricao = ?, data_conclusao = ?, status = ? WHERE id = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, task.getTitle());
            statement.setString(2, task.getDescription());
            statement.setString(3, task.getCompletionDate());
            statement.setString(4, task.getStatus());
            statement.setInt(5, task.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static List<Task> getInProgressTasksByUsername(String username) {
        List<Task> inProgressTasks = new ArrayList<>();
        String queryUserId = "SELECT id FROM usuarios WHERE login = ?";
        String queryTasks = "SELECT * FROM tarefas WHERE usuario_id = ? AND status = 'incomplete'";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statementUserId = connection.prepareStatement(queryUserId);
             PreparedStatement statementTasks = connection.prepareStatement(queryTasks)) {

            statementUserId.setString(1, username);
            ResultSet resultSetUserId = statementUserId.executeQuery();
            int userId = 0;

            if (resultSetUserId.next()) {
                userId = resultSetUserId.getInt("id");
            }

            statementTasks.setInt(1, userId);
            ResultSet resultSetTasks = statementTasks.executeQuery();

            while (resultSetTasks.next()) {
                int taskId = resultSetTasks.getInt("id");
                String title = resultSetTasks.getString("titulo");
                String description = resultSetTasks.getString("descricao");
                String creationDate = resultSetTasks.getString("data_criacao");
                String completionDate = resultSetTasks.getString("data_conclusao");
                String status = resultSetTasks.getString("status");

                Task task = new Task(title, description, creationDate, completionDate, status, userId);
                task.setId(taskId);
                inProgressTasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inProgressTasks;
    }
    
    public static List<Task> getCompletedTasksByUsername(String username) {
        List<Task> completedTasks = new ArrayList<>();
        String queryUserId = "SELECT id FROM usuarios WHERE login = ?";
        String queryTasks = "SELECT * FROM tarefas WHERE usuario_id = ? AND status = 'completed'";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statementUserId = connection.prepareStatement(queryUserId);
             PreparedStatement statementTasks = connection.prepareStatement(queryTasks)) {

            statementUserId.setString(1, username);
            ResultSet resultSetUserId = statementUserId.executeQuery();
            int userId = 0;

            if (resultSetUserId.next()) {
                userId = resultSetUserId.getInt("id");
            }

            statementTasks.setInt(1, userId);
            ResultSet resultSetTasks = statementTasks.executeQuery();

            while (resultSetTasks.next()) {
                int taskId = resultSetTasks.getInt("id");
                String title = resultSetTasks.getString("titulo");
                String description = resultSetTasks.getString("descricao");
                String creationDate = resultSetTasks.getString("data_criacao");
                String completionDate = resultSetTasks.getString("data_conclusao");
                String status = resultSetTasks.getString("status");

                Task task = new Task(title, description, creationDate, completionDate, status, userId);
                task.setId(taskId);
                completedTasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return completedTasks;
    }
}