package Com.IFI.InternalTool.DS.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "project_members")
public class ProjectMembers {
	@Id
	@Column(name = "project_members_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long project_members_id;

	@Column(name = "employee_id")
	private long employee_id;
	@Column(name = "project_id")
	private long project_id;

	@Column(name = "priority")
	private int priority;
	@Column(name = "leader_id")
	private long leader_id;

	public ProjectMembers(long project_members_id, long employee_id, long project_id, int priority, long leader_id) {
		super();
		this.project_members_id = project_members_id;
		this.employee_id = employee_id;
		this.project_id = project_id;
		this.priority = priority;
		this.leader_id = leader_id;
	}	

	public long getLeader_id() {
		return leader_id;
	}
	
	public void setLeader_id(long leader_id) {
		this.leader_id = leader_id;
	}
	
	public long getProject_members_id() {
		return project_members_id;
	}

	public void setProject_members_id(long project_members_id) {
		this.project_members_id = project_members_id;
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

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public ProjectMembers() {
		super();
	}

}
