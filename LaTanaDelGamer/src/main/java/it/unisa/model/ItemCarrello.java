package it.unisa.model;

public class ItemCarrello {

	private ProdottoBean prodotto;
	private int quantity=1;
	public ItemCarrello(ProdottoBean prodotto, int quantity) {
		this.prodotto = prodotto;
		this.quantity = quantity;
	}
	
	public ItemCarrello() {
		prodotto=null;
		quantity=1;
	}
	
	public ProdottoBean getProdotto() {
		return prodotto;
	}
	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public double getSomma() {
		if(prodotto!=null)
			return prodotto.getPrezzo() * quantity;
		else return -1;
	}
	
	
	
}
