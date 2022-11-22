package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;


import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class RecensioneModelDS implements EntityModel<RecensioneBean> {

	private DataSource ds = null;
	
	public RecensioneModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public RecensioneBean doRetrieveByKey(Object chiave) throws SQLException {
		int code = (int)chiave;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		RecensioneBean recensione = new RecensioneBean();

		String selectSQL = "SELECT * FROM reensione WHERE id_recensione = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			Utility.print("doRetrieveByKey: " + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				recensione.setId_recensione(rs.getInt("id_recensione"));
				recensione.setNome(rs.getString("nome"));
				recensione.setValutazione(rs.getInt("valutazione"));
				recensione.setDescrizione(rs.getString("descrizione"));
				recensione.setId_prodotto(rs.getInt("id_prodotto"));			
			}

			Utility.print(recensione.toString());
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

		return recensione;
	}

	@Override
	public Collection<RecensioneBean> doRetrieveAll(String ordine) throws SQLException {
		return null;
	}

	@Override
	public void doSave(RecensioneBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO recensione" + " (id_recensione,nome,valutazione,descrizione,id_prodotto) VALUES (?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setInt(1, item.getId_recensione());
			preparedStatement.setString(2, item.getNome());
			preparedStatement.setInt(3, item.getValutazione());
			preparedStatement.setString(4, item.getDescrizione());
			preparedStatement.setInt(5, item.getId_prodotto());
			
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
	public void doUpdate(RecensioneBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE recensione SET " + " nome = ?,valutazione = ?,descrizione = ?,id_prodotto = ? WHERE id_recensione = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setString(1, item.getNome());
			preparedStatement.setInt(2, item.getValutazione());
			preparedStatement.setString(3, item.getDescrizione());
			preparedStatement.setInt(4, item.getId_prodotto());
			preparedStatement.setInt(5, item.getId_recensione());

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
	public void doDelete(RecensioneBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String deleteSQL = "DELETE FROM recensione WHERE id_recensione = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, item.getId_recensione());

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
	
	

