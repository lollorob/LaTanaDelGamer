package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.Queue;

import javax.sql.DataSource;

import org.json.*;

import it.unisa.utils.Utility;


public class AccountUserModelDS implements EntityModel<AccountUserBean> {

	private DataSource ds = null;
	
	public AccountUserModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	
	
	@Override
	public AccountUserBean doRetrieveByKey(Object chiave) throws SQLException {
		String code = (String)chiave;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		AccountUserBean account = new AccountUserBean();

		String selectSQL = "SELECT * FROM accountuser WHERE username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			Utility.print("doRetrieveByKey: " + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				account.setUsername(rs.getString("username"));
				account.seteMail(rs.getString("e_mail"));
				account.setPasswd(rs.getString("passwd"));
				account.setNome(rs.getString("nome"));
				account.setCognome(rs.getString("cognome"));
				account.setData(rs.getString("datadinascita"));
				account.setn_Ordini(rs.getInt("n_ordini"));
				account.setVia(rs.getString("via"));
				account.setNumero(rs.getInt("numero"));
				account.setCap(rs.getLong("cap"));
				account.setCitta(rs.getString("citta"));
				account.setProvincia(rs.getString("provincia"));
				account.setAdmin(rs.getBoolean("is_admin"));
			}

			Utility.print(account.toString());
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

		return account;
	}
	
	  public JSONArray AjaxLoadAll() throws SQLException
	    {
	            JSONArray array = new JSONArray();
	    		Connection connection = null;
	    		PreparedStatement preparedStatement = null;
	    		
	    		String selectSQL = "SELECT * FROM accountuser";
	    		
	    		try {
	    		connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				
				Utility.print("doRetriveAll: " + preparedStatement.toString());
				
				ResultSet rs = preparedStatement.executeQuery();
				
				while(rs.next()) {
					JSONObject account = new JSONObject();
					
					account.put("username", rs.getString(1));
					account.put("e_mail", rs.getString(2));
					account.put("nome", rs.getString(3));
					account.put("cognome", rs.getString(4));
					account.put("datadinascita", rs.getString(5));
					account.put("n_ordini", rs.getInt(6));
					account.put("via", rs.getString(7));
					account.put("numero", rs.getInt(8));
					account.put("cap", rs.getLong(9));
					account.put("citta", rs.getString(10));
					account.put("provincia", rs.getString(11));
					account.put("is_admin", rs.getBoolean(12));
   
					array.put(account);
				}
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
				return array;
	    }
	            
	        
	    
	        
	    
	
	

	@Override
	public Collection<AccountUserBean> doRetrieveAll(String ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM accountuser";
		
		if(ordine != null && !ordine.equals("")) {
			selectSQL += " ORDER BY " + ordine;
		}
		
		Collection<AccountUserBean> accounts = new LinkedList<AccountUserBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				AccountUserBean account = new AccountUserBean();
				
				account.setUsername(rs.getString("username"));
				account.seteMail(rs.getString("e_mail"));
				account.setPasswd(rs.getString("passwd") );
				account.setNome(rs.getString("nome"));
				account.setCognome(rs.getString("cognome"));
				account.setData(rs.getString("datadinascita"));
				account.setn_Ordini(rs.getInt("n_ordini"));
				account.setVia(rs.getString("via"));
				account.setNumero(rs.getInt("numero"));
				account.setCap(rs.getLong("cap"));
				account.setCitta(rs.getString("citta"));
				account.setProvincia(rs.getString("provincia"));
				account.setAdmin(rs.getBoolean("is_admin"));
				
				accounts.add(account);
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
		
		return accounts;
	}

	@Override
	public void doSave(AccountUserBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO accountuser" + " (username,e_mail,passwd,nome,cognome,datadinascita,n_ordini,via,numero,cap,citta,provincia,is_admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setString(1, item.getUsername());
			preparedStatement.setString(2, item.geteMail());
			preparedStatement.setString(3, item.getPasswd());
			preparedStatement.setString(4, item.getNome());
			preparedStatement.setString(5, item.getCognome());
			preparedStatement.setString(6, item.getData());
			preparedStatement.setInt(7, item.getn_Ordini());
			preparedStatement.setString(8, item.getVia());
			preparedStatement.setInt(9, item.getNumero());
			preparedStatement.setLong(10, item.getCap());
			preparedStatement.setString(11, item.getCitta());
			preparedStatement.setString(12, item.getProvincia());
			preparedStatement.setBoolean(13, item.isAdmin());

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
	public void doUpdate(AccountUserBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE accountuser SET " + " e_mail = ?,nome = ?,cognome = ?,datadinascita = ?,via = ?,numero = ?,cap = ?,citta = ?,provincia = ? WHERE username = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setString(1, item.geteMail());			
			preparedStatement.setString(2, item.getNome());
			preparedStatement.setString(3, item.getCognome());
			preparedStatement.setString(4, item.getData());
			preparedStatement.setString(5, item.getVia());
			preparedStatement.setInt(6, item.getNumero());
			preparedStatement.setLong(7, item.getCap());
			preparedStatement.setString(8, item.getCitta());
			preparedStatement.setString(9, item.getProvincia());
			
			preparedStatement.setString(10, item.getUsername());

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
	
	public void doUpdateNumeroOrdini(AccountUserBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE accountuser SET " + " n_ordini = ? WHERE username = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setInt(1, item.getn_Ordini());			
			
			preparedStatement.setString(2, item.getUsername());

			Utility.print("doUpdateNumeroOrdini: " + preparedStatement.toString());
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
	public void doDelete(AccountUserBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String deleteSQL = "DELETE FROM accountuser WHERE username = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, item.getUsername());

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
		
	
	

    public AccountUserBean doRetrieveAccountUserByEmailPassword(String username, String passwd) throws SQLException {
    			AccountUserBean account = new AccountUserBean();
    			Connection connection = null;
    			try{
    			String sql = "SELECT * FROM accountuser WHERE accountuser.username = ? and accountuser.passwd=SHA1(?)";
    			connection = ds.getConnection();
    			PreparedStatement statement = connection.prepareStatement(sql);
    			statement.setString(1, username);
    			statement.setString(2, passwd);

    			ResultSet rs = statement.executeQuery();
    			
    			if (rs.next()) {
    				account.setUsername(rs.getString("username"));
    				account.seteMail(rs.getString("e_mail"));
    				account.setPasswd(rs.getString("passwd"));
    				account.setNome(rs.getString("nome"));
    				account.setCognome(rs.getString("cognome"));
    				account.setData(rs.getString("datadinascita"));
    				account.setn_Ordini(rs.getInt("n_ordini"));
    				account.setVia(rs.getString("via"));
    				account.setNumero(rs.getInt("numero"));
    				account.setCap(rs.getLong("cap"));
    				account.setCitta(rs.getString("citta"));
    				account.setProvincia(rs.getString("provincia"));
    				account.setAdmin(rs.getBoolean("is_admin"));
    			}
    			Utility.print("Retriveemailpasswd: " + statement.toString());
    			} catch (SQLException e) {
        throw new RuntimeException(e);
    }
    			
    			

connection.close();

return account;
}
	
	}