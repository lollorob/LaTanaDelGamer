package it.unisa.model;
import java.util.ArrayList;

public class Carrello {
	
    private ArrayList<ProdottoBean> nelCarrello = new ArrayList<>();
    private Double totale = 0.0;
    
    public void aggiungiProdotto(ProdottoBean prodotto) {
    	
    	boolean presente = false;
    	for(int i = 0; i < nelCarrello.size(); i++) {
        if (nelCarrello.get(i).getId_prodotto() == prodotto.getId_prodotto())
            {
                presente = true;
            }
        }
        if (prodotto != null && presente == false)
        {
            this.nelCarrello.add(prodotto);
            this.totale = prodotto.getPrezzo() + totale;
        }
            		
    }
    
    public void svuotaCarrello()
    {
        nelCarrello.removeAll(nelCarrello);
        this.totale = 0.0;
    }
    
    public ProdottoBean doretrieveById(int id)
    {
    	ProdottoBean quadro = null;
        for (int i = 0; i < nelCarrello.size(); i++)
        {
            if (nelCarrello.get(i).getId_prodotto() == id)
            {
                quadro = nelCarrello.get(i);
            }
        }
        return quadro;
    }
    
    //funzione usata per scorrere la lista di prodotti nel carrello
    public ProdottoBean doretrieveByIndex(int index)
    {
        return nelCarrello.get(index);
    }

    
    public Double getTotale()
    {
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
            ProdottoBean temp = nelCarrello.get(i);
            if (temp.getId_prodotto() == id)
            {
                this.totale = this.totale - temp.getPrezzo();
                nelCarrello.remove(i);
            }
        }
    }


}
