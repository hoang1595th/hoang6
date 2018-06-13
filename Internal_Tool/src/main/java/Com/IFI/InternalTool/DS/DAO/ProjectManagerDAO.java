package Com.IFI.InternalTool.DS.DAO;

import java.util.List;

public interface ProjectManagerDAO {
	List<Long> getProjectIDs(final long employee_id);
	
}
