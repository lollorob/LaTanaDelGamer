package it.unisa.model;

import java.io.Serializable;
import java.util.List;

public class CategoriaBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	String nome;
	String didascalia;
	
	
	
	private List<ProdottoBean> prodotto;
	
	public CategoriaBean() {
		nome = "";
		didascalia= "";
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDidascalia() {
		return didascalia;
	}

	public void setDidascalia(String didascalia) {
		this.didascalia = didascalia;
	}
	

	public List<ProdottoBean> getProdotto() {
		return prodotto;
	}

	public void setProdotto(List<ProdottoBean> prodotto) {
		this.prodotto = prodotto;
	}

	@Override
	public boolean equals(Object other) {
		return this.getNome() ==  ((CategoriaBean) other).getNome();
	}
	
	@Override
	public String toString() {
		return nome + " (" + didascalia + ") ";
	}

}
