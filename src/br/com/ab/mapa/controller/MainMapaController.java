package br.com.ab.mapa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.ab.mapa.dao.PedidoDao;
import br.com.ab.mapa.service.VolumeService;

@Controller
public class MainMapaController {
		
	@RequestMapping("/")
	public String execute(Model model) {
		System.out.println("Executando a lógica com Spring MVC");
		VolumeService volumeService = new VolumeService();
		
		model.addAttribute("volumes", volumeService.getVolumes());

		return "mainMapa";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(HttpServletRequest request, Model model) {
		System.out.println("save");
		PedidoDao pedidoDao = new PedidoDao();
		VolumeService volumeService = new VolumeService();

		model.addAttribute("volumes", volumeService.getVolumes());

		pedidoDao.insert(request.getParameter("coleta"), request.getParameter("entrega"));
		

		return "mainMapa";
	}
}