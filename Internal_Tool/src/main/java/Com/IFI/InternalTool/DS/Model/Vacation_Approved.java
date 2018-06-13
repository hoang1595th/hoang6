package Com.IFI.InternalTool.DS.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="vacation_approved")
public class Vacation_Approved implements Serializable{
	@Id
	@Column(name = "vacation_approved_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long vacation_approved_id;
	@Column(name = "manager_id")
	private long manager_id;
	@Column(name = "vacation_id")
	private long vacation_id;
	@Column(name = "priority")
	private int priority;
	public long getManager_id() {
		return manager_id;
	}
	public void setManager_id(long manager_id) {
		this.manager_id = manager_id;
	}
	public long getVacation_id() {
		return vacation_id;
	}
	public void setVacation_id(long vacation_id) {
		this.vacation_id = vacation_id;
	}

	public long getVacation_approved_id() {
		return vacation_approved_id;
	}
	public void setVacation_approved_id(long vacation_approved_id) {
		this.vacation_approved_id = vacation_approved_id;
	}

	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	
	public Vacation_Approved(long manager_id, long vacation_id, int priority) {
		super();
		this.manager_id = manager_id;
		this.vacation_id = vacation_id;
		this.priority = priority;
	}
	public Vacation_Approved() {
		super();
	}
	
	
}
