package br.com.ab.mapa.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ab.mapa.dao.ClienteDao;
import br.com.ab.mapa.model.Cliente;

public class LoginService {

	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Cliente cliente, HttpSession session) {
		ClienteDao clienteDao = new ClienteDao();
		if (clienteDao.existeUsuario(cliente)) {
			session.setAttribute("usuarioLogado", cliente);
			return "mainMapa";
		}
		return "mainMapa";
	}
}
