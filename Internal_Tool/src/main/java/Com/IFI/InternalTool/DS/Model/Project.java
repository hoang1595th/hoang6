package Com.IFI.InternalTool.DS.Model;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

@Entity
@Table(name="project")
@JsonIgnoreProperties(value={"month","year"})
public class Project  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long project_id;
	
	@Column(name = "name") 
	private String name;
	
	@Column(name = "code")
	@Size(min = 1, max = 10)
	private String code;
	
	@Column(name = "group_id")
	private String group_id;
	
	@Column(name="status")
	private boolean status;
	
	@Column(name = "description")
	private String description;
	
	@Column(name="start_date")
	private Date start_date;
	
	@Column(name="end_date")
	private Date end_date;
	
	@Column(name="month")
	private int month;
	
	@Column(name="year")
	private int year;
	
	@Column(name="manager_id")
	private long manager_id;
	@Transient
	private String Manager_Name;
	
	public Project(Long project_id, String name, @Size(min = 1, max = 10) String code, String group_id, boolean status,
			String description, Date start_date, Date end_date, int month, int year, long manager_id,
			String manager_Name) {
		super();
		this.project_id = project_id;
		this.name = name;
		this.code = code;
		this.group_id = group_id;
		this.status = status;
		this.description = description;
		this.start_date = start_date;
		this.end_date = end_date;
		this.month = month;
		this.year = year;
		this.manager_id = manager_id;
		Manager_Name = manager_Name;
	}
	
	public Project() {
		
	}

	public Long getProject_id() {
		return project_id;
	}

	public void setProject_id(Long project_id) {
		this.project_id = project_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public long getManager_id() {
		return manager_id;
	}

	public void setManager_id(long manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_Name() {
		return Manager_Name;
	}

	public void setManager_Name(String manager_Name) {
		Manager_Name = manager_Name;
	}
	
	
}
