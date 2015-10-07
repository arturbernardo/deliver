package br.com.ab.mapa.service;

import java.util.ArrayList;
import java.util.List;

import br.com.ab.mapa.dao.PedidoDao;
import br.com.ab.mapa.entity.PedidoEntity;
import br.com.ab.mapa.model.Pedido;

public class PedidoService {

	public List<Pedido> getPedidos() {
		PedidoDao pedidoDao = new PedidoDao();
		return binder(pedidoDao.getPedidos());
	}

	private List<Pedido> binder(List<PedidoEntity> pedido) {
		
		List<Pedido> pedidoModel = new ArrayList<Pedido>();
		for (PedidoEntity pedidoEntity : pedido) {
			pedidoModel.add(new Pedido(pedidoEntity.getId(), pedidoEntity.getCliente(), pedidoEntity.getDistancia(), pedidoEntity.getValor(), pedidoEntity.getColeta(), pedidoEntity.getEntrega(), pedidoEntity.getVeiculo(), pedidoEntity.getData()));
		}
		return pedidoModel;
	}

	public Object getPedidosByFilter(String id, String cliente, String distancia, String valor, String coleta, String entrega,
			String veiculo, String data) {
		PedidoDao pedidoDao = new PedidoDao();
		return binder(pedidoDao.getPedidosByFilter(id, cliente, distancia, valor, coleta, entrega, veiculo, data));
	}

}
