package Com.IFI.InternalTool.DS.Model.SearchModel;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class VacationSearch implements Serializable{
	private String emp_name;
	private String pro_name;
	@JsonFormat(pattern="MM/dd/yyyy hh:mm a")
	private Date from_date;
	@JsonFormat(pattern="MM/dd/yyyy hh:mm a")
	private Date to_date;
	private int status;
	
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public VacationSearch() {
		super();
	}
	public VacationSearch(String emp_name, String pro_name, Date from_date, Date to_date, int status) {
		super();
		this.emp_name = emp_name;
		this.pro_name = pro_name;
		this.from_date = from_date;
		this.to_date = to_date;
		this.status = status;
	}
	
	
}
