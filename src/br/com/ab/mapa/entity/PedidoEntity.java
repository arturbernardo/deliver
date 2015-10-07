package br.com.ab.mapa.entity;

public class PedidoEntity {
	private String id;
	private String cliente;
	private String distancia;
	private String valor;
	private String coleta;
	private String entrega;
	private String veiculo;
	private String data;
	
	public PedidoEntity(String id, String cliente, String distancia, String valor, String coleta, String entrega,
			String veiculo, String data) {
		super();
		this.id = id;
		this.cliente = cliente;
		this.distancia = distancia;
		this.valor = valor;
		this.coleta = coleta;
		this.entrega = entrega;
		this.veiculo = veiculo;
		this.data = data;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public String getDistancia() {
		return distancia;
	}

	public void setDistancia(String distancia) {
		this.distancia = distancia;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getColeta() {
		return coleta;
	}

	public void setColeta(String coleta) {
		this.coleta = coleta;
	}

	public String getEntrega() {
		return entrega;
	}

	public void setEntrega(String entrega) {
		this.entrega = entrega;
	}

	public String getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(String veiculo) {
		this.veiculo = veiculo;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}
}
