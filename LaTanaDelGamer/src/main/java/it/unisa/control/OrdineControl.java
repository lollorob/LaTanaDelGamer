package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import it.unisa.model.AccountUserBean;
import it.unisa.model.AccountUserModelDS;
import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDS;


@WebServlet(name="OrdineControl", value = "/ordini/*")
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		switch (path) {
			case "/": 
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/ordini.jsp").forward(request, response);
				break;
				
			case "/mostra":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/ordini.jsp").forward(request, response);
				break;
				
			case "/cerca":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
				break;

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		HttpSession session=request.getSession();
		
		switch (path) {
		case "/": 
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/ordini.jsp").forward(request, response);
			break;
		case "/elimina":
		{
			OrdineModelDS model = new OrdineModelDS(ds);
			OrdineBean bean = new OrdineBean();
					try {
						String id_ordine = request.getParameter("id");
						int id = Integer.parseInt(id_ordine);
						System.out.println(id);
						bean = model.doRetrieveByKey(id);
						if (bean != null ) {
						model.doDelete(bean);
						request.setAttribute("message", "Ordine " + bean.getId_ordine() + " CANCELLATO");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					response.sendRedirect(request.getContextPath() + "/Dashboard/ordini");
			
			
		}
		break;
		
		case "/aggiorna":
		{
			
			
			
			
		}
		break;
		
		case "/dettagli":
		{
			OrdineModelDS model = new OrdineModelDS(ds);
			try {
				String id_ordine = request.getParameter("id");
				int id = Integer.parseInt(id_ordine);
				request.removeAttribute("account");
				session.setAttribute("ordini", model.doRetrieveByKey(id));
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/Dashboard/ordini");
		}
		break;

	}
	}

}
