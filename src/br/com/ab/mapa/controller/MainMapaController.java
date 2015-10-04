package br.com.ab.mapa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ab.mapa.dao.PedidoDao;


@Controller
public class MainMapaController {
		
	@RequestMapping("/")
	public String execute() {
		System.out.println("Executando a lógica com Spring MVC");
		PedidoDao pedidoDao = new PedidoDao();
		pedidoDao.testeSQL();

		return "mainMapa";
	}
}