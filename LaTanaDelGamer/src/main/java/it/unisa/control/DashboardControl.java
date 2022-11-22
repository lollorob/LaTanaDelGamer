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
			try {
				Collection<ProdottoBean> prodotto = proDS.doRetrieveAll("");
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
			OrdineModelDS ordDS = new OrdineModelDS(ds);
			Collection<OrdineBean> ordine;
			try {
				ordine = ordDS.doRetrieveAll("");
				session.setAttribute("listaOrdini",ordine);
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
