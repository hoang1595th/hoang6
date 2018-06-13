package Com.IFI.InternalTool.DS.DAO;

import java.util.List;

import Com.IFI.InternalTool.DS.Model.ProjectMembers;

public interface ProjectMembersDAO {
	
	Boolean isMembersOfProject(final long employee_id,final long project_id);
	
	Boolean addMemberToProject(final ProjectMembers projectMember);
	
	Boolean removeMemberOfProject(final long projectMemberId);
	
	List<Long> listEmPloyeesIdInProject(final long project_id);
	
	//xoa tat ca member cua mot project
	boolean deleteAllMemberInProject(final long projectId);
	
}
