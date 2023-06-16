package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//Não estou usando essa classe, nao esta funcionando pq precisa instanciar o Class do mysql la n sei pq ent to abrindo conexao pelo servlet mesmo
public class DBConfig {
	// mas deixa isso aqui, vai que precisa dessa bomba né
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tasks";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "root";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }
}
