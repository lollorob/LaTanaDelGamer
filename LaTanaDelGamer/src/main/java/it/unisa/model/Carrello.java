package it.unisa.model;
import java.util.ArrayList;

public class Carrello {
	
    private ArrayList<ItemCarrello> nelCarrello = new ArrayList<>();
    private float totale = 0;
    
    public void aggiungiProdotto(ItemCarrello item) {
    	
    	boolean presente = false;
    	for(int i = 0; i < nelCarrello.size(); i++) {
        if (nelCarrello.get(i).getProdotto().getId_prodotto() == item.getProdotto().getId_prodotto())
            {
                presente = true;
                nelCarrello.get(i).setQuantity(item.getQuantity());
            }
        }
        if (item.getProdotto() != null && presente == false)
        {
            this.nelCarrello.add(item);
            
 
        }
       
            		
    }
    
    public void svuotaCarrello()
    {
        nelCarrello.removeAll(nelCarrello);
        this.totale = 0;
    }
    
    public ItemCarrello doretrieveById(int id)
    {
    	ItemCarrello prodotto = null;
        for (int i = 0; i < nelCarrello.size(); i++)
        {
            if (nelCarrello.get(i).getProdotto().getId_prodotto() == id)
            {
                prodotto = nelCarrello.get(i);
            }
        }
        return prodotto;
    }
    
    public int getQuantityById(int id) {
    	ItemCarrello item =doretrieveById(id);
    	if(item==null)
    		return 1;
    	else
    	return item.getQuantity();
    }
    
    //funzione usata per scorrere la lista di prodotti nel carrello
    public ItemCarrello doretrieveByIndex(int index)
    {
        return nelCarrello.get(index);
    }

    
    public float getTotale()
    {
    	this.totale= 0;
    	for(int i = 0; i < nelCarrello.size(); i++) {
    		ItemCarrello item = nelCarrello.get(i);
    		this.totale += item.getProdotto().getPrezzo() * item.getQuantity();	
    	}
    	String temp = String.format("%.2f",this.totale);
    	temp= temp.replaceAll("," , ".");
    	this.totale= Float.parseFloat(temp);
    	return this.totale;
    }
    
    public int getSize()
    {
        return this.nelCarrello.size();
    }

    public void rimuoviProdottobyId(int id)
    {
        for (int i = 0; i < nelCarrello.size(); i++)
        {
            ItemCarrello temp = nelCarrello.get(i);
            if (temp.getProdotto().getId_prodotto() == id)
            {
                nelCarrello.remove(i);
            }
        }
    }


}
