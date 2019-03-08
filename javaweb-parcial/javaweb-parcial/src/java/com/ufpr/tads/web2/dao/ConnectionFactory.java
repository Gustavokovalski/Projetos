package com.ufpr.tads.web2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    // método de conexão com o banco padrão JDBC
    // é um método estático que retorna uma conexão pronta para ser usada
    // pode ser utilizada declarando ConnectionFactory.getConnection()
    // não precisa instanciar uma 'new ConnectionFactory()'
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
                    Class.forName("com.mysql.jdbc.Driver");
                    String serverName = "localhost";  
                    String url = "jdbc:mysql://" + serverName + "/javaweb"; //javaweb é o nome do banco
                    String username = "root";        //nome de um usuário de seu BD      
                    String password = "";      //sua senha de acesso
 
            return DriverManager.getConnection(url, username, password);
		 
	}
}