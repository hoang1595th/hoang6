package Com.IFI.InternalTool.DS.Model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="project_manager")
public class ProjectManager  {
	@Id
	@Column(name = "project_manager_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long project_manager_id;
	@Column(name = "manager_id")
	private long manager_id;
	@Column(name = "employee_id")
	private long employee_id;
	@Column(name = "project_id")
	private long project_id;
	@Column(name="manager_role")
	private String manager_role;
	@Column(name="priority")
	private int priority;
	
	public ProjectManager(long manager_id, long employee_id, long project_id, String manager_role, int priority) {
		super();
		this.manager_id = manager_id;
		this.employee_id = employee_id;
		this.project_id = project_id;
		this.manager_role = manager_role;
		this.priority = priority;
	}
	public long getManager_id() {
		return manager_id;
	}
	public void setManager_id(long manager_id) {
		this.manager_id = manager_id;
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
	public String getManager_role() {
		return manager_role;
	}
	public void setManager_role(String manager_role) {
		this.manager_role = manager_role;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public ProjectManager() {
		super();
	}
	
}
