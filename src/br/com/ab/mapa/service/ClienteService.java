package br.com.ab.mapa.service;

import br.com.ab.mapa.dao.ClienteDao;

public class ClienteService {


	public String getClienteByUser(String user, String pass) {
		ClienteDao clienteDao = new ClienteDao();
		return clienteDao.getUserByUserAndPassword(user, pass);
	}
	
	public boolean clienteExist(String user, String pass) {
		ClienteDao clienteDao = new ClienteDao();
		return clienteDao.getUserByUserAndPassword(user, pass).equals("") ? false : true;
	}

}
