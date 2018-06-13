package Com.IFI.InternalTool.BS.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import Com.IFI.InternalTool.BS.Service.Impl.EmployeeServiceImpl;
import Com.IFI.InternalTool.DS.DAO.EmployeeDAO;
import Com.IFI.InternalTool.DS.DAO.RoleDAO;

import Com.IFI.InternalTool.Payloads.LoginRequest;
import Com.IFI.InternalTool.Payloads.LoginResponse;
import Com.IFI.InternalTool.Security.JwtTokenProvider;
import Com.IFI.InternalTool.Security.UserPrincipal;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	EmployeeServiceImpl employeeService;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	JwtTokenProvider tokenProvider;
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	@PostMapping("/signin")
	public LoginResponse authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
		logger.info("Login ... ");
		LoginResponse message = new LoginResponse();
		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);
		UserPrincipal user = (UserPrincipal) authentication.getPrincipal();
		String jwt = tokenProvider.generateToken(authentication);
		message.setToken(jwt);
		message.setUsername(employeeService.getEmployeeById(user.getId()));
		return message;
	}

}