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
			
			case "/ordini":
				request.getRequestDispatcher("/WEB-INF/Views/Cliente/ordini.jsp").forward(request,response);
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