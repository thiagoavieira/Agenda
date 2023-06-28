<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        
        /* Menu de Navegação */
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
        
		#yena {
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
        
        /* Botões */
        button,
        a.button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1.6rem;
            font-weight: bold;
            color: #fff;
            background-color: var(--primary-color);
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            width: 233px;
        }
        
        button:hover,
        a.button:hover {
            background-color: #003366;
            padding: 10px 30px;
        }
        
        button.cancel-button {
            background-color: royalblue;
        }

        button.cancel-button:hover {
            background-color: #003366;
        }
        
		a {
		    color: white;
		    text-decoration: none;
		    height: 4em;
		    line-height: 3em;
		    padding-top: 0.5em;
		    padding-bottom: 0.5em;
		    padding-left: 5em;
		    padding-right: 5em;
		    border-radius: 5px;
		    background-color: var(--primary-color);
		    font-size: 1.8rem;
		    font-weight: bold;
		    transition: all 0.3s ease;
		}
		
		a:hover {
		    background-color: #003366;
		    color: #fff;
		}
		
		#cancel {
			height: 10cm;
		}
        
        /* Formulário */
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        input[type="text"],
        textarea,
        input[type="date"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            font-size: 1.6rem;
            margin-bottom: 10px;
        }
        
        textarea {
            height: 150px;
        }
        
        /* Estilos para telas maiores (min-width: 1024px) */
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
                font-weight: bold;
                font-size: 2rem;
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
    <h1>Task.io</h1>
    
    <% Task task = (Task) request.getAttribute("task"); %>
	<div id="yena">
	    <form action="EditTaskServlet" method="POST">
	        <input type="hidden" name="taskId" value="<%= task.getId() %>" />
	        <label for="title">Title:</label>
	        <input type="text" id="title" name="title" value="<%= task.getTitle() %>" required />
	        <br>
	        <label for="description">Description:</label>
	        <textarea id="description" name="description" required><%= task.getDescription() %></textarea>
	        <br>
	        <label for="creationDate">Creation Date:</label>
	        <input type="text" id="creationDate" name="creationDate" value="<%= task.getCreationDate() %>" required />
	        <br>
	        <label for="completionDate">Completion Date:</label>
	        <input type="date" id="completionDate" name="completionDate" value="<%= task.getCompletionDate() %>" />
	        <br>
	        <button type="submit">Save</button>
	        <a id="cancel" href="TaskListServlet">Cancel</a>
	    </form>
	 </div>
</body>
</html>
