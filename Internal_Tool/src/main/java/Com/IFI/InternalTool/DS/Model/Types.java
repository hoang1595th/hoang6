package Com.IFI.InternalTool.DS.Model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.FetchMode;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.NaturalId;

@Entity
@Table(name = "types", //
        uniqueConstraints = { //
                @UniqueConstraint(name = "employee_type_UK", columnNames = "type_name") })
public class Types {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int type_id;

    @Enumerated(EnumType.STRING)
    @NaturalId
    @Column(name="type_name",length = 60)
    private TypeName type_name;

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public TypeName getType_name() {
		return type_name;
	}

	public void setType_name(TypeName type_name) {
		this.type_name = type_name;
	}
    
    
    
    
} 