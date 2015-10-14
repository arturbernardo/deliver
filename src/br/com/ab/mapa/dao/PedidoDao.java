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
	
	public void insert(String cliente, String coleta, String entrega, String distancia, String valor, String volume) {
		String sql = "INSERT INTO PEDIDO(cliente, distancia, valor, coleta, entrega) VALUES('"+cliente+"', '"+distancia+"', '"+valor+"', '"+coleta+"', '"+entrega+"')";
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
		return getPedidosByFilter("", "", "", "", "", "", "", "");
	}

	public List<PedidoEntity> getPedidosByFilter(String id, String cliente, String distancia, String valor, String coleta, String entrega, String veiculo, String data) {
		String sql = "SELECT id, cliente, distancia, valor, coleta, entrega, veiculo, data FROM pedido WHERE 1 = 1 ";
		String where = buildWhere(id, cliente, distancia, valor, coleta, entrega, veiculo, data);
		try {
			List<PedidoEntity> pedidos = executeReturiningPedido(sql, where);
			connection.close();
			
			return pedidos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	

	private String buildWhere(String id, String cliente, String distancia, String valor, String coleta, String entrega,
			String veiculo, String data) {
		return new StringBuilder()
				.append(!id.equals("") ? "AND id = '" + id + "'" : "")
				.append(!cliente.equals("") ? "AND cliente = '" + cliente + "'" : "")
				.append(!distancia.equals("") ? "AND distancia = '" + distancia + "'" : "")
				.append(!valor.equals("") ? "AND valor = '" + valor + "'" : "")
				.append(!entrega.equals("") ? "AND entrega = '" + entrega + "'" : "")
				.append(!veiculo.equals("") ? "AND veiculo = '" + veiculo + "'" : "")
				.append(!data.equals("") ? "AND data = '" + data + "'" : "")
				.append(!coleta.equals("") ? "AND coleta = '" + coleta + "'" : "").toString();
	}

	private List<PedidoEntity> executeReturiningPedido(String sql, String where) throws SQLException {
		PreparedStatement stmt;
		stmt = connection.prepareStatement(sql + where);
		ResultSet rs = stmt.executeQuery();
		
		List<PedidoEntity> pedidos = new ArrayList<PedidoEntity>();
		while (rs.next()) {
			binder(rs, pedidos);
		}
		return pedidos;
	}

	private void binder(ResultSet rs, List<PedidoEntity> pedidos) throws SQLException {
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
}