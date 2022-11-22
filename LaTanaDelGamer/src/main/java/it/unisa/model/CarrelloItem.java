package it.unisa.model;

public class CarrelloItem {

	
	private ProdottoBean prodotto;
	private int quantita;
	
	
	public CarrelloItem(ProdottoBean prodotto, int quantita) {
		this.prodotto=prodotto;
		this.quantita=quantita;
	}

	public ProdottoBean getProdotto() {
		return prodotto;
	}

	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}


	public double totale() {
		return quantita*prodotto.getPrezzo();
	}
	

}

