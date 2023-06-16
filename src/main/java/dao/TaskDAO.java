package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                String title = resultSetTasks.getString("titulo");
                String description = resultSetTasks.getString("descricao");
                String creationDate = resultSetTasks.getString("data_criacao");
                String completionDate = resultSetTasks.getString("data_conclusao");
                String status = resultSetTasks.getString("status");

                Task task = new Task(title, description, creationDate, completionDate, status, userId);
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }
    
    public static void saveTask(Task task) {
        String query = "INSERT INTO tarefas (titulo, descricao, data_criacao, data_conclusao, status, usuario_id) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, task.getTitle());
            statement.setString(2, task.getDescription());
            statement.setString(3, task.getCreationDate());
            statement.setString(4, task.getCompletionDate());
            statement.setString(5, task.getStatus());
            statement.setInt(6, task.getUserId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}