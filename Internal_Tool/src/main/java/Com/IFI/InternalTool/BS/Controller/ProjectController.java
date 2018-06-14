package Com.IFI.InternalTool.BS.Controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Com.IFI.InternalTool.DS.DAO.ProjectMembersDAO;
import Com.IFI.InternalTool.DS.Model.Project;
import Com.IFI.InternalTool.DS.Model.ProjectMembers;
import Com.IFI.InternalTool.Payloads.Payload;
import Com.IFI.InternalTool.Security.CurrentUser;
import Com.IFI.InternalTool.Security.UserPrincipal;
import Com.IFI.InternalTool.Utils.AppConstants;
import Com.IFI.InternalTool.Utils.Business;
import Com.IFI.InternalTool.BS.Service.Impl.ProjectServiceImpl;

@RestController
@RequestMapping("/api/projects")
public class ProjectController {
	@Autowired
	private ProjectServiceImpl projectService;

	@Autowired
	AuthenticationManager authenticationManager;
	Payload message = new Payload();
	Object data = "";
	boolean success = false;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	// lay tat ca project
	@GetMapping
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody Payload getAllProjects(
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		try {
			data = projectService.getAllProjects(page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Get Projects Successfull", true);
		return message;
	}

	// tao project
	@PostMapping(value = { "/create" })
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody Payload createProject(@CurrentUser UserPrincipal currentUser, @Valid @RequestBody Project projectRequest,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Create Project ... ");

		try {
			//sua kieu boolean cho update
			success = projectService.saveProject(currentUser.getId(), projectRequest);
			data = projectService.getAllProjects(page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		// kiem tra viec thanh cong
		if (!success) {
			message.setPayLoad(data, AppConstants.STATUS_KO, AppConstants.SUCCESS_CODE,	"Create Project Doesn't Successfull", false);
		} else {
			message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Create Project Successfull",
					true);
		}
		return message;
	}

	// tim kiem theo id
	@PostMapping("/findProjectById")
	public @ResponseBody Payload findProjectById(@RequestParam("project_id") long project_id) {
		logger.info("Get Project By Id ... ");
		try {
			data = projectService.getProjectById(project_id);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Find Project By ID Successfull",
				true);
		return message;

	}

	// tim kiem theo ten
	@PostMapping("/findProjectNameLike")
	public @ResponseBody Payload findProjectNameLike(@RequestParam("projectName") String projectName,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Find Project Like Name ... ");

		try {
			data = projectService.findProjectNameLike(projectName, page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE,	"Find Project Like Name Successfull", true);
		if (!"".equals(data) || data != null) {
			message.setPages(projectService.NumerRecordsProjectNameLike(projectName, pageSize));
		}
		return message;

	}

	// xoa project
	@DeleteMapping("/deleteProject")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody Payload deleteProject(@RequestParam("project_id") long projectId,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Delete Project ... ");

		try {
			success = projectService.deleteProject(projectId);
			data = projectService.getAllProjects(page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		//kiem tra viec thanh cong
		if (!success) {
			message.setPayLoad(data, AppConstants.STATUS_KO, AppConstants.SUCCESS_CODE, "Delete Project Doesn't Successfull", false);
		}else {
			message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Delete Project Successfull", true);
		}
		
		return message;
	}

	// lay danh sach project cua mot group
	@GetMapping("/getProjectsOfGroup")
	public @ResponseBody Payload getProjectsOfGroup(@RequestParam("group_id") String groupId,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Get List Project Of Group... ");

		try {
			data = projectService.getProjectsOfGroup(groupId, page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Get List Project Of Group Successfull", true);
		if (!"".equals(data) || data != null) {
			message.setPages(projectService.NumerRecordsProjectsOfGroup(groupId, pageSize));
		}
		return message;
	}

	// lay quan ly cao nhat
	@GetMapping("/getBigestManager")
	public @ResponseBody Payload getBigestManager(@RequestParam("project_id") long project_id) {
		logger.info("Get Bigest Manager... ");

		try {
			data = projectService.getBigestManager(project_id);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Get Bigest Manager Successfull",
				true);
		return message;
	}

	// lya danh sach nhan vien trong project
	@GetMapping("/getListEmployee")
	public @ResponseBody Payload getListEmployee(@RequestParam("project_id") long project_id,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Get List Employee... ");

		try {
			data = projectService.getListEmployee(project_id, page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Get List Employee Successfull", true);
		if (!"".equals(data) || data != null) {
			message.setPages(projectService.NumerRecordsListEmployee(project_id, pageSize));
		}
		return message;
	}

	// update project
	@PutMapping("/updateProject")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody Payload updateProject(@Valid @RequestBody Project project,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Update Project... ");

		try {
			success = projectService.updateProject(project);
			data = projectService.getAllProjects(page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad(data, AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		
		//kiem tra thanh cong
		if (!success) {
			message.setPayLoad(data, AppConstants.STATUS_KO, AppConstants.SUCCESS_CODE, "Update Project Doesn't Successfull", false);
		}else {
			message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Update Project Successfull", true);
		}
		return message;
	}

	// lay danh sach project off
	@GetMapping("/getListProjectOutOfDate")
	// @PreAuthorize("hasRole('ROLE_USER')")
	public @ResponseBody Payload getListProjectOutOfDate(
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Get List Project Out Of Date... ");

		try {
			data = projectService.getListProjectOutOfDate(page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE,	"Get List Project Out Of Date Successfull", true);
		if (!"".equals(data) || data != null) {
			message.setPages(projectService.NumerRecordsListProjectOutOfDate(pageSize));
		}
		return message;
	}

	// lay danh sach project theo nam thang
	@GetMapping("/getProjectByMonthYear")
	// @PreAuthorize("hasRole('ROLE_USER')")
	public @ResponseBody Payload getProjectByMonthYear(@RequestParam("year") int year, @RequestParam("month") int month,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Get Project By Month Year... ");

		try {
			data = projectService.getProjectByMonthYear(month, year, page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE,	"Get Project By Month Year Successfull", true);
		if (!"".equals(data) || data != null) {
			message.setPages(projectService.NumerRecordsProjectByMonthYear(month, year,  pageSize));
		}
		return message;
	}

	// tim kiem project cua nhan vien tham gia vao
	@GetMapping("/getProjectAllocatedIn")
	public @ResponseBody Payload getProjectAllocatedIn(@CurrentUser UserPrincipal currentUser,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {

		boolean hasUserRole = currentUser.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));
		logger.info(hasUserRole + " role");

	//	hasUserRole = true;
		try {
			if (hasUserRole) {
				data = projectService.getProjectAllocatedIn(currentUser.getId(), page, pageSize);
			}

		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("FAILED", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Get Allocations Successfull", true);
		if (!"".equals(data) || data != null) {
			message.setPages(projectService.NumerRecordsProjectAllocatedIn(currentUser.getId(), pageSize));
		}
		return message;
	}

	// lay cac project ma nhan vien do duoc phan cong
	@GetMapping("/getProjectAllocateTo")
	public @ResponseBody Payload getProjectAllocateTo(@CurrentUser UserPrincipal currentUser,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {

		boolean hasUserRole = currentUser.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));
		logger.info(hasUserRole + " role");

		try {
			if (hasUserRole) {
				data = projectService.getProjectAllocateTo(currentUser.getId(), page, pageSize);
				
			}

		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("FAILED", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Get Allocations Successfull", true);
		if (!"".equals(data) || data != null) {
			message.setPages(projectService.NumerRecordsProjectAllocateTo(currentUser.getId(), pageSize));
		}
		return message;
	}

	@PostMapping("/AddMemberToProject")
	// @PreAuthorize("hasRole('ROLE_USER')")
	public @ResponseBody Payload AddMemberToProject(@CurrentUser UserPrincipal currentUser,
			@Valid @RequestBody ProjectMembers projectMember) {

		boolean hasUserRole = currentUser.getAuthorities().stream()
				.anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));
		logger.info("Add Member To Project... ");

		try {
			if (hasUserRole) {
				data = projectService.addMemberToProject(currentUser.getId(), projectMember);
			}
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("FAILED", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		
		if (data.equals(Boolean.FALSE)) {
			message.setPayLoad(data, AppConstants.STATUS_KO, AppConstants.SUCCESS_CODE, "Add Member To Project Doesn't Successfull", false);
		}else {
			message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Add Member To Project Successfull", true);
		}
		return message;
	}
	
	@DeleteMapping("/RemoveMemberOfProject")
	// @PreAuthorize("hasRole('ROLE_USER')")
	public @ResponseBody Payload RemoveMemberOfProject(@CurrentUser UserPrincipal currentUser,
			@RequestParam long projectMemberId) {

		boolean hasUserRole = currentUser.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));
		logger.info("Remove Member in Project... ");

		try {
			if (hasUserRole) {
				data = projectService.removeMemberOfProject(currentUser.getId(), projectMemberId);
			}
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("FAILED", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		
		if (data.equals(Boolean.FALSE)) {
			message.setPayLoad(data, AppConstants.STATUS_KO, AppConstants.SUCCESS_CODE, "The Employee not exist or You don't have permitsion to delete", false);
		}else {
			message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Remove Member in Project Successfull", true);
		}
		return message;
	}
}
