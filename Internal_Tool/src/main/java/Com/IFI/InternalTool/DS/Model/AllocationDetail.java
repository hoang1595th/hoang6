package Com.IFI.InternalTool.DS.Model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "allocation_detail")
public class AllocationDetail {
	@Id
	@Column(name = "allocation_detail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long allocation_detail_id;

	// @Column(name = "project_id")
	// private long project_id;
	@Column(name = "employee_id")
	private long employee_id;
	@Column(name = "date")
	private Date date;
	@Column(name = "time")
	private int time;

	public AllocationDetail(long employee_id, Date date, int time) {
		super();
		// this.project_id = project_id;
		this.employee_id = employee_id;
		this.date = date;
		this.time = time;
	}

	public AllocationDetail() {
		super();
	}

	public long getAllocation_detail_id() {
		return allocation_detail_id;
	}

	public void setAllocation_detail_id(long allocation_detail_id) {
		this.allocation_detail_id = allocation_detail_id;
	}

	// public long getProject_id() {
	// return project_id;
	// }
	// public void setProject_id(long project_id) {
	// this.project_id = project_id;
	// }
	public long getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(long employee_id) {
		this.employee_id = employee_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

}
