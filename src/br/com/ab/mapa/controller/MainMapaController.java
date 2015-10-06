package br.com.ab.mapa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import br.com.ab.mapa.dao.VolumeDao;

@Controller
public class MainMapaController {
		
	@RequestMapping("/")
	public String execute(Model model) {
		System.out.println("Executando a lógica com Spring MVC");
		VolumeDao volumeDao = new VolumeDao();
		
		model.addAttribute("volumes",volumeDao.getVolumes());

		return "mainMapa";
	}
}