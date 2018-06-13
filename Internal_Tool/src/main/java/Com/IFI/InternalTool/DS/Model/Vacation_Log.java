package Com.IFI.InternalTool.DS.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vacation_log")
public class Vacation_Log implements Serializable{
	@Id
	@Column(name = "vacation_log_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long vacation_log_id;
	@Column(name = "vacation_id")
	private long vacation_id;
	@Column(name = "next_approve_id")
	private long next_approve_id;
	@Column(name = "approved_id")
	private long approved_id;
	@Column(name = "disapproved_id")
	private long disapproved_id;

	
	public Vacation_Log(long vacation_id, long next_approve_id, long approved_id, long disapproved_id) {
		super();
		this.vacation_id = vacation_id;
		this.next_approve_id = next_approve_id;
		this.approved_id = approved_id;
		this.disapproved_id = disapproved_id;
	}
	public long getVacation_log_id() {
		return vacation_log_id;
	}
	public void setVacation_log_id(long vacation_log_id) {
		this.vacation_log_id = vacation_log_id;
	}
	public long getVacation_id() {
		return vacation_id;
	}
	public void setVacation_id(long vacation_id) {
		this.vacation_id = vacation_id;
	}
	public long getNext_approve_id() {
		return next_approve_id;
	}
	public void setNext_approve_id(long next_approve_id) {
		this.next_approve_id = next_approve_id;
	}
	public long getApproved_id() {
		return approved_id;
	}
	public void setApproved_id(long approved_id) {
		this.approved_id = approved_id;
	}
	public long getDisapproved_id() {
		return disapproved_id;
	}
	public void setDisapproved_id(long disapproved_id) {
		this.disapproved_id = disapproved_id;
	}
	
	public Vacation_Log() {
		super();
	}
	
	
	
}
