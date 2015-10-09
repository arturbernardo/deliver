package br.com.ab.mapa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.ab.mapa.dao.ClienteDao;
import br.com.ab.mapa.dao.PedidoDao;
import br.com.ab.mapa.model.Cliente;
import br.com.ab.mapa.service.VolumeService;

@Controller
public class MainMapaController {
		
	@RequestMapping("/")
	public String execute(Model model) {
		VolumeService volumeService = new VolumeService();
		model.addAttribute("volumes", volumeService.getVolumes());

		return "mainMapa";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "mainMapa";
	} 
	
	@RequestMapping("/login")
	public String login(HttpSession session, Model model, HttpServletRequest request) {
		ClienteDao clienteDao = new ClienteDao();
		if (clienteDao.existeUsuario(request.getParameter("user"), request.getParameter("pass"))) {
			session.setAttribute("usuarioLogado", "logado");
		}
			
		VolumeService volumeService = new VolumeService();
		model.addAttribute("volumes", volumeService.getVolumes());
		return "mainMapa";
	} //${usuarioLogado.login}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(HttpServletRequest request, Model model) {
		PedidoDao pedidoDao = new PedidoDao();

		pedidoDao.insert(request.getParameter("coleta"), request.getParameter("entrega"), 
				kmToDecial(request.getParameter("distancia")), request.getParameter("valor"), request.getParameter("volume"));
		
		VolumeService volumeService = new VolumeService();
		model.addAttribute("volumes", volumeService.getVolumes());


		return "mainMapa";
	}

    private String kmToDecial(String km) {
        return km.substring(0,km.length()-3).replace(",", ".");
    }
}