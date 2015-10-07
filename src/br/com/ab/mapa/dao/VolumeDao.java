package br.com.ab.mapa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import br.com.ab.mapa.ConnectionFactory;
import br.com.ab.mapa.entity.VolumeEntity;

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

	public List<VolumeEntity> getVolumes() {
		String sql = "SELECT id, nome, valor FROM volume";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            List<VolumeEntity> map = new ArrayList<VolumeEntity>();
            while (rs.next()) {
            	map.add(new VolumeEntity(rs.getString("id"), rs.getString("nome"), rs.getString("valor")));
            }
            
			connection.close();
			
			return map;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}