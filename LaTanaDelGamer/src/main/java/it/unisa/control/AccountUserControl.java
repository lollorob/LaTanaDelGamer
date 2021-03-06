package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.util.ArrayList;

import it.unisa.model.AccountUserBean;
import it.unisa.model.AccountUserModelDS;
import it.unisa.model.CategoriaBean;
import it.unisa.model.CategoriaModelDS;
import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDS;
import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDS;




@WebServlet(name = "AccountUserControl", value = "/accounts/*")
public class AccountUserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountUserModelDS tmp;
	
	
	@Override
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");

		switch (path) {
			case "/": 
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/accounts.jsp").forward(request, response);
				break;

			case "/crea":			
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/account.jsp").forward(request, response);
				break;
				
			case "/loginAdmin":  //pagina login Admin
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/loginAdmin.jsp").forward(request,response);
			break;
		}
    }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		HttpSession session=request.getSession();
		
		switch(path) {
		
		case "/crea":
		{
			AccountUserModelDS model = new AccountUserModelDS(ds);
				try {
					String username = request.getParameter("username");
					String e_mail = request.getParameter("e_mail");
					String passwd = request.getParameter("passwd");
				    String nome = request.getParameter("nome");
				    String cognome = request.getParameter("cognome");
				    String data = request.getParameter("datadinascita");
				    int n_Ordini = 0;
				    String via = request.getParameter("via");
				    int numero = Integer.parseInt(request.getParameter("numero"));
				    long cap = Long.parseLong(request.getParameter("cap"));
				    String citta = request.getParameter("citta");
				    String provincia = request.getParameter("provincia");
				    boolean admin=Boolean.parseBoolean(request.getParameter("is_admin"));
				 
					AccountUserBean account = new AccountUserBean();
					
					account.setUsername(username);
					account.seteMail(e_mail);
					account.setPasswd(passwd);
					account.setNome(nome);
					account.setCognome(cognome);
					account.setData(data);
					account.setn_Ordini(n_Ordini);
					account.setVia(via);
					account.setNumero(numero);
					account.setCap(cap);
					account.setCitta(citta);
					account.setProvincia(provincia);
					account.setAdmin(admin);
					model.doSave(account);
					request.setAttribute("message", "Account " + account.getUsername() + " AGGIUNTO");
					response.sendRedirect(request.getContextPath() + "/Dashboard/account");
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
			break;
		case "/dettagli":
		{	
			AccountUserModelDS model = new AccountUserModelDS(ds);
			try {
				String username = request.getParameter("id");
				request.removeAttribute("account");
				session.setAttribute("clienti", model.doRetrieveByKey(username));
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/Dashboard/account");
		}
			break;
		
		case "/aggiorna":
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
				response.sendRedirect(request.getContextPath() + "/Dashboard/account");
	}
			break;
		
		case "/cancella":{
			AccountUserModelDS model = new AccountUserModelDS(ds);
			AccountUserBean bean = new AccountUserBean();
			
					try {
						String username = request.getParameter("id");
						bean = model.doRetrieveByKey(username);
						if (bean != null && !bean.isEmpty()) {
						model.doDelete(bean);
						request.setAttribute("message", "Account " + bean.getUsername() + " CANCELLATO");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					response.sendRedirect(request.getContextPath() + "/Dashboard/account");
		}
			break;
			
		case "/loginAdmin":  //pagina login Admin
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/loginAdmin.jsp").forward(request,response);
			break;
		
		case "/loginCliente":  //login cliente (ricerca nel db)
			break;
			
		case "/registrati":  //registrazione cliente
			break;
			
		
			
		default:
			response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non Consentita");
	
		}
	}
}
