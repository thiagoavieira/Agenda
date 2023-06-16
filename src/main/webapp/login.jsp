<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .error-message {
            color: red;
            font-weight: bold;
        }
        
        h1 {
            color: royalblue;
            text-align: left;
        }
        
        .form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            max-width: 350px;
            background-color: #fff;
            padding: 20px;
            border-radius: 20px;
            position: relative;
        }
        
        .title {
            font-size: 28px;
            color: royalblue;
            font-weight: 600;
            letter-spacing: -1px;
            position: relative;
            display: flex;
            align-items: center;
            padding-left: 30px;
        }
        
        .title::before,
        .title::after {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            border-radius: 50%;
            left: 0px;
            background-color: royalblue;
        }
        
        .title::before {
            width: 18px;
            height: 18px;
            background-color: royalblue;
        }
        
        .title::after {
            width: 18px;
            height: 18px;
            animation: pulse 1s linear infinite;
        }
        
        .message,
        .signin {
            color: rgba(88, 87, 87, 0.822);
            font-size: 14px;
        }
        
        .signin {
            text-align: center;
        }
        
        .signin a {
            color: royalblue;
        }
        
        .signin a:hover {
            text-decoration: underline royalblue;
        }
        
        .flex {
            display: flex;
            width: 100%;
            gap: 6px;
        }
        
        .form label {
            position: relative;
        }
        
        .form label .input {
            width: 100%;
            padding: 10px 10px 20px 10px;
            outline: 0;
            border: 1px solid rgba(105, 105, 105, 0.397);
            border-radius: 10px;
        }
        
        .form label .input + span {
            position: absolute;
            left: 10px;
            top: 15px;
            color: grey;
            font-size: 0.9em;
            cursor: text;
            transition: 0.3s ease;
        }
        
        .form label .input:placeholder-shown + span {
            top: 15px;
            font-size: 0.9em;
        }
        
        .form label .input:focus + span,
        .form label .input:valid + span {
            top: 30px;
            font-size: 0.7em;
            font-weight: 600;
        }
        
        .form label .input:valid + span {
            color: green;
        }
        
        .submit {
            border: none;
            outline: none;
            background-color: royalblue;
            padding: 10px;
            border-radius: 10px;
            color: #fff;
            font-size: 16px;
            transform: .3s ease;
        }
                .submit:hover {
            background-color: rgb(56, 90, 194);
        }
        
        @keyframes pulse {
            from {
                transform: scale(0.9);
                opacity: 1;
            }
        
            to {
                transform: scale(1.8);
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <h1>Task.io</h1>
    
    <form method="post" action="LoginServlet" class="form">
        <p class="title">Login</p>
        
        <label for="username">
            <input type="text" id="username" name="username" class="input" required>
            <span>Username</span>
        </label>
        
        <label for="password">
            <input type="password" id="password" name="password" class="input" required>
            <span>Password</span>
        </label>
        
        <button type="submit" class="submit">Login</button>
        
        <div id="errorMessage" class="error-message">
	        <% if (request.getAttribute("errorMessage") != null) { %>
	            <%= request.getAttribute("errorMessage") %>
	        <% } %>
    	</div>
    </form>
    
</body>
</html>