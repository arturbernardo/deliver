package br.com.ab.mapa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import br.com.ab.mapa.ConnectionFactory;
import br.com.ab.mapa.model.Cliente;

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

	public String testeSQL() {
		String sql = "SELECT id FROM pedido WHERE id = 1";
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

	public boolean existeUsuario(Cliente cliente) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean existeUsuario(String string, String string2) {
		// TODO Auto-generated method stub
		return false;
	}
}