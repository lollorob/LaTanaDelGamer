package it.unisa.model;

import java.io.Serializable;

public class GalleriaBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int id_media;
	int id_prodotto;
	private ProdottoBean prodotto;
	
	public int getId_media() {
		return id_media;
	}

	public void setId_media(int id_media) {
		this.id_media = id_media;
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

	public GalleriaBean() {
		id_media = 0;
		id_prodotto = 0;
	}
	
	@Override
	public boolean equals(Object other) {
		return (this.getId_media() ==  ((GalleriaBean) other).getId_media());
	}
	
	@Override
	public String toString() {
		return id_media + " (" + "," + id_prodotto +  ") ";
	}

	

}
