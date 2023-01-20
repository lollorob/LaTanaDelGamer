package it.unisa.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Collection;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDS;

@WebListener
public class MainContext implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		Utility.print("Startup web application");

		ServletContext context = sce.getServletContext();

		DataSource ds = null;

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/la_tana_del_gamer");

			Connection con = null;
			try {
				con = ds.getConnection();

				DatabaseMetaData metaData = con.getMetaData();
				Utility.print("DBMS name: " + metaData.getDatabaseProductName());
				Utility.print("DBMS version: " + metaData.getDatabaseProductVersion());

			} finally {
				if (con != null)
					con.close();
			}
		} catch (SQLException | NamingException e) {
			Utility.print(e);
		} 

		context.setAttribute("DataSource", ds);
		Utility.print("DataSource creation: " + ds.toString());

		populateDB(sce,ds);
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		ServletContext context = sce.getServletContext();
		
		context.removeAttribute("DataSource");
		
		Utility.print("Shutdown web application");
	}
	

	public void populateDB(ServletContextEvent sce, DataSource ds) {
	
		ProdottoModelDS modelDS = new ProdottoModelDS(ds);
		Collection<?> prodotti=null;
		try {
			prodotti = modelDS.doRetrieveAll("");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
		String path = sce.getServletContext().getRealPath("/")+"copertineGiochi/foto";
		
		if(prodotti != null && prodotti.size() > 0) {
			
			Iterator<?> it = prodotti.iterator();
			while(it.hasNext()) {
				ProdottoBean prodotto = (ProdottoBean)it.next();
				String id = prodotto.getId_prodotto()+"";
				
				if(!prodotto.getCopertina().equals(""))
					break;
				 File initialFile = new File(path+id+".jpg");
				 InputStream targetStream=null;
				try {
					targetStream = new FileInputStream(initialFile);
					
					
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				}
				 try {
					
					modelDS.doUpdatePhoto(prodotto, targetStream);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
			}
		
		}	
	}
		
	/*	System.out.println(sce.getServletContext().getContextPath());
		System.out.println(new File("").getAbsolutePath());
		File newFile= new File(sce.getServletContext().getContextPath());
		InputStream targetStream=null;
		try {
			targetStream = new FileInputStream(newFile);
			try {
				System.out.println(targetStream.readAllBytes());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
		System.out.println(sce.getServletContext().getRealPath("/"));
		String path = sce.getServletContext().getRealPath("/")+"copertineGiochi/foto1.jpg";
		System.out.println(path);
		File newFile = new File(path);
		try {
			InputStream targetStream = new FileInputStream(newFile);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(newFile.exists());
	}
	*/
	
}
