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

		pedidoDao.insert(request.getParameter("coleta"), request.getParameter("entrega"), 
				kmToDecial(request.getParameter("distancia")), request.getParameter("valor"), request.getParameter("volume"));
		
		model.addAttribute("volumes", volumeService.getVolumes());


		return "mainMapa";
	}

    private String kmToDecial(String km) {
        return km.substring(0,km.length()-3).replace(",", ".");
    }
}