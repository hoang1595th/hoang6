package Com.IFI.InternalTool.DS.DAO;

import java.util.List;

import Com.IFI.InternalTool.DS.Model.Project;
import Com.IFI.InternalTool.DS.Model.ProjectManager;

public interface ProjectDAO {

	// lay tat ca project
	List<Project> getAllProjects(int page, int pageSize);
	
	public List<Project> getAllProject() ;
	// tao hoac chinh sua
	boolean saveProject(Project project);

	// xoa project
	boolean deleteProject(long project_id);

	// tim kiem theo id
	Project getProjectById(long project_id);

	// cua bac
	List<ProjectManager> getProjectManagerByEmp(long employee_id, long project_id);

	// cua bac
	List<Long> getProjectByEmp(long employee_id);

	// tim kiem theo 1 group
	List<Project> getProjectsOfGroup(String group_id, int page, int pageSize);
	Long NumerRecordsProjectsOfGroup(String group_id);

	// tim kiem theo ten
	List<Project> findProjectNameLike(String projectName, int page, int pageSize);
	Long NumerRecordsProjectNameLike(String projectName);
	
	// tim kiem id manager cao nhat
	Long getBigestManagerId(long project_id);

	// tim kiem danh sach id nhan vien trong project
	List<Long> getListEmployeeId(long project_id, int page, int pageSize);
	Long NumerRecordsListEmployeeId(long project_id);

	// update project
	boolean updateProject(Project project);

	// tim kiem cac project da off
	List<Project> getListProjectOutOfDate(int page, int pageSize);
	Long NumerRecordsListProjectOutOfDate();

	// tim kiem theo nam thang
	List<Project> getProjectByMonthYear(int month, int year, int page, int pageSize);
	Long NumerRecordsProjectByMonthYear(int month, int year);
	
	// tim kiem project ma nhan vien do duoc phan cong
	List<Project> getProjectAllocatedIn(long employee_id, int page, int pageSize);
	Long NumerRecordsProjectAllocatedIn(long employee_id);

	// lay cac project ma nhan vien do quan ly
	List<Project> getProjectAllocateTo(long employee_id, int page, int pageSize);
	Long NumerRecordsProjectAllocateTo(long employee_id);
	
}