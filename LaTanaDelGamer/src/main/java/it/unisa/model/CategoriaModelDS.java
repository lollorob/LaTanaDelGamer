package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;


import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class CategoriaModelDS implements EntityModel<CategoriaBean> {
	private DataSource ds = null;
	
	public CategoriaModelDS(DataSource ds) {
		this.ds = ds; 
	}

	@Override
	public CategoriaBean doRetrieveByKey(Object chiave) throws SQLException {
		String code = (String)chiave;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		CategoriaBean categoria = new CategoriaBean();

		String selectSQL = "SELECT * FROM categoria WHERE nome = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			Utility.print("doRetrieveByKey: " + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				categoria.setNome(rs.getString("nome"));
				categoria.setDidascalia(rs.getString("didascalia"));
			}

			Utility.print(categoria.toString());
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
		return null;
	}

	@Override
	public Collection<CategoriaBean> doRetrieveAll(String ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM categoria";
		
		if(ordine != null && !ordine.equals("")) {
			selectSQL += " ORDER BY " + ordine;
		}
		
		Collection<CategoriaBean> categorie = new LinkedList<CategoriaBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				CategoriaBean categoria = new CategoriaBean();
				
				categoria.setNome(rs.getString("nome"));
				categoria.setDidascalia(rs.getString("didascalia"));
				
				categorie.add(categoria);
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
		return categorie;
	}

	@Override
	public void doSave(CategoriaBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO categoria" + " (nome,didascalia) VALUES (?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setString(1, item.getNome());
			preparedStatement.setString(2, item.getDidascalia());
				
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
	public void doUpdate(CategoriaBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE categoria SET " + "didascalia = ? WHERE nome = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			preparedStatement.setString(1, item.getDidascalia());

			
			preparedStatement.setString(2, item.getNome());

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
	public void doDelete(CategoriaBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String deleteSQL = "DELETE FROM categoria WHERE nome = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, item.getNome());

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
	
	
	Collection<CategoriaBean> doRetrieveProdottiByCategoria(String nome) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM categoria c ,prodotto p WHERE c.nome='" + nome + "' AND p.nome_categoria.nome=c.nome";
		
		
		Collection<CategoriaBean> categorie = new LinkedList<CategoriaBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveProdottiByCategory: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				CategoriaBean categoria = new CategoriaBean();
				
				categoria.setNome(rs.getString("nome"));
				categoria.setDidascalia(rs.getString("didascalia"));
				categorie.add(categoria);
				categoria.setProdotto(new LinkedList<>());
				
				ProdottoBean prodotto = new ProdottoBean(); 
				prodotto.setId_prodotto(rs.getInt("id_prodotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setPrezzo(rs.getFloat("prezzo"));
				prodotto.setCasaproduttrice(rs.getString("casaproduttrice"));
				prodotto.setQuantita(rs.getInt("quantita"));
				prodotto.setnomeCategoria(rs.getString("nome_categoria"));
				
				categoria.getProdotto().add(prodotto);
				while(rs.next()) { //estraggo solamente i dati relativi ai prodotti poich� i dati della categoria sono gli stessi
					categoria.getProdotto().add(prodotto);
					
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
		
		return categorie;

	}
}
