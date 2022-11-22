package it.unisa.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class ProdottoModelDS implements EntityModel<ProdottoBean> {

	private DataSource ds = null;
	
	public ProdottoModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public ProdottoBean doRetrieveByKey(Object chiave) throws SQLException {
		int code = (int)chiave;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProdottoBean prodotto = new ProdottoBean();

		String selectSQL = "SELECT * FROM prodotto WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			Utility.print("doRetrieveByKey: " + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				prodotto.setId_prodotto(rs.getInt("id_prodotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setPrezzo(rs.getFloat("prezzo"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setCasaproduttrice(rs.getString("casaproduttrice"));
				prodotto.setQuantita(rs.getInt("quantita"));
				prodotto.setnomeCategoria(rs.getString("nome_categoria"));
				
			}

			Utility.print(prodotto.toString());
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}

		return prodotto;
	}

	@Override
	public Collection<ProdottoBean> doRetrieveAll(String ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM prodotto";
		
		if(ordine != null && !ordine.equals("")) {
			selectSQL += " ORDER BY " + ordine;
		}
		
		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setId_prodotto(rs.getInt("id_prodotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setPrezzo(rs.getFloat("prezzo"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setCasaproduttrice(rs.getString("casaproduttrice"));
				prodotto.setQuantita(rs.getInt("quantita"));
				prodotto.setCopertina(rs.getString("copertina"));
				prodotto.setnomeCategoria(rs.getString("nome_categoria"));

				
				prodotti.add(prodotto);
			}
			
		} finally {
			try {
			if(preparedStatement != null)
				preparedStatement.close();
			}finally {
			if(connection != null)
				connection.close();
			}
		  }
		
		return prodotti;
		
		
	}

	@Override
	public void doSave(ProdottoBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO prodotto" + " (nome, prezzo, descrizione, casaproduttrice, quantita, copertina, nome_categoria) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setString(1, item.getNome());
			preparedStatement.setFloat(2, item.getPrezzo());
			preparedStatement.setString(3, item.getDescrizione());
			preparedStatement.setString(4, item.getCasaProduttrice());
			preparedStatement.setInt(5, item.getQuantita());
			preparedStatement.setString(6, item.getCopertina());
			preparedStatement.setString(7, item.getnomeCategoria());
			
			Utility.print("doSave: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}

	}

	@Override
	public void doUpdate(ProdottoBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE prodotto SET " + "nome = ?, prezzo = ?, descrizione = ?, casaproduttrice = ?, quantita = ?, copertina = ?, nome_categoria = ? WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setString(1, item.getNome());
			preparedStatement.setFloat(2, item.getPrezzo());
			preparedStatement.setString(3, item.getDescrizione());
			preparedStatement.setString(4, item.getCasaProduttrice());
			preparedStatement.setInt(5,item.getQuantita());
			preparedStatement.setString(6, item.getCopertina());
			preparedStatement.setString(7, item.getnomeCategoria());

			preparedStatement.setInt(8, item.getId_prodotto());
			
			Utility.print("doUpdate: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}

	}

	@Override
	public void doDelete(ProdottoBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String deleteSQL = "DELETE FROM prodotto WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, item.getId_prodotto());

			Utility.print("doDelete: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}
	}
	
	Collection<ProdottoBean> doRetrieveRecensioniByProdotto(int prodottoID) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM recensione r ,prodotto p WHERE p.id_prodotto='" + prodottoID + "' AND p.id_prodotto=r.id_prodotto";
		
		
		
		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetrieveRecensioniByProdotto: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				
				ProdottoBean prodotto = new ProdottoBean(); 
				prodotto.setId_prodotto(rs.getInt("id_prodotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setPrezzo(rs.getFloat("prezzo"));
				prodotto.setCasaproduttrice(rs.getString("casaproduttrice"));
				prodotto.setQuantita(rs.getInt("quantita"));
				prodotto.setnomeCategoria(rs.getString("nome_categoria"));
				prodotto.setRecensioni(new LinkedList<>());
				
				
				RecensioneBean recensione = new RecensioneBean();
				recensione.setId_recensione(rs.getInt("id_recensione"));
				recensione.setNome(rs.getString("nome"));
				recensione.setValutazione(rs.getInt("valutazione"));
				recensione.setDescrizione(rs.getString("descrizione"));
				recensione.setId_prodotto(rs.getInt("id_prodotto"));
				prodotto.getRecensioni().add(recensione);
				
				
	
				while(rs.next()) { //estraggo solamente i dati relativi ai prodotti poich� i dati della categoria sono gli stessi
					prodotto.getRecensioni().add(recensione);
					
				}
			}
			
		} finally {
			try {
			if(preparedStatement != null)
				preparedStatement.close();
			}finally {
			if(connection != null)
				connection.close();
			}
		  }
		
		return prodotti;

	}
	
	
	
	public void doUpdatePhoto(ProdottoBean item, InputStream inputStream) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE prodotto SET " + "nome = ?, prezzo = ?, descrizione = ?, casaproduttrice = ?, quantita = ?, copertina = ?, nome_categoria = ? WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setString(1, item.getNome());
			preparedStatement.setFloat(2, item.getPrezzo());
			preparedStatement.setString(3, item.getDescrizione());
			preparedStatement.setString(4, item.getCasaProduttrice());
			preparedStatement.setInt(5,item.getQuantita());
			preparedStatement.setBlob(6, inputStream);
			preparedStatement.setString(7, item.getnomeCategoria());

			preparedStatement.setInt(8, item.getId_prodotto());
			
			Utility.print("doUpdate: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}

	}
	
	public synchronized byte[] load(String id_prodotto) throws SQLException{
		
		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		byte[] bt = null;
		
		try {
			connection = ds.getConnection();
			String sql = "SELECT copertina FROM Prodotto where id_prodotto = ?";
			stmt= connection.prepareStatement(sql);
			
			stmt.setString(1, id_prodotto);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				bt = rs.getBytes("copertina");
			}
		}
			finally {
				try {
					if(stmt != null) 
						stmt.close();
				} finally {
					if(connection != null)
						connection.close();
						
				}
				
			}
		return bt;
	}	
	
	public void doSavePhoto(ProdottoBean item, InputStream inputStream) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO prodotto" + " (nome, prezzo, descrizione, casaproduttrice, quantita, copertina, nome_categoria) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setString(1, item.getNome());
			preparedStatement.setFloat(2, item.getPrezzo());
			preparedStatement.setString(3, item.getDescrizione());
			preparedStatement.setString(4, item.getCasaProduttrice());
			preparedStatement.setInt(5, item.getQuantita());
			preparedStatement.setBlob(6, inputStream);
			preparedStatement.setString(7, item.getnomeCategoria());
			
			Utility.print("doSave: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}

	}
}

