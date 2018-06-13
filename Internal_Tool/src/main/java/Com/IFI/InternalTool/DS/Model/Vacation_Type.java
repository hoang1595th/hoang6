package Com.IFI.InternalTool.DS.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vacation_type")
public class Vacation_Type implements Serializable{
	@Id
	@Column(name = "vacation_type_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long vacation_type_id;
	@Column(name = "name")
	private String name;
	public long getVacation_type_id() {
		return vacation_type_id;
	}
	public void setVacation_type_id(long vacation_type_id) {
		this.vacation_type_id = vacation_type_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Vacation_Type(String name) {
		super();
		this.name = name;
	}
	public Vacation_Type() {
		super();
	}
	
}
