<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Task List</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        #checklist {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        
        .task-item {
            display: flex;
            align-items: center;
        }
        
        .task-item input[type="checkbox"] {
            margin-right: 10px;
        }
        
        .add-task {
            display: flex;
            gap: 10px;
            align-items: center;
            margin-top: 10px;
        }
        
        .add-task input[type="text"] {
            width: 200px;
        }
        
        .add-task button {
            padding: 5px 10px;
            background-color: royalblue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .add-task button:hover {
            background-color: rgb(56, 90, 194);
        }
    </style>
</head>
<body>
    <h1>Task List</h1>
    
    <div id="checklist">
        <%-- Verifica se a lista de tarefas está vazia --%>
        <% if (taskList.isEmpty()) { %>
            <p>Não há tarefas cadastradas.</p>
        <% } else { %>
            <%-- Itera sobre a lista de tarefas --%>
            <% for (Task task : taskList) { %>
                <div class="task-item" id="checklist">
                    <input type="checkbox" id="<%= task.getId() %>" <% if (task.isCompleted()) { out.print("checked"); } %>>
                    <label for="<%= task.getId() %>"><%= task.getName() %></label>
                </div>
            <% } %>
        <% } %>
        
        <div class="add-task">
            <input type="text" id="newTaskInput" placeholder="Nova tarefa">
            <button id="addTaskButton">Adicionar</button>
        </div>
    </div>
</body>
</html>