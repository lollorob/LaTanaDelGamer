package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

public interface EntityModel<T> {
	    
	    public T doRetrieveByKey(Object chiave) throws SQLException;
	    
	    public Collection<T> doRetrieveAll(String ordine) throws SQLException;
	    
	    public void doSave(T item) throws SQLException;
	    
	    public void doUpdate(T item) throws SQLException;
	    
	    public void doDelete(T item) throws SQLException;
	    
}
