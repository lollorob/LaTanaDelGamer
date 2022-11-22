package it.unisa.model;

import java.util.List;

public class Carrello {
	private List<CarrelloItem> items;
	
	
	public Carrello (List<CarrelloItem> items) {
		this.items=items;
	}
	
	public List<CarrelloItem> getItemsCarrello(){
		return items;
	}
	
	public void setCarrello(List<CarrelloItem> items) {
			this.items=items;
	}
	
	
	
	public double getTotale() {
		double totale=0;
		for(CarrelloItem item: items) {
			totale += item.totale();
		}
		
		return totale;
	}
	
		
	public void addProdotto(CarrelloItem item) {

		items.add(item);
	}

	
	public void deleteCarrelloItem(CarrelloItem item) {
		items.remove(item);
		
	}
	

	public void emptyCarrelloItems() {
		items.clear();
	}

	public void addProdotto(ProdottoBean prodotto, int quantita) {
		items.add(new CarrelloItem(prodotto,quantita));	
	}
    
    
}
