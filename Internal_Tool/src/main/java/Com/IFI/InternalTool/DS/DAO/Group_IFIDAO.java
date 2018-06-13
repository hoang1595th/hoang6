package Com.IFI.InternalTool.DS.DAO;

import java.util.List;
import Com.IFI.InternalTool.DS.Model.Group_IFI;


public interface Group_IFIDAO {


	//save group
	public Boolean saveGroup(final Group_IFI group);

	//find Group By ID
	Group_IFI findGroupById(final String group_id);

	//find Group Name Like
	List<Group_IFI> findGroupNameLike(final String name,final int page,final int pageSize);
	
	//get list groups and paginations
	List<Group_IFI> getGroups(final int page,final int pageSize);

	// delete groups by ID
	Boolean deleteGroupById(final String groupId);
	
	
	
}
