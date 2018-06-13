package Com.IFI.InternalTool.DS.Model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="overtime")
public class Overtime implements Serializable{
	@Id
	@Column(name = "overtime_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long overtime_id;
	@Column(name = "employee_id")
	private long employee_id;
	@Column(name = "project_id")
	private long project_id;
	@Temporal(TemporalType.DATE)
	@Column(name = "date")
	private Date date;
	@Column(name = "from_hour")
	private String from_hour;
	@Column(name = "to_hour")
	private String to_hour;
	@Column(name = "description")
	private String description;
	@Column(name = "status")
	private int status;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date created_at;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_at")
	private Date updated_at;
	@Column(name = "is_approved")
	private Boolean is_approved;
	public long getOvertime_id() {
		return overtime_id;
	}
	public void setOvertime_id(long overtime_id) {
		this.overtime_id = overtime_id;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getFrom_hour() {
		return from_hour;
	}
	public void setFrom_hour(String from_hour) {
		this.from_hour = from_hour;
	}
	public String getTo_hour() {
		return to_hour;
	}
	public void setTo_hour(String to_hour) {
		this.to_hour = to_hour;
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
	public Boolean getIs_approved() {
		return is_approved;
	}
	public void setIs_approved(Boolean is_approved) {
		this.is_approved = is_approved;
	}
	public Overtime(long employee_id, long project_id, Date date, String from_hour, String to_hour, String description,
			int status, Date created_at, Date updated_at, Boolean is_approved) {
		super();
		this.employee_id = employee_id;
		this.project_id = project_id;
		this.date = date;
		this.from_hour = from_hour;
		this.to_hour = to_hour;
		this.description = description;
		this.status = status;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.is_approved = is_approved;
	}
	public Overtime() {
		super();
	}
	
	

}
