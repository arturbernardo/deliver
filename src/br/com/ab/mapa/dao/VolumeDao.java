package br.com.ab.mapa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import br.com.ab.mapa.ConnectionFactory;
import br.com.ab.mapa.entity.Volume;

@Component
public class VolumeDao {

	private Connection connection;

	public VolumeDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Volume> getVolumes() {
		String sql = "SELECT id, nome, valor FROM volume";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            List<Volume> map = new ArrayList<Volume>();
            while (rs.next()) {
            	map.add(new Volume(rs.getString("id"), rs.getString("nome"), rs.getString("valor")));
            }
            
			connection.close();
			
			return map;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}