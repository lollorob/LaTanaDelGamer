package it.unisa.control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import it.unisa.model.AccountUserBean;
import it.unisa.model.AccountUserModelDS;
import it.unisa.model.Carrello;
import it.unisa.model.CategoriaBean;
import it.unisa.model.CategoriaModelDS;
import it.unisa.model.ItemCarrello;
import it.unisa.model.ItemOrdineBean;
import it.unisa.model.ItemOrdineModelDS;
import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDS;
import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDS;
import it.unisa.model.RecensioneBean;
import it.unisa.model.RecensioneModelDS;
import it.unisa.utils.Utility;


@WebServlet(name= "ClienteControl" , value="/it/*")
public class ClienteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
			HttpSession session=request.getSession();
			DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
			
			switch (path) {				
			case "/": 
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/home.jsp").forward(request, response);
				break;
				
			case "/checkOut": {
				AccountUserBean user = (AccountUserBean)session.getAttribute("clienteBean");
				
				if(user == null) {
					request.getRequestDispatcher("/WEB-INF/Views/Cliente/login.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("/WEB-INF/Views/Cliente/checkOut.jsp").forward(request, response);
				}
				
				break;
			}
			
			case "/ordini" : {
				AccountUserBean cliente = (AccountUserBean) session.getAttribute("clienteBean");
				if(cliente==null) {
					response.sendRedirect(request.getContextPath() + "/it/login");
				} else {
	        	OrdineModelDS ordine = new OrdineModelDS(ds);
	        	try {
					Collection<?> ordini= ordine.doRetrieveOrdiniByUsername1(cliente.getUsername());
					request.setAttribute("ordiniCliente", ordini);
				} catch (SQLException e) {
					e.printStackTrace();
				}
	        	request.getRequestDispatcher("/WEB-INF/Views/Cliente/ordini.jsp").forward(request, response);
				}
	        }
			break;
			
			case "/prodottiCategoria" : {
				String str = request.getParameter("str");
				CategoriaModelDS modelCategoria= new CategoriaModelDS(ds);
				CategoriaBean categoria=null;
				
				ProdottoModelDS prodotto = new ProdottoModelDS(ds);
				Collection<?> prodotti;
				try {
					categoria=modelCategoria.doRetrieveByKey(str);
					if(str.equals("MostraTutto"))  {
						prodotti = prodotto.doRetrieveAll("");
						categoria=null;
					}else {
						 prodotti = prodotto.doRetrieveProdottiByCategoria(str);
					}
					
					
					request.setAttribute("prodottiCategoria", prodotti);
					request.setAttribute("categoria", categoria );
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/prodottiCategoria.jsp").forward(request, response);	
			}
			break;
				
			case "/eliminaAccount" : {
				AccountUserBean cliente = (AccountUserBean) session.getAttribute("clienteBean");
				if(cliente==null) {
					response.sendRedirect(request.getContextPath() + "/it/login");
				} else {
					request.getRequestDispatcher("/WEB-INF/Views/Cliente/eliminaAccount.jsp").forward(request, response);
				}
				
			}
			break;
			
			case "/home":
				ProdottoModelDS proDS = new ProdottoModelDS(ds);
					try {
						Collection<ProdottoBean> prodotto;
						prodotto = proDS.doRetrieveAll("");
						session.setAttribute("listaProdotti",prodotto);
					} catch (SQLException e) {
						e.printStackTrace();
					}
			
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/home.jsp").forward(request,response);
		
				break;
			
			case "/login": //pagina login cliente
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/login.jsp").forward(request,response);
				break;
				
			case "/logout": {
				Carrello carrello = (Carrello) session.getAttribute("Carrello");
				session.invalidate();
				session=request.getSession();
				session.setAttribute("Carrello", carrello);
	            response.sendRedirect(request.getContextPath()+"/it/home");
				break;
			}
				
			case "/modificaAccount": 
				AccountUserBean cliente = (AccountUserBean) session.getAttribute("clienteBean");
				if(cliente==null) {
					response.sendRedirect(request.getContextPath() + "/it/login");
				} else {
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/modificaAccount.jsp").forward(request,response);
				}
				break;
			
			case "/registrati":  //registrazione cliente
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/registrazione.jsp").forward(request,response);
				break;
				
			case "/reg":
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/regEffettuata.jsp").forward(request, response);
				break;
				
			case "/aggiungiAlCarrello":	{
		        Carrello carrello = (Carrello) session.getAttribute("Carrello");
		        if(carrello == null)
		        	carrello = new Carrello();
		        
		        ProdottoModelDS service = new ProdottoModelDS(ds);
		        ProdottoBean prodotto = null;
		        
				try {
					prodotto = service.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));			
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				if(request.getParameter("eliminaProdotto") != null) {
					carrello.rimuoviProdottobyId(prodotto.getId_prodotto());
				    response.sendRedirect(request.getContextPath() + "/it/mostraCarrello");
				    return;
				}
				
				int quantity = 1;
			
				
				if(request.getParameter("quantity")!=null)
					quantity =Integer.parseInt(request.getParameter("quantity"));
				
		        carrello.aggiungiProdotto(new ItemCarrello(prodotto,quantity));
		        session.removeAttribute("Carrello");
		        session.setAttribute("Carrello", carrello);
		        response.sendRedirect(request.getContextPath() + "/it/mostraCarrello");
				break;
			}
				
			case "/mostraCarrello" :
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/carrello.jsp").forward(request,response);
				break;
				
			case "/prodotto" : {
				ProdottoModelDS model = new ProdottoModelDS(ds);
				ProdottoBean prodotto = new ProdottoBean();
				RecensioneModelDS model1 = new RecensioneModelDS(ds);
				Collection<RecensioneBean> recensioni = null;
				int id_prodotto = Integer.parseInt(request.getParameter("id"));
				
				try {
					prodotto = model.doRetrieveByKey(id_prodotto);
					recensioni = model1.doRetrieveRecensioniByIdProdotto(id_prodotto);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("recensioni", recensioni);
				request.setAttribute("dettagliProdotto", prodotto);
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/prodotto.jsp").forward(request,response);
				break;
			}
		
			
			}
	    }
	 
	 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
			HttpSession session=request.getSession();
			AccountUserBean user = new AccountUserBean();
			DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
			
			switch(path) {
			case "/registrazione": {
				
				AccountUserModelDS model = new AccountUserModelDS(ds);
				
				try {
				AccountUserBean account = new AccountUserBean();
				
				account.setUsername(request.getParameter("username"));
				account.seteMail(request.getParameter("e_mail"));
				account.setPasswd(request.getParameter("passwd"));
				account.setNome(request.getParameter("nome"));
				account.setCognome(request.getParameter("cognome"));
				account.setData(request.getParameter("datadinascita"));
				account.setn_Ordini(0);
				account.setVia(request.getParameter("via"));
				account.setNumero(Integer.parseInt(request.getParameter("numero")));
				account.setCap(Long.parseLong(request.getParameter("cap")));
				account.setCitta(request.getParameter("citta"));
				account.setProvincia(request.getParameter("provincia"));
				account.setAdmin(false);
				
				model.doSave(account);
				request.setAttribute("message", "Account " + account.getNome() + " AGGIUNTO");
				request.setAttribute("usernameAccount", account.getUsername());
				
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/regEffettuata.jsp").forward(request, response);
				}catch(SQLException e) {
					Utility.print(e);
					request.setAttribute("error", e.getErrorCode());
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Views/Cliente/registrazione.jsp");
					dispatcher.forward(request, response);
					return;
				}	
			}
			break;
			
			case "/acquista": {
	            OrdineBean ordine = new OrdineBean();
	            OrdineModelDS model = new OrdineModelDS(ds);
	            AccountUserBean utente = (AccountUserBean) session.getAttribute("clienteBean");
	            Carrello carrello = (Carrello) session.getAttribute("Carrello");
	            String email = request.getParameter("email_spedizione");
	            String tipo_pagamento = request.getParameter("tipo_pagamento");
	            String metodo_pagamento = request.getParameter("metodo_pagamento");
	            int id_tmp = 0;
	            try {
					id_tmp = model.doRetrieveLastId()+1;
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
	            
	            ordine.setId_ordine(id_tmp);
	            ordine.setData_ordine(LocalDate.now());
	            ordine.setUsername(utente.getUsername());
	            ordine.setEmail_spedizione(email);
	            ordine.setImporto(carrello.getTotale());
	            ordine.setTipo_pagamento(tipo_pagamento);
	            ordine.setMetodo_pagamento(metodo_pagamento);
	            
	            AccountUserModelDS model3 = new AccountUserModelDS(ds);	            
	            utente.setn_Ordini(utente.getn_Ordini()+1);
	            
	            try {
	            	model3.doUpdateNumeroOrdini(utente);
					model.doSave(ordine);
				} catch (SQLException e) {
					e.printStackTrace();
				}
	            
	            for(int i = 0; i < carrello.getSize(); i++) {
	            	ItemCarrello item = carrello.doretrieveByIndex(i);
	            	ProdottoBean prodotto = item.getProdotto();
	            	ItemOrdineBean itemOrdine = new ItemOrdineBean();
	            	ItemOrdineModelDS model1 = new ItemOrdineModelDS(ds); 
	            	
	            	itemOrdine.setId_ordine(id_tmp);
	            	itemOrdine.setNome(prodotto.getNome());
	            	itemOrdine.setPrezzo(prodotto.getPrezzo());
	            	itemOrdine.setDescrizione(prodotto.getDescrizione());
	            	itemOrdine.setQuantita(item.getQuantity());
	            	
	            	ProdottoModelDS model2 = new ProdottoModelDS(ds);
	            	prodotto.setQuantita(prodotto.getQuantita() - item.getQuantity());

	            	try {
						model1.doSave(itemOrdine);
						model2.doUpdate(prodotto);
					} catch (SQLException e) {
						e.printStackTrace();
					}
	            }
	            
	            carrello.svuotaCarrello();
	            response.sendRedirect(request.getContextPath() + "/it/home");

				break;
			}
			
			case "/home":
				ProdottoModelDS proDS = new ProdottoModelDS(ds);
					try {
						Collection<ProdottoBean> prodotto;
						prodotto = proDS.doRetrieveAll("");
						session.setAttribute("listaProdotti",prodotto);
					} catch (SQLException e) {
						e.printStackTrace();
					}
			
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/home.jsp").forward(request,response);
		
				break;
			
			case "/eliminaAccount" : {
				AccountUserBean cliente = (AccountUserBean) session.getAttribute("clienteBean");
				
				AccountUserModelDS tmp = new AccountUserModelDS(ds);
				
				try {
					tmp.doDelete(cliente);
					
				}catch (SQLException e) {
					e.printStackTrace();
				}
				session.invalidate();
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/login.jsp").forward(request, response);
				
			}
			break;
			
			case "/modificaCliente":
			{
				AccountUserModelDS model = new AccountUserModelDS(ds);
				AccountUserBean account = new AccountUserBean();
					try {
						String username = request.getParameter("username");
						String e_mail = request.getParameter("e_mail");
					    String nome = request.getParameter("nome");
					    String cognome = request.getParameter("cognome");
					    String data = request.getParameter("datadinascita");
					    String via = request.getParameter("via");
					    int numero = Integer.parseInt(request.getParameter("numero"));
					    long cap = Long.parseLong(request.getParameter("cap"));
					    String citta = request.getParameter("citta");
					    String provincia = request.getParameter("provincia");

						account.setUsername(username);
						account.seteMail(e_mail);

						account.setNome(nome);
						account.setCognome(cognome);
						account.setData(data);

						account.setVia(via);
						account.setNumero(numero);
						account.setCap(cap);
						account.setCitta(citta);
						account.setProvincia(provincia);
						model.doUpdate(account);
						account=model.doRetrieveByKey(username);
						request.setAttribute("message", "Account " + account.getUsername() + " AGGIORNATO");
					} catch (SQLException e) {
						e.printStackTrace();
				}

					session.setAttribute("clienteBean", account);
					response.sendRedirect(request.getContextPath() + "/it/modificaAccount");
		}
				break;
			
	        case "/login": {// LOGIN CLIENTE
	        	String username = (String) session.getAttribute("username");
	        	String passwd = (String) session.getAttribute("passwd");
	        	
	            if (username==null && passwd==null ) { //SE PRIMA VOLTA
	                username = request.getParameter("username");
	                passwd = request.getParameter("passwd");
	                session.setAttribute("username", username);
	                session.setAttribute("passwd", passwd);
	              
	            } 
	        	
	            AccountUserModelDS accountmodel = new AccountUserModelDS(ds);

	            try {
	            	
					user = accountmodel.doRetrieveAccountUserByEmailPassword(username, passwd);
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
	            if (user.getUsername() != null && user.isAdmin()==false) { //SE IL CLIENTE ESISTE
	        	 	OrdineModelDS ordine = new OrdineModelDS(ds);
	        	 	session.setAttribute("clienteBean", user);
	                Collection<OrdineBean> ord;
	                
					try {
						
						ord = ordine.doRetrieveAll("");
	                    request.setAttribute("numeroOrdini",ord.size());
	   
					} catch (SQLException e) {
						e.printStackTrace();
					}
	                request.getRequestDispatcher("/WEB-INF/Views/Cliente/home.jsp").forward(request, response);
	                
	            	}else{ // ALTRIMENTI NON SEI AUTORIZZATO
	                session.removeAttribute("username");
	                session.removeAttribute("passwd");
	                session.setAttribute("failedlog",true);
	                session.removeAttribute("cliente");
	                response.sendRedirect("/LaTanaDelGamer/it/login");    
	            }   
	        }
	            break;
			
			}
			
	 }
	 
}