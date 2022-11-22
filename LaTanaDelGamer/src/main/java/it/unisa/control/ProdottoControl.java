package it.unisa.control;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDS;
import it.unisa.utils.Utility;


@WebServlet(name = "ProdottoControl", value = "/prodotti/*")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		) //per mandare file binari
public class ProdottoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String SAVE_DIR = "immaginiDB";

	public void init() {
		// Get the file location where it would be stored
		SAVE_DIR = getServletConfig().getInitParameter("file-upload");
	}
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		
		switch (path) {
			case "/": 
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/prodotti.jsp").forward(request, response);
				break;
				
			case "/mostra":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/prodotto.jsp").forward(request, response);
				break;
			
			case "/immagine" : {
				ProdottoModelDS pro = new ProdottoModelDS(ds);
				String id_prodotto = (String) request.getParameter("id_prodotto");
				if(id_prodotto != null) {
					byte[] bt;
					try {
						bt = pro.load(id_prodotto);
						ServletOutputStream out = response.getOutputStream();
						if(bt != null) {
							out.write(bt);
							response.setContentType("image/jpg");
						}
						out.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				}
			}
			break;
				
			case "/crea":			
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/prodotto.jsp").forward(request, response);
				break;
				
			case "/cerca":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
				break;
				
			case "/ricercaAvanzata":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
				break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		HttpSession session=request.getSession();

		switch(path) {
			case "/crea":{
				ProdottoModelDS model = new ProdottoModelDS(ds);
			
				
				try {	
							
					ProdottoBean prodotto = new ProdottoBean();
					
					
					prodotto.setNome(request.getParameter("nome"));
					prodotto.setPrezzo(Float.parseFloat(request.getParameter("prezzo")));
					prodotto.setDescrizione(request.getParameter("descrizione"));
					prodotto.setCasaproduttrice(request.getParameter("casaproduttrice"));
					prodotto.setQuantita(Integer.parseInt(request.getParameter("quantita")));
					InputStream inputStream = null; // input stream of the upload file
			         
				        // obtains the upload file part in this multipart request
				        Part filePart = request.getPart("copertina");
				        if (filePart != null) {
				            // prints out some information for debugging
				            System.out.println(filePart.getName());
				            System.out.println(filePart.getSize());
				            System.out.println(filePart.getContentType());
				             
				            // obtains input stream of the upload file
				            inputStream = filePart.getInputStream();
				        }
					prodotto.setnomeCategoria(request.getParameter("nome_categoria"));
					model.doSavePhoto(prodotto, inputStream);
					request.setAttribute("message", "Account " + prodotto.getNome() + " AGGIUNTO");
					
				} catch(SQLException e) {
					Utility.print(e);
					
					request.setAttribute("error", e.getMessage());
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index.jsp");
					dispatcher.forward(request, response);
					return;
				}				
				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
			}
			break;
			
			case "/dettagli":
			{	
				ProdottoModelDS model = new ProdottoModelDS(ds);
				try {
					String id = request.getParameter("id");
					int chiave=Integer.parseInt(id);
					
					request.removeAttribute("prodotto");
					session.setAttribute("prodotti", model.doRetrieveByKey(chiave));
					
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
			}
				break;
			
		
			case "/elimina" :{
				
				String id = request.getParameter("id");
				int chiave=Integer.parseInt(id);
				ProdottoModelDS model= new ProdottoModelDS(ds);
				ProdottoBean bean= new ProdottoBean();
				try {
					bean = model.doRetrieveByKey(chiave);
					
					if (bean != null) {
						model.doDelete(bean);
					}
					
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
			}
			
				break;
			
			case "/aggiorna" :{			
				ProdottoModelDS model = new ProdottoModelDS(ds);
				ProdottoBean prodotto = new ProdottoBean();
				
				try {	
							
					
					String id = request.getParameter("id");
					int chiave=Integer.parseInt(id);

					prodotto.setId_prodotto(chiave);
					prodotto.setNome(request.getParameter("nome"));
					prodotto.setPrezzo(Float.parseFloat(request.getParameter("prezzo")));
					prodotto.setDescrizione(request.getParameter("descrizione"));
					prodotto.setCasaproduttrice(request.getParameter("casaproduttrice"));
					prodotto.setQuantita(Integer.parseInt(request.getParameter("quantita")));

					 InputStream inputStream = null; // input stream of the upload file
			         
				        // obtains the upload file part in this multipart request
				        Part filePart = request.getPart("copertina");
				        if (filePart != null) {
				            // prints out some information for debugging
				            System.out.println(filePart.getName());
				            System.out.println(filePart.getSize());
				            System.out.println(filePart.getContentType());
				             
				            // obtains input stream of the upload file
				            inputStream = filePart.getInputStream();
				        }
					prodotto.setnomeCategoria(request.getParameter("nome_categoria"));
					model.doUpdatePhoto(prodotto, inputStream);
					request.setAttribute("message", "Prodotto" + prodotto.getNome() + " AGGIUNTO");
					
				}  catch (SQLException e) {
					e.printStackTrace();
			}
				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
	}
			break;
		
	}
}
	
	

}

