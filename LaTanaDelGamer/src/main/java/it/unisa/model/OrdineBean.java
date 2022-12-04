package it.unisa.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

public class OrdineBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int id_ordine;
	LocalDate data_ordine;
	String username;
	String email_spedizione;
	float importo;
	String tipo_pagamento;
	String metodo_pagamento;
	
	private List<ItemOrdineBean> listaProdotti;
	
	private AccountUserBean account;
	

	public OrdineBean() {
		id_ordine = 0;
		data_ordine = LocalDate.of(2000, 01, 01);
		username = "";
		email_spedizione = "";
		importo = 0;
		tipo_pagamento = "";
		metodo_pagamento = "";
	}

	public int getId_ordine() {
		return id_ordine;
	}

	public void setId_ordine(int id_ordine) {
		this.id_ordine = id_ordine;
	}

	
	public LocalDate getData_ordine() {
		return data_ordine;
	}

	public void setData_ordine(LocalDate data_ordine) {
		this.data_ordine = data_ordine;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail_spedizione() {
		return email_spedizione;
	}

	public void setEmail_spedizione(String email_spedizione) {
		this.email_spedizione = email_spedizione;
	}

	public float getImporto() {
		return importo;
	}

	public void setImporto(float importo) {
		this.importo = importo;
	}

	public String getTipo_pagamento() {
		return tipo_pagamento;
	}

	public void setTipo_pagamento(String tipo_pagamento) {
		this.tipo_pagamento = tipo_pagamento;
	}

	public String getMetodo_pagamento() {
		return metodo_pagamento;
	}

	public void setMetodo_pagamento(String metodo_pagamento) {
		this.metodo_pagamento = metodo_pagamento;
	}

	public AccountUserBean getAccount() {
		return account;
	}

	public void setAccount(AccountUserBean account) {
		this.account = account;
	}
	
	public List<ItemOrdineBean> getListaProdotti() {
		return listaProdotti;
	}

	public void setListaProdotti(List<ItemOrdineBean> listaProdotti) {
		this.listaProdotti = listaProdotti;
	}
	
	
	@Override
	public boolean equals(Object other) {
		return (this.getId_ordine() ==  ((OrdineBean) other).getId_ordine());
	}
	
	@Override
	public String toString() {
		return  id_ordine + " (" + data_ordine + "," + username + "," + email_spedizione + "," + importo + "," + tipo_pagamento + "," + metodo_pagamento + ") ";
	}

}

