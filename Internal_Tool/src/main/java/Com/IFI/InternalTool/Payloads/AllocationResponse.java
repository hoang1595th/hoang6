package Com.IFI.InternalTool.Payloads;

import java.sql.Date;

public class AllocationResponse {
	
	private long allocation_id;
	private long employee_id;
	private String employee_name;
	private long project_id;
	private String project_name;
	private double allocation_plan;
	private Date start_date;
	private Date end_date;
	
	
	public AllocationResponse() {
		
	}
	
	public AllocationResponse(final int allocation_id, final long employee_id, final String employee_name, final long project_id, final String project_name,
			final double allocation_plan, final Date start_date,final Date end_date) {
		this.allocation_id=allocation_id;
		this.employee_id=employee_id;
		this.employee_name=employee_name;
		this.project_id= project_id;
		this.project_name= project_name;
		this.allocation_plan= allocation_plan;
		this.start_date=start_date;
		this.end_date= end_date;
		
	}
	
	
	
	public long getAllocation_id() {
		return allocation_id;
	}
	public void setAllocation_id(long allocation_id) {
		this.allocation_id = allocation_id;
	}
	public long getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(long employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public long getProject_id() {
		return project_id;
	}
	public void setProject_id(long project_id) {
		this.project_id = project_id;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public double getAllocation_plan() {
		return allocation_plan;
	}
	public void setAllocation_plan(double allocation_plan) {
		this.allocation_plan = allocation_plan;
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
	
	
	
	

}
