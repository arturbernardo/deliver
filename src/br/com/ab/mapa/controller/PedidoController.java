package br.com.ab.mapa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.ab.mapa.service.PedidoService;

@Controller
public class PedidoController {
		
	@RequestMapping("/pedido")
	public String execute(Model model) {
		PedidoService pedidoService = new PedidoService();
		model.addAttribute("pedidos", pedidoService.getPedidos());

		return "pedidos";
	}
	
	@RequestMapping(value="/pedido/search", method=RequestMethod.GET)
	public String search(HttpServletRequest request, Model model) {
		PedidoService pedidoService = new PedidoService();
		model.addAttribute("pedidos", pedidoService.getPedidosByFilter(
				request.getParameter("id") == null ? "" : request.getParameter("id"), 
				request.getParameter("cliente") == null ? "" : request.getParameter("cliente"), 
				request.getParameter("distancia") == null ? "" : request.getParameter("distancia"), 
				request.getParameter("valor") == null ? "" : request.getParameter("valor"), 
				request.getParameter("coleta") == null ? "" : request.getParameter("coleta"), 
				request.getParameter("entrega") == null ? "" : request.getParameter("entrega"), 
				request.getParameter("veiculo") == null ? "" : request.getParameter("veiculo"), 
				request.getParameter("data") == null ? "" : request.getParameter("data")));

		return "pedidos";
	}
}