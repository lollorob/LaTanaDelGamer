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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(ItemOrdineBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(ItemOrdineBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	

}
