package it.unisa.model;

import java.io.Serializable;

public class RecensioneBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int id_recensione;
	String nome;
	int valutazione;
	String descrizione;
	int id_prodotto;
	private ProdottoBean prodotto;
	
	public RecensioneBean() {
		id_recensione = 0;
		nome = "";
		valutazione = 0;
		descrizione = "";
		id_prodotto = 0;
	}

	public int getId_recensione() {
		return id_recensione;
	}

	public void setId_recensione(int id_recensione) {
		this.id_recensione = id_recensione;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getValutazione() {
		return valutazione;
	}

	public void setValutazione(int valutazione) {
		this.valutazione = valutazione;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getId_prodotto() {
		return id_prodotto;
	}

	public void setId_prodotto(int id_prodotto) {
		this.id_prodotto = id_prodotto;
	}

	public ProdottoBean getProdotto() {
		return prodotto;
	}

	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}
	
	@Override
	public boolean equals(Object other) {
		return (this.getId_recensione() ==  ((RecensioneBean) other).getId_recensione());
	}
	
	@Override
	public String toString() {
		return id_recensione + " (" + "," + nome + "," + valutazione + "," + descrizione + "," + id_prodotto + "," + ") ";
	}

}

