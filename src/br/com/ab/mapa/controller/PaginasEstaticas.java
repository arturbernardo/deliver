package br.com.ab.mapa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaginasEstaticas {
		
	@RequestMapping("/servicos")
	public String servicos(Model model) {
		return "servicos";
	}
	
	@RequestMapping("/clientes")
	public String clientes(Model model) {
		return "clientes";
	}
	
	@RequestMapping("/empresa")
	public String empresa(Model model) {
		return "empresa";
	}
	
	@RequestMapping("/contato")
	public String contato(Model model) {
		return "contato";
	}
}