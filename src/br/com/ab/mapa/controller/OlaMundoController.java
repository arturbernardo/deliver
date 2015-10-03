package br.com.ab.mapa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ab.mapa.dao.PedidoDao;


@Controller
public class OlaMundoController {
		
	@RequestMapping("/olaMundoSpring")
	public String execute() {
		System.out.println("Executando a lógica com Spring MVC");
		PedidoDao pedidoDao = new PedidoDao();
		pedidoDao.testeSQL();

		return "ok4";
	}
}

// https://maps.googleapis.com/maps/api/directions/output?parameters