<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <title>Task List</title>
    <style>
    	* {
	      margin: 0;
	      padding: 0;
	      box-sizing: border-box;
	    }
	
	    :root {
	      --hue: 210; /* Ajustar a cor por aqui */
	      --primary-color: hsl(var(--hue), 100%, 36%); /* Cor Primária */
	
	      --brand-beige: hsl(39, 100%, 97%); /* Bege de Fundo */
	      --brand-light: hsl(calc(var(--hue) - 22), 23%, 89%); /* Cores para os cards */
	      --brand-light-2: hsl(calc(var(--hue) + 10), 14%, 97%); /* Cores para os cards */
	
	      --bg-light: hsl(180, 14%, 97%); /* Cor de fundo branca com um pouco de destaque*/
	
	      font-size: 62.5%; /* Tamanho da fonte */
	
	      --nav-height: 8rem; /* Altura da barra de nav */
	    }
    	
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }
        
         /* Menu de Navegação*/
	    nav {
	      display: flex;
	      height: var(--nav-height);
	      position: fixed;
	      top: 0;
	      width: 100vw;
	      z-index: 100;
	      background: var(--primary-color);
	    }
	
	    nav .wrapper {
	      display: flex;
	      align-items: center;
	      justify-content: space-between;
	    }
	    
	
	    .menu {
	      transform: translateY(100%);
	    }
	
	    .menu ul li a {
	      color: white;
	      text-decoration: none;
	    }
	
	    #navigation .logo path[fill*='#00856F'] {
	      fill: var(--primary-color);
	    }
	    
	    .group {
		  display: flex;
		  line-height: 28px;
		  align-items: center;
		  position: fixed;
		  bottom: 20px;
		  right: 20px;
		  padding: 10px;
		  padding-right: 10px;
		  max-width: 190px;
		}
		
		.input {
		  height: 75px;
		  line-height: 28px;
		  padding: 0 0.5rem 0 1rem;
		  width: 200px;
		  outline: none;
		  background: royalblue;
		  color: #fff;
		  transition: .3s ease;
		  border: 2px solid;
		  border-image: white;
		}
		
		.input::placeholder {
		  color: white;
		}
		
		.input:focus::placeholder {
		  color: white;
		}
		
		.icon {
		  position: absolute;
		  right: 3rem;
		  fill: #fff;
		  width: 1.5rem;
		  height: 1.5rem; 
		}

	    /* outros */
        
        h1 {
            color: royalblue;
            text-align: center;
            margin-right: 15px;
        }
        
        #checklist {
        --background: #fff;
		  --text: #414856;
		  --check: #4f29f0;
		  --disabled: #c3c8de;
		  --width: 100px;
		  --height: 180px;
		  --border-radius: 10px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 510px;
            width: 100%;
        }

        #checklist label {
		  color: var(--text);
		  position: relative;
		  cursor: pointer;
		  display: grid;
		  align-items: center;
		  width: fit-content;
		  transition: color 0.3s ease;
		  margin-right: 20px;
		}
		
		#checklist label::before, #checklist label::after {
		  content: "";
		  position: absolute;
		}
		
		#checklist label::before {
		  height: 2px;
		  width: 8px;
		  left: -27px;
		  background: var(--check);
		  border-radius: 2px;
		  transition: background 0.3s ease;
		}
		
		#checklist label:after {
		  height: 4px;
		  width: 4px;
		  top: 8px;
		  left: -25px;
		  border-radius: 50%;
		}
		
		#checklist input[type="checkbox"] {
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  position: relative;
		  height: 15px;
		  width: 15px;
		  outline: none;
		  border: 0;
		  margin: 0 15px 0 0;
		  cursor: pointer;
		  background: var(--background);
		  display: grid;
		  align-items: center;
		  margin-right: 20px;
		}
		
		#checklist input[type="checkbox"]::before, #checklist input[type="checkbox"]::after {
		  content: "";
		  position: absolute;
		  height: 2px;
		  top: auto;
		  background: var(--check);
		  border-radius: 2px;
		}
		
		#checklist input[type="checkbox"]::before {
		  width: 0px;
		  right: 60%;
		  transform-origin: right bottom;
		}
		
		#checklist input[type="checkbox"]::after {
		  width: 0px;
		  left: 40%;
		  transform-origin: left bottom;
		}
		
		#checklist input[type="checkbox"]:checked::before {
		  animation: check-01 0.4s ease forwards;
		}
		
		#checklist input[type="checkbox"]:checked::after {
		  animation: check-02 0.4s ease forwards;
		}
		
		#checklist input[type="checkbox"]:checked + label {
		  color: var(--disabled);
		  animation: move 0.3s ease 0.1s forwards;
		}
		
		#checklist input[type="checkbox"]:checked + label::before {
		  background: var(--disabled);
		  animation: slice 0.4s ease forwards;
		}
		
		#checklist input[type="checkbox"]:checked + label::after {
		  animation: firework 0.5s ease forwards 0.1s;
		}
		
		@keyframes move {
		  50% {
		    padding-left: 8px;
		    padding-right: 0px;
		  }
		
		  100% {
		    padding-right: 4px;
		  }
		}
		
		@keyframes slice {
		  60% {
		    width: 100%;
		    left: 4px;
		  }
		
		  100% {
		    width: 100%;
		    left: -2px;
		    padding-left: 0;
		  }
		}
		
		@keyframes check-01 {
		  0% {
		    width: 4px;
		    top: auto;
		    transform: rotate(0);
		  }
		
		  50% {
		    width: 0px;
		    top: auto;
		    transform: rotate(0);
		  }
		
		  51% {
		    width: 0px;
		    top: 8px;
		    transform: rotate(45deg);
		  }
		
		  100% {
		    width: 5px;
		    top: 8px;
		    transform: rotate(45deg);
		  }
		}
		
		@keyframes check-02 {
		  0% {
		    width: 4px;
		    top: auto;
		    transform: rotate(0);
		  }
		
		  50% {
		    width: 0px;
		    top: auto;
		    transform: rotate(0);
		  }
		
		  51% {
		    width: 0px;
		    top: 8px;
		    transform: rotate(-45deg);
		  }
		
		  100% {
		    width: 10px;
		    top: 8px;
		    transform: rotate(-45deg);
		  }
		}
		
		@keyframes firework {
		  0% {
		    opacity: 1;
		    box-shadow: 0 0 0 -2px #4f29f0, 0 0 0 -2px #4f29f0, 0 0 0 -2px #4f29f0, 0 0 0 -2px #4f29f0, 0 0 0 -2px #4f29f0, 0 0 0 -2px #4f29f0;
		  }
		
		  30% {
		    opacity: 1;
		  }
		
		  100% {
		    opacity: 0;
		    box-shadow: 0 -15px 0 0px #4f29f0, 14px -8px 0 0px #4f29f0, 14px 8px 0 0px #4f29f0, 0 15px 0 0px #4f29f0, -14px 8px 0 0px #4f29f0, -14px -8px 0 0px #4f29f0;
		  }
		}
        .task-item {
            display: flex;
            align-items: center;
            font-size: 16px;
        }
        
        .task-item label {
		    font-weight: bold;
		    font-size: 18px;
		}
		
		.task-item .description {
		    margin-bottom: 5px;
		}
		
		.task-item .meta {
		    display: flex;
		    flex-wrap: wrap;
		    gap: 10px;
		}
		
		.task-item .meta p {
		    margin: 0;
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
            padding: 5px;
            border-radius: 5px;
            border: 1px solid rgba(0, 0, 0, 0.2);
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
        
        .empty-tasks {
            text-align: center;
            color: rgba(0, 0, 0, 0.5);
            font-size: 14px;
        }
        
        @media (min-width: 1024px) {
        	/* Menu de Navegação */
	      nav#navigation .wrapper * {
	        margin: 0;
	        padding: 0;
	        visibility: initial;
	        display: initial;
	        opacity: initial;
	        flex-direction: initial;
	        position: initial;
	        font-size: initial;
	        font-weight: initial;
	        transform: initial;
	        color: initial;
	        background-color: initial;
	        filter: initial;
	      }
	
	      nav#navigation .menu {
	        display: flex;
	        align-items: center;
	        justify-content: space-between;
	        width: 100%;
	      }
	      
	      nav#navigation .wrapper a.nome {
		    color: white;
		    font-weight: bold;
		    font-size: 3rem;
		    padding-left: 50px;
		    padding-right: 720px;
		}
			
	      nav#navigation .menu ul:nth-child(1) {
	        display: flex;
	        gap: 3.2rem;
	      }
	
	      nav#navigation .menu ul li a {
	        color: white;
		    opacity: 0.7;
		    font-weight: bold; /* Adiciona negrito (bold) */
		    font-size: 2rem; /* Ajusta o tamanho da fonte */
	      }
	
	      nav#navigation .menu li a {
	        transition: opacity 0.4s;
	      }
	
	      nav#navigation .menu li a.active,
	      nav#navigation .menu li a:hover {
	        opacity: 1;
	        font-weight: 700;
	      }
	
	      nav#navigation .menu li a::after {
	        content: '';
	        width: 0%;
	        height: 2px;
	        background-color: white;
	        position: relative;
	        bottom: -2rem;
	        left: -0.5rem;
	        display: block;
	        transition: width 0.2s;
	      }
	
	      nav#navigation .menu li a.active::after,
	      nav#navigation .menu li a:hover::after {
	        padding-inline: 0.8rem;
	        width: 100%;
	      }

        }
    </style>
