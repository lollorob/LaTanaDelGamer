package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class ItemOrdineModelDS implements EntityModel<ItemOrdineBean> {

	private DataSource ds = null;
	
	public ItemOrdineModelDS(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public ItemOrdineBean doRetrieveByKey(Object chiave) throws SQLException {
		int code = (int)chiave;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ItemOrdineBean prodotto = new ItemOrdineBean();

		String selectSQL = "SELECT * FROM itemordine WHERE id_ordine = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			Utility.print("doRetrieveByKey: " + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				prodotto.setId_ordine(rs.getInt("id_ordine"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setPrezzo(rs.getFloat("prezzo"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setQuantita(rs.getInt("quantita"));
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
	public Collection<ItemOrdineBean> doRetrieveAll(String ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM itemordine";
		
		if(ordine != null && !ordine.equals("")) {
			selectSQL += " ORDER BY " + ordine;
		}
		
		Collection<ItemOrdineBean> prodotti = new LinkedList<ItemOrdineBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ItemOrdineBean prodotto = new ItemOrdineBean();
				
				prodotto.setId_ordine(rs.getInt("id_ordine"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setPrezzo(rs.getFloat("prezzo"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setQuantita(rs.getInt("quantita"));	
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
	public void doSave(ItemOrdineBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO itemordini" + " (id_ordine, nome_prodotto, prezzo_prodotto, descrizione_prodotto, quantita_prodotto) VALUES (?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setInt(1, item.getId_ordine());
			preparedStatement.setString(2, item.getNome());
			preparedStatement.setFloat(3, item.getPrezzo());
			preparedStatement.setString(4, item.getDescrizione());
			preparedStatement.setInt(5, item.getQuantita());
			
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
	public void doUpdate(ItemOrdineBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE itemordine SET " + "nome_prodotto = ?, prezzo_prodotto = ?, descrizione_prodotto = ?, quantita_prodotto = ? WHERE id_ordine = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setString(1, item.getNome());
			preparedStatement.setFloat(2, item.getPrezzo());
			preparedStatement.setString(3, item.getDescrizione());		
			preparedStatement.setInt(4,item.getQuantita());
			preparedStatement.setInt(5, item.getId_ordine());
			
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
	public void doDelete(ItemOrdineBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String deleteSQL = "DELETE FROM itemordine WHERE id_ordine = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, item.getId_ordine());

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
	
	

}
