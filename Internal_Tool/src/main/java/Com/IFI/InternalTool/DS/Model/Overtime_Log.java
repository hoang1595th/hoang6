package Com.IFI.InternalTool.DS.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="overtime_log")
public class Overtime_Log implements Serializable{
	@Id
	@Column(name = "overtime_log_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long overtime_log_id;
	@Column(name = "overtime_id")
	private long overtime_id;
	@Column(name = "next_approve_id")
	private long next_approve_id;
	@Column(name = "approved_id")
	private long approved_id;
	@Column(name = "disapproved_id")
	private long disapproved_id;
	public long getOvertime_log_id() {
		return overtime_log_id;
	}
	public void setOvertime_log_id(long overtime_log_id) {
		this.overtime_log_id = overtime_log_id;
	}
	public long getOvertime_id() {
		return overtime_id;
	}
	public void setOvertime_id(long overtime_id) {
		this.overtime_id = overtime_id;
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
	public Overtime_Log(long overtime_id, long next_approve_id, long approved_id, long disapproved_id) {
		super();
		this.overtime_id = overtime_id;
		this.next_approve_id = next_approve_id;
		this.approved_id = approved_id;
		this.disapproved_id = disapproved_id;
	}
	public Overtime_Log() {
		super();
	}

	
	
	
}
