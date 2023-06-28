package dao;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordEncryptor {
    public static String encryptPassword(String password) {
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        return hashedPassword;
    }

    public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }

    public static void main(String[] args) {
        String password = "senha123";

        // Encriptar senha
        String hashedPassword = encryptPassword(password);
        System.out.println("Senha encriptada: " + hashedPassword);

        // Verificar senha
        boolean passwordMatch = checkPassword(password, hashedPassword);
        System.out.println("Senha correspondente: " + passwordMatch);
    }
}