package br.com.ab.mapa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import br.com.ab.mapa.ConnectionFactory;

@Component
public class ClienteDao {

	private Connection connection;

	public ClienteDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
		
	public String getUserByUserAndPassword(String user, String pass) {
		String sql = "SELECT id FROM cliente WHERE login = '"+user+"' AND senha = '"+pass+"'";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            String id = "";
            while (rs.next()) {
            	id = rs.getString("id");
            }
            
			connection.close();
			
			return id;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}