package it.unisa.model;

import java.io.InputStream;
import java.io.Serializable;
import java.util.List;
public class ProdottoBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int id_prodotto;
	String nome ;
    float prezzo ;
    String descrizione ;
    String casaProduttrice;
    int quantita;
    String copertina;
    InputStream copertina1;
    


	private List<RecensioneBean> recensioni;
    private List<GalleriaBean> galleria;
    
    
    public InputStream getCopertina1() {
		return copertina1;
	}

	public void setCopertina1(InputStream copertina1) {
		this.copertina1 = copertina1;
	}

	public String getCopertina() {
		return copertina;
	}

	public void setCopertina(String copertina) {
		this.copertina = copertina;
	}

	String nomeCategoria;
    private CategoriaBean categoria;
    

	public ProdottoBean() {
    	id_prodotto=-1;
    	nome="" ;
        prezzo=-1;
        descrizione="" ;
        casaProduttrice="";
        quantita = 0;
        copertina="";
        nomeCategoria="";
    }
    
    public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public int getId_prodotto() {
		return id_prodotto;
	}
	public void setId_prodotto(int id_prodotto) {
		this.id_prodotto = id_prodotto;
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
	public String getCasaProduttrice() {
		return casaProduttrice;
	}
	public void setCasaproduttrice(String casaProduttrice) {
		this.casaProduttrice = casaProduttrice;
	}
	public String getnomeCategoria() {
		return nomeCategoria;
	}
	public void setnomeCategoria(String nomeCategoria) {
		this.nomeCategoria = nomeCategoria;
	}
	
	public CategoriaBean getCategoria() {
		return categoria;
	}

	public void setCategoria(CategoriaBean categoria) {
		this.categoria = categoria;
	}
	
	public List<RecensioneBean> getRecensioni() {
		return recensioni;
	}

	public void setRecensioni(List<RecensioneBean> recensioni) {
		this.recensioni = recensioni;
	}

	public List<GalleriaBean> getGalleria() {
		return galleria;
	}

	public void setGalleria(List<GalleriaBean> galleria) {
		this.galleria = galleria;
	}

	@Override
	public boolean equals(Object other) {
		return this.getId_prodotto() ==  ((ProdottoBean) other).getId_prodotto();
	}
	
	@Override
	public String toString() {
		return id_prodotto + " (" +nome+ ", " + prezzo + ", " + descrizione + ", " + casaProduttrice + ", " +nomeCategoria + ") ";
	}

	
	
}
