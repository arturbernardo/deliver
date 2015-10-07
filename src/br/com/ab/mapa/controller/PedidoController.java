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
				request.getParameter("id"), 
				request.getParameter("cliente"), 
				request.getParameter("distancia"), 
				request.getParameter("valor"), 
				request.getParameter("coleta"), 
				request.getParameter("entrega"), 
				request.getParameter("veiculo"), 
				request.getParameter("data")));

		return "pedidos";
	}
}