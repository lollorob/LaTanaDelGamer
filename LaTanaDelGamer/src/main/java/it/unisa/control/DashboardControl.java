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

@WebServlet(name= "DashboardControl" , value="/Dashboard/*")
public class DashboardControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doPost(request,response);
	    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		HttpSession session=request.getSession();
		AccountUserBean user = new AccountUserBean();
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		
		switch(path) {
	
            
		case "/home":
		{
			
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
            
            
            if (user.isAdmin()) { //SE ADMIN
            	 	OrdineModelDS ordine = new OrdineModelDS(ds);
            	 	AccountUserModelDS utente = new AccountUserModelDS(ds);
            	 	ProdottoModelDS prodotto = new ProdottoModelDS(ds);
            	 	
                    session.setAttribute("adminRoles", true);
                    session.setAttribute("nomeAdmin",user.getNome());
                    session.setAttribute("usernameSessione", user.getUsername());
                    Collection<OrdineBean> ord;
                    
					try {
						
						ord = ordine.doRetrieveAll("");
	                    request.setAttribute("numeroOrdini",ord.size());
	                    
	                    
	                    request.setAttribute("guadagnoTotale",ordine.CalculateMoney());
	                    
	                    Collection<AccountUserBean> ute = utente.doRetrieveAll("");
	                    request.setAttribute("numeroClienti",ute.size());
	                    
	                    Collection<ProdottoBean> pro = prodotto.doRetrieveAll("");
	                    request.setAttribute("numeroProdotti",pro.size());
	                    
	                    
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
                    request.getRequestDispatcher("/WEB-INF/Views/Dashboard/home.jsp").forward(request, response);
					

                    
            }else{ // ALTRIMENTI NON SEI AUTORIZZATO
                session.removeAttribute("username");
                session.removeAttribute("passwd");
                session.setAttribute("failedAdmin",true);
                session.removeAttribute("adminRoles");
                response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin");    
            }
		}
		break;
		
		
		case "/logout":
		{
			session.invalidate();
            response.sendRedirect(request.getContextPath()+"/accounts/loginAdmin");
		}    
			break;
			
		case "/prodotti":
		{
			ProdottoModelDS proDS = new ProdottoModelDS(ds);
			CategoriaModelDS catDS = new CategoriaModelDS(ds);
			String order="ASC";
			String filtro="id_prodotto";
			
			
			
			if(request.getParameter("order")!=null) {
				order=request.getParameter("order");
				session.setAttribute("order",order);
			}
	
			if(request.getParameter("filtro")!=null) {
				filtro=request.getParameter("filtro");
				session.setAttribute("filtro",filtro);
			}
			
			
			try {
				Collection<ProdottoBean> prodotto = proDS.doRetrieveAll(filtro +" "+ order);
				session.setAttribute("listaProdotti",prodotto);
				
				Collection<CategoriaBean> categoria = catDS.doRetrieveAll("");
				session.setAttribute("listaCategorie",categoria);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/prodotti.jsp").forward(request, response);
		}
			break;
		
		case "/categorie":
		{
			CategoriaModelDS catDS = new CategoriaModelDS(ds);
			try {
				Collection<CategoriaBean> categoria = catDS.doRetrieveAll("");
				session.setAttribute("listaCat",categoria);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/categorie.jsp").forward(request, response);
		}
			break;
			
		case "/ordini":
		{
			
			if(request.getParameter("flagReset")!=null) {  //se l'utente ha cliccato reset elimino i parametri di sessione
				session.removeAttribute("dateInizio");
				session.removeAttribute("dateFine");
				session.removeAttribute("userSelected");
			}
			
			OrdineModelDS ordDS = new OrdineModelDS(ds);
			AccountUserModelDS modDS = new AccountUserModelDS(ds);
			Collection<OrdineBean> ordine=null;
		try {
			Collection<AccountUserBean> utenti = modDS.doRetrieveAll("");  //mando alla select del form
			session.setAttribute("utentiOrdini", utenti);                  //tutti gli username
			 
			
			
			String dateFrom="2000-01-01";
			if(session.getAttribute("dateInizio")!=null){					//se c'è già un parametro di inizio data in sessione
		    	dateFrom=(String) session.getAttribute("dateInizio");		//lo sovrascrivo
		    }
			
			String dateTo="2999-12-31";
			if(session.getAttribute("dateFine")!=null){						//se c'è già un parametro di fine data in sessione
		    	dateTo=(String) session.getAttribute("dateFine");  			//lo sovrascrivo
		    }
			String username="";
			if(session.getAttribute("userSelected")!=null){					//se già presente username lo sovrascrivo in sessione
		    	username=(String) session.getAttribute("userSelected");
		    }
			
			
				//flag per filtrare date e username
			if(request.getParameter("dateFrom")!=null && request.getParameter("dateFrom").length()!=0 ) {
				dateFrom=request.getParameter("dateFrom"); //salvo dateFrom se è stato inserito
				session.setAttribute("dateInizio", dateFrom);
			}
			if(request.getParameter("dateTo")!=null && request.getParameter("dateTo").length()!=0) {	
				dateTo=request.getParameter("dateTo");  //salvo dateTo se è stato inserito
				session.setAttribute("dateFine",  dateTo );
			}
			
			if(request.getParameter("utente")!=null) {
				username=request.getParameter("utente");	//salvo l'username selezionato
				session.setAttribute("userSelected",  username );
			}	
				
			if(username.equalsIgnoreCase("AllUsers") || username.length()==0) 
						ordine = ordDS.doRetrieveOrdiniByTwoDates(dateFrom, dateTo);  //se non è stato selezionato nessun utente
																					//mostro gli ordini di tutti in base alle date 
			else                                                                      
				ordine = ordDS.doRetrieveOrdiniByTwoDatesAndUser(dateFrom, dateTo, username);  // altrimentifiltro il tutto o con i parametri salvati in}
			}catch (SQLException e) {														//sessione o con quelli appena inviati dal form
				
				e.printStackTrace();
			}
				
			session.setAttribute("listaOrdini",ordine);
			
			
				
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/ordini.jsp").forward(request, response);
		}
		break;
		
		
			
		case "/account":
		{
			AccountUserModelDS accDS = new AccountUserModelDS(ds);
			try {
				Collection<AccountUserBean> account = accDS.doRetrieveAll("is_admin");
				session.setAttribute("listaAccount", account);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/accounts.jsp").forward(request, response);
		}
		break;
		
		default:
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Risorsa non Trovata");
		}	
	}
}
