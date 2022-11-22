package it.unisa.control;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.model.AccountUserBean;
import it.unisa.model.AccountUserModelDS;
import it.unisa.utils.Utility;

@WebServlet("/AccountUserControl")
public class AccountUserControlProva extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");

		AccountUserModelDS model = new AccountUserModelDS(ds);

		
		String sort = request.getParameter("sort");
		
		String action = request.getParameter("action");
		
		try {
			request.setAttribute("accounts", model.doRetrieveAll(""));
			if (action != null) {
				
			if (action.equals("details")) {
					String username = request.getParameter("id");
					request.removeAttribute("account");
					request.setAttribute("account1", model.doRetrieveByKey(username));
			}		
			else if (action.equals("insert")) {
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
			} else if (action.equals("delete")) {
				String username = request.getParameter("id");
				AccountUserBean bean = model.doRetrieveByKey(username);
				if (bean != null && !bean.isEmpty()) {
					model.doDelete(bean);
					request.setAttribute("message", "Account " + bean.getUsername() + " CANCELLATO");
				}
			} else if (action.equals("update")) {
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

				AccountUserBean account = new AccountUserBean();
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
			}
			}
		} catch(SQLException e) {
			Utility.print(e);
			
			request.setAttribute("error", e.getMessage());
		}
		
		try {
			request.removeAttribute("accounts");
			request.setAttribute("accounts", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/AccountUserView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}


}
