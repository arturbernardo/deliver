package br.com.ab.mapa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ab.mapa.service.PedidoService;

@Controller
public class PedidoController {
		
	@RequestMapping("/pedido")
	public String execute(Model model) {
		System.out.println("Executando a lógica com Spring MVC");

		PedidoService pedidoService = new PedidoService();
		model.addAttribute("pedidos", pedidoService.getPedidos());

		return "pedidos";
	}
}