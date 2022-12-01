package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
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
import it.unisa.model.CategoriaBean;
import it.unisa.model.CategoriaModelDS;
import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDS;
import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDS;
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
				ProdottoModelDS prodotto = new ProdottoModelDS(ds);
				Collection<?> prodotti;
				try {
					if(str.equals("MostraTutto"))  {
						prodotti = prodotto.doRetrieveAll("");
					}else {
						 prodotti = prodotto.doRetrieveProdottiByCategoria(str);
					}
					
					
					request.setAttribute("prodottiCat", prodotti);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/prodottiCategoria.jsp").forward(request, response);	
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
				
			case "/logout": 
				session.invalidate();
	            response.sendRedirect(request.getContextPath()+"/it/home");
				break;
				
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