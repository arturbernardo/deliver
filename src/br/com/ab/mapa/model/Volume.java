package br.com.ab.mapa.model;

public class Volume {
	private String id;
	private String nome;
	private String valor;
	
	public Volume() {

	}

	public Volume(String id, String nome, String valor) {
		this.id = id;
		this.nome = nome;
		this.valor = valor;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
}
