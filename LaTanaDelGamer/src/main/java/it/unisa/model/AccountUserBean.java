package it.unisa.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class AccountUserBean implements Serializable {

	private static final long serialVersionUID = 1L;

	String username;
    String eMail;
    String passwd;
    String nome;
    String cognome;
    String data;
    int n_Ordini;
    String via;
    int numero;
    long cap;
    String citta;
    String provincia;
    boolean isAdmin;
    
   

	private List<OrdineBean> listaOrdini;
    

	public AccountUserBean() {
    	
    	username=null;
        eMail="";
        passwd="";
        nome="";
        cognome="";
        data="";
        n_Ordini=-1;
        via="";
        numero=-1;
        cap=-1;
        citta="";
        provincia="";
    }
    
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd){
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(passwd.getBytes(StandardCharsets.UTF_8));
            this.passwd = String.format("%040x", new BigInteger(1, digest.digest()));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getn_Ordini() {
		return n_Ordini;
	}
	public void setn_Ordini(int nOrdini) {
		this.n_Ordini = nOrdini;
	}
	public String getVia() {
		return via;
	}
	public void setVia(String via) {
		this.via = via;
	}
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public long getCap() {
		return cap;
	}
	public void setCap(long cap) {
		this.cap = cap;
	}
	public String getCitta() {
		return citta;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	
	public boolean isEmpty() {
		return username.equals("");
	}
		
	public List<OrdineBean> getListaOrdini() {
		return listaOrdini;
	}

	public void setListaOrdini(List<OrdineBean> listaOrdini) {
		this.listaOrdini = listaOrdini;
	}

	
	 public boolean isAdmin() {
			return isAdmin;
		}

		public void setAdmin(boolean isAdmin) {
			this.isAdmin = isAdmin;
		}
		
	@Override
	public boolean equals(Object other) {
		return this.getUsername().equals(((AccountUserBean) other).getUsername());
	}
	
	@Override
	public String toString() {
		return username + " (" +eMail+ ", " + passwd + ", " + nome + ", " + cognome + ", " + data + ", " +n_Ordini + ", " + via + ", " + numero + ", " + cap + ", " + citta + ", " + provincia+ ") ";
		
	}


	

}
