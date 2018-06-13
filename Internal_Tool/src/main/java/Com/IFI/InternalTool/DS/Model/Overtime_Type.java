package Com.IFI.InternalTool.DS.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="overtime_type")
public class Overtime_Type implements Serializable{
	@Id
	@Column(name = "overtime_type_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long overtime_type_id;
	@Column(name = "name")
	private String name;
	
	
}
