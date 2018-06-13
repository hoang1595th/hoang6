package Com.IFI.InternalTool.DS.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "employee", uniqueConstraints = { @UniqueConstraint(columnNames = { "username" }) })

@JsonIgnoreProperties(value = { "password" })
public class Employee implements Serializable {

	@Id
	@Column(name = "employee_id", updatable = false, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long employee_id;

	@NotBlank
	@Size(max = 15)
	@Column(name = "username")
	private String username;

	@NotBlank
	@Column(name = "email")
	@Email
	private String email;

	@NotBlank
	@Column(name = "password")
	private String password;

	@Column(name = "is_active")
	private boolean is_actice;

	@NotBlank
	@Column(name = "code")
	private String code;

	@Column(name = "group_id")
	private String group_id;

	// @ManyToOne(fetch = FetchType.LAZY)
	// @JoinColumn(name = "group_id", nullable = true, foreignKey = @ForeignKey(name
	// = "employee_group_FK"))
	// @OnDelete(action = OnDeleteAction.NO_ACTION)
	// @JsonIgnore
	// private Group_IFI group;

	@NotBlank
	@Column(name = "fullname")

	private String fullname;
	@Column(name = "address")

	private String address;
	@Column(name = "age")
	private int age;

	@Column(name = "phone")
	private String phone;

	public Employee() {

	}

	public Employee(String name, String username, String email, String password, Roles role, String group_id) {
		this.fullname = name;
		this.username = username;
		this.email = email;
		this.password = password;
		this.group_id = group_id;
		this.role = role;

	}

	@Column(name = "type_id")
	private int type_id;

	@Transient
	private String role_name;
	@Transient
	private String type_name;

	@Column(name = "role_id")
	private int role_id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "role_id", nullable = true, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "employee_role_FK"))
	@OnDelete(action = OnDeleteAction.NO_ACTION)
	@JsonIgnore
	private Roles role;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "type_id", nullable = true, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "employee_type_FK"))
	@OnDelete(action = OnDeleteAction.NO_ACTION)
	@JsonIgnore
	private Types types;

	public int getType_id() {
		return type_id;
	}

	public String getType_name() {
		return type_name;
	}
	

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public Roles getRole() {
		return role;
	}

	public Types getTypes() {
		return types;
	}

	public void setTypes(Types types) {
		this.types = types;
	}

	public void setRole(Roles role) {
		this.role = role;
	}

	// setter getter

	public String getUsername() {
		return username;
	}

	public Long getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(Long employee_id) {
		this.employee_id = employee_id;
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

	public boolean isIs_actice() {
		return is_actice;
	}

	public void setIs_actice(boolean is_actice) {
		this.is_actice = is_actice;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
