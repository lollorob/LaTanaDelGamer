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

import org.json.*;

import it.unisa.model.AccountUserModelDS;
import it.unisa.utils.Utility;


@WebServlet("/AjaxFilter")
public class AjaxFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		HttpSession session=request.getSession();
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		
		String operazione = request.getParameter("valore");
		String risposta = "";
		Utility.print("ENTRATO NELLA SERVLET");
		
		if(operazione.equalsIgnoreCase("Utenti")) {
			AccountUserModelDS model = new AccountUserModelDS(ds);
			JSONArray listaUtenti = null;
			try {
				listaUtenti = model.AjaxLoadAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			risposta = listaUtenti.toString();	
		}
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append(risposta);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
