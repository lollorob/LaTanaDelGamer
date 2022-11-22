package it.unisa.model;

public class AccountUserSessione {
    private boolean is_Admin;
    private String username;
    private String password;
    
    public AccountUserSessione () {
    	is_Admin = false;
    	username = null;
    	password = null;
    }
	public boolean isIs_Admin() {
		return is_Admin;
	}
	public void setIs_Admin(boolean is_Admin) {
		this.is_Admin = is_Admin;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
}