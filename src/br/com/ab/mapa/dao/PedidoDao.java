package br.com.ab.mapa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import br.com.ab.mapa.ConnectionFactory;
import br.com.ab.mapa.entity.PedidoEntity;

@Component
public class PedidoDao {

	private Connection connection;

	public PedidoDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void insert(String coleta, String entrega, String distancia, String valor, String volume) {
		String sql = "INSERT INTO PEDIDO(cliente, distancia, valor, coleta, entrega) VALUES('1', '"+distancia+"', '"+valor+"', '"+coleta+"', '"+entrega+"')";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
            stmt.execute();
			connection.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<PedidoEntity> getPedidos() {
		String sql = "SELECT id, cliente, distancia, valor, coleta, entrega, veiculo, data FROM pedido";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            List<PedidoEntity> pedidos = new ArrayList<PedidoEntity>();
            while (rs.next()) {
            	pedidos.add(
            			new PedidoEntity(
            					rs.getString("id"), 
            					rs.getString("cliente"), 
            					rs.getString("distancia"),
            					rs.getString("valor"), 
            					rs.getString("coleta"), 
            					rs.getString("entrega"), 
            					rs.getString("veiculo"), 
            					rs.getString("data")));
            }
			connection.close();
			
			return pedidos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}