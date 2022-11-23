package it.unisa.model;

import java.io.Serializable;
import java.time.LocalDate;

public class ItemOrdineBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	int id_ordine;
	String nome ;
    float prezzo ;
    String descrizione ;
    int quantita;
    
    
	public ItemOrdineBean() {
		id_ordine = 0;
    	nome="" ;
        prezzo=-1;
        descrizione="" ;
        quantita = 0;
	}


	public int getId_ordine() {
		return id_ordine;
	}


	public void setId_ordine(int id_ordine) {
		this.id_ordine = id_ordine;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public float getPrezzo() {
		return prezzo;
	}


	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}


	public String getDescrizione() {
		return descrizione;
	}


	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}


	public int getQuantita() {
		return quantita;
	}


	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
	@Override
	public boolean equals(Object other) {
		return this.getId_ordine() ==  ((ItemOrdineBean) other).getId_ordine();
	}


	@Override
	public String toString() {
		return "ItemOrdineBean [id_ordine=" + id_ordine + ", nome=" + nome + ", prezzo=" + prezzo + ", descrizione="
				+ descrizione + ", quantita=" + quantita + "]";
	}
	


}
