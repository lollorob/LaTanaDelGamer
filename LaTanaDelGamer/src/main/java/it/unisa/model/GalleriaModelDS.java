package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class GalleriaModelDS implements EntityModel<GalleriaBean> {

	private DataSource ds = null;
	
	public GalleriaModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	
	@Override
	public GalleriaBean doRetrieveByKey(Object chiave) throws SQLException {
		int code = (int)chiave;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		GalleriaBean galleria = new GalleriaBean();

		String selectSQL = "SELECT * FROM galleria WHERE id_media = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			Utility.print("doRetrieveByKey: " + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				galleria.setId_media(rs.getInt("id_media"));
				galleria.setId_prodotto(rs.getInt("id_prodotto"));
			}

			Utility.print(galleria.toString());
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

		return galleria;
	}

	@Override
	public Collection<GalleriaBean> doRetrieveAll(String ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM categoria";
		
		if(ordine != null && !ordine.equals("")) {
			selectSQL += " ORDER BY " + ordine;
		}
		
		Collection<GalleriaBean> gallerie = new LinkedList<GalleriaBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				GalleriaBean galleria = new GalleriaBean();
				
				galleria.setId_media(rs.getInt("id_media"));
				galleria.setId_prodotto(rs.getInt("id_prodotto"));

				
				gallerie.add(galleria);
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
		
		return gallerie;
		
	}

	@Override
	public void doSave(GalleriaBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO galleria" + " (id_media, id_prodotto) VALUES (?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setInt(1, item.getId_media());
			preparedStatement.setInt(2, item.getId_prodotto());
			
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
	public void doUpdate(GalleriaBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE galleria SET " + "id_prodotto = ? WHERE id_media = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setInt(1, item.getId_prodotto());

			
			preparedStatement.setInt(2, item.getId_media());

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
	public void doDelete(GalleriaBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String deleteSQL = "DELETE FROM galleria WHERE id_media = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, item.getId_media());

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