</head>
<body>
	<nav id="navigation">
    <div class="wrapper">
      <a class="nome">
        <%= request.getSession().getAttribute("username") %>
      </a>

      <div class="menu">
        <ul>
          <li><a href="#" alt="All">All</a></li>
          <li><a href="#" alt="Open">Open</a></li>
          <li><a href="#" alt="Completed">Completed</a></li>
        </ul>
      </div>
    </div>
  </nav>
    <h1>Task.io </h1>
    
	<div id="checklist">
	    <% if (request.getAttribute("tasks") == null || ((List<?>) request.getAttribute("tasks")).isEmpty()) { %>
		    <p class="empty-tasks">Não há tarefas cadastradas.</p>
		<% } else { %>
		    <% List<?> tasks = (List<?>) request.getAttribute("tasks"); %>
		    <% for (Object task : tasks) { %>
		        <% Task taskItem = (Task) task; %>
		        <div class="task-item">
		            <input type="checkbox" id="task<%= tasks.indexOf(task) %>" <% if (taskItem.getStatus().equals("completed")) { out.print("checked"); } %>>
		            <label for="task<%= tasks.indexOf(task) %>"><strong><%= taskItem.getTitle() %></strong></label> ➟⠀
		            <br><p class="description"><%= taskItem.getDescription() %></p>
		            ⠀➟⠀<div class="meta">
		                <p><%= taskItem.getCreationDate() %></p>
		            </div>
		            <% if (taskItem.getCompletionDate() != null) { %>
		                <p>⠀➟⠀Finalized: <%= taskItem.getCompletionDate() %></p>
		            <% } %>
		        </div>
		    <% } %>
		<% } %>

	    <div class="add-task">
		    <form action="TaskListServlet" method="POST">
		        <input type="text" name="title" placeholder="Task Title" required style="width: 450px; height: 50px; margin: 2px;">
		        <br>
		        <input type="text" name="description" placeholder="Task Description" required style="width: 450px; height: 50px; margin: 2px;">
		        <br>
		        <button type="submit" style="display: inline-block; height: 50px; margin: 2px; width: 223px;">Add</button>
		        <button type="button" style="display: inline-block; height: 50px; margin: 2px; width: 222px;">Save Progress</button>
		    </form>
		</div>
	</div>
	<div class="group">
	    <svg viewBox="0 0 24 24" aria-hidden="true" class="icon">
	        <g>
	            <path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path>
	        </g>
	    </svg>
	    <input class="input" type="search" placeholder="Search">
	</div>
</body>
</html>
