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

}
