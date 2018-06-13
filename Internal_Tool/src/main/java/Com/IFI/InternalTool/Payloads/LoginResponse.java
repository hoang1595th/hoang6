package Com.IFI.InternalTool.Payloads;

import Com.IFI.InternalTool.DS.Model.Employee;

public class LoginResponse {
	private String token;
	private Employee username;

	public LoginResponse() {

	}

	public LoginResponse(final String token, final Employee user) {
		this.token = token;
		this.username = user;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Employee getUsername() {
		return username;
	}

	public void setUsername(Employee username) {
		this.username = username;
	}



}
