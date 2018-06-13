package Com.IFI.InternalTool.DS.Model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
@Entity
@Table(name="vacation")
public class Vacation implements Serializable{
	@Id
	@Column(name = "vacation_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long vacation_id;
	@Column(name = "employee_id")
	private long employee_id;
	@Column(name = "project_id")
	private long project_id;
	@JsonFormat(pattern="MM/dd/yyyy hh:mm a")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "from_date")
	private Date from_date;
	@JsonFormat(pattern="MM/dd/yyyy hh:mm a")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "to_date")
	private Date to_date;
	@Column(name = "vacation_type")
	private long vacation_type;
	@Column(name = "description")
	private String description;
	@Column(name = "status")
	private int status;
	@JsonFormat(pattern="MM/dd/yyyy hh:mm a")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date created_at;
	@JsonFormat(pattern="MM/dd/yyyy hh:mm a")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_at")
	private Date updated_at;
	@Column(name = "is_approved")
	private Boolean is_approved;
	@Transient
	private List<String> approved_manager;
	@Transient
	private String next_approve_manager;
	@Transient
	private String disapproved_manager;
	@Transient
	private String project_name;
	@Transient
	private String employee_name;
	
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getVacation_type_name() {
		return vacation_type_name;
	}
	public void setVacation_type_name(String vacation_type_name) {
		this.vacation_type_name = vacation_type_name;
	}
	@Transient
	private String vacation_type_name;
	
	
	public Boolean getIs_approved() {
		return is_approved;
	}
	public void setIs_approved(Boolean is_approved) {
		this.is_approved = is_approved;
	}
	public long getVacation_id() {
		return vacation_id;
	}
	public void setVacation_id(long vacation_id) {
		this.vacation_id = vacation_id;
	}
	public long getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(long employee_id) {
		this.employee_id = employee_id;
	}
	public long getProject_id() {
		return project_id;
	}
	public void setProject_id(long project_id) {
		this.project_id = project_id;
	}
	public Date getFrom_date() {
		return from_date;
	}
	public void setFrom_date(Date from_date) {
		this.from_date = from_date;
	}
	public Date getTo_date() {
		return to_date;
	}
	public void setTo_date(Date to_date) {
		this.to_date = to_date;
	}
	public long getVacation_type() {
		return vacation_type;
	}
	public void setVacation_type(long vacation_type) {
		this.vacation_type = vacation_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	

	public List<String> getApproved_manager() {
		return approved_manager;
	}
	public void setApproved_manager(List<String> approved_manager) {
		this.approved_manager = approved_manager;
	}
	
	public String getDisapproved_manager() {
		return disapproved_manager;
	}
	public void setDisapproved_manager(String disapproved_manager) {
		this.disapproved_manager = disapproved_manager;
	}
	public Vacation(long employee_id, long project_id, Date from_date, Date to_date, long vacation_type,
			String description, int status, Date created_at, Date updated_at, Boolean is_approved) {
		super();
		this.employee_id = employee_id;
		this.project_id = project_id;
		this.from_date = from_date;
		this.to_date = to_date;
		this.vacation_type = vacation_type;
		this.description = description;
		this.status = status;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.is_approved = is_approved;
	}
	

	
	public Vacation(long employee_id, long project_id, Date from_date, Date to_date, long vacation_type,
			String description, int status, Date created_at, Date updated_at, Boolean is_approved,
			List<String> approved_manager, String next_approve_manager, String disapproved_manager, String project_name,
			String employee_name, String vacation_type_name) {
		super();
		this.employee_id = employee_id;
		this.project_id = project_id;
		this.from_date = from_date;
		this.to_date = to_date;
		this.vacation_type = vacation_type;
		this.description = description;
		this.status = status;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.is_approved = is_approved;
		this.approved_manager = approved_manager;
		this.next_approve_manager = next_approve_manager;
		this.disapproved_manager = disapproved_manager;
		this.project_name = project_name;
		this.employee_name = employee_name;
		this.vacation_type_name = vacation_type_name;
	}
	public String getNext_approve_manager() {
		return next_approve_manager;
	}
	public void setNext_approve_manager(String next_approve_manager) {
		this.next_approve_manager = next_approve_manager;
	}
	public Vacation() {
		super();
	}
	
	
	

	
}
