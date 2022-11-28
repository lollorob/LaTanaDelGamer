package it.unisa.control;

import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import it.unisa.model.AccountUserBean;
import it.unisa.model.AccountUserModelDS;
import it.unisa.model.CategoriaBean;
import it.unisa.model.CategoriaModelDS;
import it.unisa.utils.Utility;

@WebServlet(name = "CategoriaControl", value = "/categorie/*")
public class CategoriaControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		switch (path) {
			case "/": 
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/categorie.jsp").forward(request, response);
				break;
				
			case "/mostra":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/categoria.jsp").forward(request, response);
				break;
				
			case "/crea":			
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/categoria.jsp").forward(request, response);
				break;
				
			case "/cerca":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
				break;

		}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		HttpSession session=request.getSession();
		
		switch (path) {
		case "/": 
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/categorie.jsp").forward(request, response);
			break;
			
		case "/mostra":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/categoria.jsp").forward(request, response);
			break;
			
		case "/crea":			
			
			DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
			
			CategoriaModelDS model = new CategoriaModelDS(ds);
		
			
			try {	
						
				CategoriaBean categoria = new CategoriaBean();
				
				
				categoria.setNome(request.getParameter("nome"));
				categoria.setDidascalia(request.getParameter("didascalia"));
				model.doSave(categoria);
				request.setAttribute("message", "Account " + categoria.getNome() + "CATEGORIA AGGIUNTA");
				
			} catch(SQLException e) {
				Utility.print(e);
				request.setAttribute("error", e.getErrorCode());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Views/Dashboard/categoria.jsp");
				dispatcher.forward(request, response);
				return;
			}
			
			response.sendRedirect(request.getContextPath() + "/Dashboard/categorie");
			break;
			
		case "/cerca":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
			break;

			
		case "/dettagli":
		{	
			ds = (DataSource)getServletContext().getAttribute("DataSource");
			model= new CategoriaModelDS(ds);
			try {
				String nomeCategoria = request.getParameter("nome");
				//request.removeAttribute("account");
				CategoriaBean bean = model.doRetrieveByKey(nomeCategoria);
				System.out.println("Servlet " + bean.getNome());
				session.setAttribute("categoriaSelezionata", bean);
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/Dashboard/categorie");
		}
			break;
			
		case "/aggiorna":
		{
			ds = (DataSource)getServletContext().getAttribute("DataSource");
			model = new CategoriaModelDS(ds);
			CategoriaBean categoria = new CategoriaBean();
				try {
					;
				    String nome = request.getParameter("nome");
				    String didascalia = request.getParameter("didascalia");
				    

					categoria.setNome(nome);
					categoria.setDidascalia(didascalia);
					
					model.doUpdate(categoria);
					
					request.setAttribute("message", "Categoria " + categoria.getNome() + " AGGIORNATA");
				} catch (SQLException e) {
					e.printStackTrace();
			}
				response.sendRedirect(request.getContextPath() + "/Dashboard/categorie");
	}
			break;
			
		case "/cancella":
		{
			ds = (DataSource)getServletContext().getAttribute("DataSource");
			model = new CategoriaModelDS(ds);
			CategoriaBean categoria = new CategoriaBean();
				try {
					;
				    String nome = request.getParameter("nome");
				    categoria=model.doRetrieveByKey(nome);
				    
					model.doDelete(categoria);
					
					request.setAttribute("message", "Categoria " + categoria.getNome() + " Eliminata");
				} catch (SQLException e) {
					e.printStackTrace();
			}
				response.sendRedirect(request.getContextPath() + "/Dashboard/categorie");
	}
			break;
			
			
	}

	}

}

