package Com.IFI.InternalTool.BS.Controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Com.IFI.InternalTool.BS.Service.EmployeeService;
import Com.IFI.InternalTool.BS.Service.ProjectService;
import Com.IFI.InternalTool.BS.Service.VacationService;
import Com.IFI.InternalTool.DS.Model.Project;
import Com.IFI.InternalTool.DS.Model.ProjectManager;
import Com.IFI.InternalTool.DS.Model.Vacation;
import Com.IFI.InternalTool.DS.Model.Vacation_Approved;
import Com.IFI.InternalTool.DS.Model.Vacation_Log;
import Com.IFI.InternalTool.DS.Model.Vacation_Type;
import Com.IFI.InternalTool.DS.Model.SearchModel.VacationSearch;
import Com.IFI.InternalTool.Payloads.CountVacationResponse;
import Com.IFI.InternalTool.Payloads.CountVacationResponseMng;
import Com.IFI.InternalTool.Payloads.Payload;
import Com.IFI.InternalTool.Payloads.VacationCategory;

@RestController
@RequestMapping("/api")
public class VacationRestController {
	@Autowired
	EmployeeService employeeService;
	@Autowired
	ProjectService projectService;
	@Autowired
	VacationService vacationService;


	/*-----------Begin Vacation MainRestController--------*/
	// get vacation by id
	@GetMapping("/vacations/{vacation_id}")
	public Vacation getVacationById(@PathVariable("vacation_id") long vacation_id) {
		Vacation v = vacationService.getVacationById(vacation_id);
		return v;
	}

	// get all vacation (employee page)
	@GetMapping("/vacations/employee")
	public @ResponseBody Payload getVacationByEmp(@RequestParam("page") int page,
			@RequestParam("pageSize") int pageSize, @RequestParam(required = false) String sortedColumn,
			@RequestParam(required = false) Boolean desc, @RequestParam(required = false) Boolean is_approved,
			@RequestParam List<Integer> status) throws ParseException {
		Payload message = new Payload();
	
		Long employee_id = employeeService.getEmployeeIdAuthenticated();
		List<Vacation> list=null;
		list = vacationService.getAllVacationByEmp(employee_id, page, pageSize, sortedColumn, desc,
				is_approved, status);
		int size = list.size();
		if (size !=0) {
			for(Vacation v:list) {
				List<String> approved_manager=new ArrayList<String>();
				String disapproved_manager=null;
				String project_name=null;
				String vacation_type_name=null;
				String next_approve_manager=null;
				List<Long> e=vacationService.getApprovedIdByVacationId(v.getVacation_id());
				for(Long i:e) {
					if(employeeService.getEmployeeById(i)!=null)
					approved_manager.add(employeeService.getEmployeeById(i).getFullname());
				}
				//get disapprove manager name
				if(vacationService.getDisApproveIdByVacationId(v.getVacation_id())!=null) {
					disapproved_manager=employeeService.getEmployeeById(vacationService.getDisApproveIdByVacationId(v.getVacation_id())).getFullname();
				}
				//get project name
					project_name=projectService.getProjectById(v.getProject_id()).getName();
				//get vacation type name
					vacation_type_name=vacationService.getVacationTypeById(v.getVacation_type()).getName();
				//get next approve manager name
					if(vacationService.getManagerIdByEmpProAndStatus(employee_id, v.getProject_id(), v.getStatus())!=null) {
						next_approve_manager=employeeService.getEmployeeById(vacationService.getManagerIdByEmpProAndStatus(employee_id, v.getProject_id(), v.getStatus())).getFullname();
					}
				v.setProject_name(project_name);
				v.setVacation_type_name(vacation_type_name);
				v.setApproved_manager(approved_manager);
				v.setDisapproved_manager(disapproved_manager);
				v.setNext_approve_manager(next_approve_manager);
			}
			message.setMessage("Get vacations by employee successfully");
			message.setCode("CODE OK!");
			message.setStatus("OK!");
			message.setData(list);
			Long count = vacationService.countAllVacationByEmp(status, is_approved, employee_id);
			int pages = (int) (count / pageSize);
			if (count % pageSize > 0) {
				pages++;
			}
			message.setPages(pages);
			
		} else {
			message.setMessage("Vacation by employee not found!");
			message.setCode("CODE OK!");
			message.setStatus("OK!");
		}

		return message;
	}
	// get vacation number by status (employee page)
	@GetMapping("/vacations/employee/count")
	public CountVacationResponse countVacationByStatus(){
		List<Long> count =vacationService.countVacationByStatusEmp(employeeService.getEmployeeIdAuthenticated());
		CountVacationResponse cvr=new CountVacationResponse();
		cvr.setLastest(count.get(0));
		cvr.setApproving(count.get(1));
		cvr.setApproved(count.get(2));
		cvr.setDisapproved(count.get(3));
		return cvr;

	}
	// get all vacation type
	@GetMapping("/vacationTypes")
	public List<Vacation_Type> getAllVacationType() {
		return vacationService.getAllVacationType();
	}

	// save vacation
	@PostMapping("/vacations")
	public @ResponseBody Payload saveVacation(@RequestBody Vacation vacation) {
		Payload message = new Payload();
		Long employee_id = employeeService.getEmployeeIdAuthenticated();
		List<Long> check=projectService.getProjectByEmp(employee_id);
		if(check.size() > 0) {
		List<ProjectManager> pm = projectService.getProjectManagerByEmp(employee_id, vacation.getProject_id());
			if(pm.size()>0) {	
				for (ProjectManager u : pm) {
					Project p = projectService.getProjectById(u.getProject_id());// get project to check date
					if (p.getEnd_date() != null) {
						Date end_date = p.getEnd_date();
						Date start_date = p.getStart_date();
						Date from_date = vacation.getFrom_date();
						Date to_date = vacation.getTo_date();
						if (from_date.compareTo(start_date) > 0 && from_date.compareTo(end_date) < 0
								&& to_date.compareTo(start_date) > 0 && to_date.compareTo(end_date) < 0
								&& from_date.compareTo(to_date) < 0) {
							Date date = new java.util.Date();
							vacation.setEmployee_id(employee_id);
							vacation.setCreated_at(date);
							vacation.setUpdated_at(date);
							vacation.setStatus(1);
							vacation.setIs_approved(null);
							vacationService.saveVacation(vacation);
							//get more info
							String next_approve_manager=null;
							if(vacationService.getManagerIdByEmpProAndStatus(employee_id, vacation.getProject_id(), vacation.getStatus())!=null) {
								next_approve_manager=employeeService.getEmployeeById(vacationService.getManagerIdByEmpProAndStatus(employee_id, vacation.getProject_id(), vacation.getStatus())).getFullname();
							}
							vacation.setNext_approve_manager(next_approve_manager);//get next_approve manager
							vacation.setProject_name(projectService.getProjectById(vacation.getProject_id()).getName());//get project name
							vacation.setVacation_type_name(vacationService.getVacationTypeById(vacation.getVacation_type()).getName());//vacation type name
					
							Vacation_Approved va = new Vacation_Approved();
							va.setVacation_id(vacation.getVacation_id());
							va.setManager_id(u.getManager_id());
							va.setPriority(u.getPriority());
							vacationService.saveVacationApproved(va);
							List<Long> listManagerId = vacationService.getManagerByVacationId(vacation.getVacation_id());
							Vacation_Log v = new Vacation_Log();
							for (Long a : listManagerId) {
								v.setVacation_id(vacation.getVacation_id());
								v.setNext_approve_id(a);
								vacationService.saveVacationLog(v);
							}
							message.setMessage("Save vacation successfully");
							message.setCode("CODE OK!");
							message.setStatus("OK!");
							message.setData(vacation);
						} else {
							message.setMessage("Wrong Date");
							message.setCode("Error!");
							message.setStatus("Error");
						}
					}
		
					if (p.getEnd_date() == null) {
						Date start_date = p.getStart_date();
						Date from_date = vacation.getFrom_date();
						Date to_date = vacation.getTo_date();
						if (from_date.compareTo(start_date) > 0 && to_date.compareTo(start_date) > 0
								&& from_date.compareTo(to_date) < 0) {
							Date date = new java.util.Date();
							vacation.setEmployee_id(employee_id);
							vacation.setCreated_at(date);
							vacation.setUpdated_at(date);
							vacation.setStatus(1);
							vacationService.saveVacation(vacation);
							
							//get more info
							String next_approve_manager=null;
							if(vacationService.getManagerIdByEmpProAndStatus(employee_id, vacation.getProject_id(), vacation.getStatus())!=null) {
								next_approve_manager=employeeService.getEmployeeById(vacationService.getManagerIdByEmpProAndStatus(employee_id, vacation.getProject_id(), vacation.getStatus())).getFullname();
							}
							vacation.setNext_approve_manager(next_approve_manager);//get next_approve manager
							vacation.setProject_name(projectService.getProjectById(vacation.getProject_id()).getName());//get project name
							vacation.setVacation_type_name(vacationService.getVacationTypeById(vacation.getVacation_type()).getName());//vacation type name
							
							Vacation_Approved va = new Vacation_Approved();
							va.setVacation_id(vacation.getVacation_id());
							va.setManager_id(u.getManager_id());
							va.setPriority(u.getPriority());
							vacationService.saveVacationApproved(va);
							List<Long> listManagerId = vacationService.getManagerByVacationId(vacation.getVacation_id());
							Vacation_Log v = new Vacation_Log();
							for (Long a : listManagerId) {
								v.setVacation_id(vacation.getVacation_id());
								v.setNext_approve_id(a);
								vacationService.saveVacationLog(v);
							}
							message.setMessage("Save vacation successfully");
							message.setCode("CODE OK!");
							message.setStatus("OK!");
							message.setData(vacation);
						} else {
							message.setMessage("Wrong Date");
							message.setCode("Error!");
							message.setStatus("Error");
						}
					}
		
				}
			}
			else {
				message.setMessage("You dont belong to this project");
				message.setCode("Error");
				message.setStatus("Error");
			}
		}
		else {
			message.setMessage("You are the highest level management or You dont belong to any project");
			message.setCode("Error");
			message.setStatus("Error");
		}

		return message;
	}

	// edit vacation
	@PutMapping("/vacations")
	public @ResponseBody Payload editVacation(@RequestBody Vacation vacation) {
		Payload message = new Payload();
		Vacation v = vacationService.getVacationById(vacation.getVacation_id());
		if (v.getStatus() == 1) {
			List<ProjectManager> pm = projectService.getProjectManagerByEmp(employeeService.getEmployeeIdAuthenticated(), vacation.getProject_id());
			if(pm.size()>0) {
					for (ProjectManager u : pm) {
						Project p = projectService.getProjectById(u.getProject_id());// get project to check date
						if (p.getEnd_date() != null) {
							Date end_date = p.getEnd_date();
							Date start_date = p.getStart_date();
							Date from_date = vacation.getFrom_date();
							Date to_date = vacation.getTo_date();
							if (from_date.compareTo(start_date) > 0 && from_date.compareTo(end_date) < 0
									&& to_date.compareTo(start_date) > 0 && to_date.compareTo(end_date) < 0
									&& from_date.compareTo(to_date) < 0) {
											Date date = new java.util.Date();
											vacation.setCreated_at(v.getCreated_at());
											vacation.setStatus(v.getStatus());
											vacation.setUpdated_at(date);
											vacation.setEmployee_id(employeeService.getEmployeeIdAuthenticated());
											vacationService.saveVacation(vacation);
											//get more info
											String next_approve_manager=null;
											if(vacationService.getManagerIdByEmpProAndStatus(v.getEmployee_id(), v.getProject_id(), v.getStatus())!=null) {
												next_approve_manager=employeeService.getEmployeeById(vacationService.getManagerIdByEmpProAndStatus(v.getEmployee_id(), v.getProject_id(), v.getStatus())).getFullname();
											}
											vacation.setNext_approve_manager(next_approve_manager);//get next_approve manager
											vacation.setProject_name(projectService.getProjectById(vacation.getProject_id()).getName());//get project name
											vacation.setVacation_type_name(vacationService.getVacationTypeById(vacation.getVacation_type()).getName());//vacation type name
											message.setMessage("Edit project successfully");
											message.setCode("CODE OK!");
											message.setStatus("OK!");
											message.setData(vacation);
										}
									else {
										message.setStatus("Error!");
										message.setMessage("Wrong date, can not edit");
									}
							}
						if (p.getEnd_date() == null) {
							Date start_date = p.getStart_date();
							Date from_date = vacation.getFrom_date();
							Date to_date = vacation.getTo_date();
							if (from_date.compareTo(start_date) > 0 && to_date.compareTo(start_date) > 0
									&& from_date.compareTo(to_date) < 0) {
									Date date = new java.util.Date();
									vacation.setCreated_at(v.getCreated_at());
									vacation.setStatus(v.getStatus());
									vacation.setUpdated_at(date);
									vacation.setEmployee_id(employeeService.getEmployeeIdAuthenticated());
									vacationService.saveVacation(vacation);
									//get more info
									String next_approve_manager=null;
									if(vacationService.getManagerIdByEmpProAndStatus(v.getEmployee_id(), v.getProject_id(), v.getStatus())!=null) {
										next_approve_manager=employeeService.getEmployeeById(vacationService.getManagerIdByEmpProAndStatus(v.getEmployee_id(), v.getProject_id(), v.getStatus())).getFullname();
									}
									vacation.setNext_approve_manager(next_approve_manager);//get next_approve manager
									vacation.setProject_name(projectService.getProjectById(vacation.getProject_id()).getName());//get project name
									vacation.setVacation_type_name(vacationService.getVacationTypeById(vacation.getVacation_type()).getName());//vacation type name
									message.setMessage("Edit project successfully");
									message.setCode("CODE OK!");
									message.setStatus("OK!");
									message.setData(vacation);
								}
								else {
									message.setStatus("Error!");
									message.setMessage("Wrong date,can not edit");
								}
							}
						
					}
			}
					else {
						message.setMessage("You dont belong to this project");
						message.setCode("Error!");
						message.setStatus("Error");
					}
					
		}

			 else {
				message.setStatus("Error!");
				message.setCode("Error!");
				message.setMessage("Vacation is processing, You can not update");
			 }
		return message;
	}

	// delete vacation by id
	@DeleteMapping("/vacations/{vacation_id}")
	public @ResponseBody Payload deleteVacation(@PathVariable long vacation_id) {
		Payload message = new Payload();
		Vacation v = vacationService.getVacationById(vacation_id);
		if (v != null) {
			if (v.getStatus() == 1) {
				if (vacationService.deleteVacation(vacation_id)) {
					message.setMessage("Delete vacation successfully");
					message.setCode("CODE OK!");
					message.setStatus("OK!");
					message.setData("");
				}
			} else {
				message.setCode("CODE OK!");
				message.setStatus("OK!");
				message.setMessage("Vacation is processing, You can not delete");
			}
		} else {
			message.setMessage("Can not delete, vacation not found");
			message.setCode("CODE OK!");
			message.setStatus("OK!");
		}
		return message;
	}

	// get vacation ( manager/leader page)
	@PreAuthorize("hasRole('LEADER_A') OR hasRole('LEADER_B') OR hasRole('LEADER_C')")
	@GetMapping("/vacations/manager")
	public @ResponseBody Payload getEmployeeVacationByManager(@RequestParam("page") int page,
			@RequestParam("pageSize") int pageSize, @RequestParam("sortedColumn") String sortedColumn,
			@RequestParam("desc") Boolean desc) {
		Payload message=new Payload();
		Long manager_id = employeeService.getEmployeeIdAuthenticated();
		List<Vacation> listVacation = vacationService.getAllVacationByEmp2(manager_id, page, pageSize, sortedColumn,
				desc);
		if( listVacation.size() > 0) {
				for(Vacation v:listVacation) {
					List<String> approved_manager=new ArrayList<String>();
					String disapproved_manager=null;
					String project_name=null;
					String employee_name=null;
					String vacation_type_name=null;
					String next_approve_manager=null;
					List<Long> e=vacationService.getApprovedIdByVacationId(v.getVacation_id());
					for(Long i:e) {
						if(employeeService.getEmployeeById(i)!=null)
						approved_manager.add(employeeService.getEmployeeById(i).getFullname());
					}
					//get employee name
						employee_name=employeeService.getEmployeeById(v.getEmployee_id()).getFullname();
					//get project name
						project_name=projectService.getProjectById(v.getProject_id()).getName();
					//get vacation type name
						vacation_type_name=vacationService.getVacationTypeById(v.getVacation_type()).getName();
					v.setProject_name(project_name);
					v.setEmployee_name(employee_name);
					v.setVacation_type_name(vacation_type_name);
					v.setApproved_manager(approved_manager);
					v.setDisapproved_manager(disapproved_manager);
					v.setNext_approve_manager(next_approve_manager);
				}
				Long count = vacationService.countAllVacationByEmp2(manager_id);
				int pages = (int) (count / pageSize);
				if (count % pageSize > 0) {
					pages++;
				}
				message.setPages(pages);
				message.setMessage("Get vacation successfully");
				message.setCode("CODE OK!");
				message.setStatus("OK!");
				message.setData(listVacation);
			}
		else {
			message.setCode("CODE OK!");
			message.setStatus("OK!");
			message.setMessage("No result!");
		}
		return message;

	}
	//get number of vacation manager need approve
	@PreAuthorize("hasRole('LEADER_A') OR hasRole('LEADER_B') OR hasRole('LEADER_C')")
	@GetMapping("/vacations/manager/count")
	public CountVacationResponseMng countVacationByStatus2(){
		List<Long> count=vacationService.countVacationByStatusMng(employeeService.getEmployeeIdAuthenticated());
		CountVacationResponseMng cvr=new CountVacationResponseMng();
		cvr.setApproved(count.get(1));
		cvr.setNeed_approve(count.get(0));
		cvr.setDisapproved(count.get(2));
		return cvr;
	}
	//get vacation approved by manager
	@PreAuthorize("hasRole('LEADER_A') OR hasRole('LEADER_B') OR hasRole('LEADER_C')")
	@GetMapping("/vacations/manager/approved")
	public List<Vacation> getApprovedVacationLogByMng(@RequestParam("page") int page,
													  @RequestParam("pageSize") int pageSize	){
		List<Vacation> result=new ArrayList<Vacation>();
		List<Long> list=vacationService.getApprovedIdVacationLogByMng(employeeService.getEmployeeIdAuthenticated(),page,pageSize);
		for(Long i:list) {
			result.add(vacationService.getVacationById(i));
		}
		for(Vacation v:result) {
			List<String> approved_manager=new ArrayList<String>();
			String disapproved_manager=null;
			String project_name=null;
			String employee_name=null;
			String vacation_type_name=null;
			String next_approve_manager=null;
			List<Long> e=vacationService.getApprovedIdByVacationId(v.getVacation_id());
			for(Long i:e) {
				if(employeeService.getEmployeeById(i)!=null)
				approved_manager.add(employeeService.getEmployeeById(i).getFullname());
			}
			//get employee name
				employee_name=employeeService.getEmployeeById(v.getEmployee_id()).getFullname();
			//get project name
				project_name=projectService.getProjectById(v.getProject_id()).getName();
			//get vacation type name
				vacation_type_name=vacationService.getVacationTypeById(v.getVacation_type()).getName();
			v.setProject_name(project_name);
			v.setEmployee_name(employee_name);
			v.setVacation_type_name(vacation_type_name);
			v.setApproved_manager(approved_manager);
			v.setDisapproved_manager(disapproved_manager);
			v.setNext_approve_manager(next_approve_manager);
		}
		return result;
	}
	//get vacation disapproved by manager
	@PreAuthorize("hasRole('LEADER_A') OR hasRole('LEADER_B') OR hasRole('LEADER_C')")
	@GetMapping("/vacations/manager/disapproved")
	public List<Vacation> getDisApprovedVacationLogByMng(@RequestParam("page") int page,
			  											 @RequestParam("pageSize") int pageSize){
		List<Vacation> result=new ArrayList<Vacation>();
		List<Long> list=vacationService.getDisapproveIdVacationLogByMng(employeeService.getEmployeeIdAuthenticated(),page,pageSize);
		for(Long i:list) {
			result.add(vacationService.getVacationById(i));
		}
		for(Vacation v:result) {
			List<String> approved_manager=new ArrayList<String>();
			String disapproved_manager=null;
			String project_name=null;
			String employee_name=null;
			String vacation_type_name=null;
			String next_approve_manager=null;
			List<Long> e=vacationService.getApprovedIdByVacationId(v.getVacation_id());
			for(Long i:e) {
				if(employeeService.getEmployeeById(i)!=null)
				approved_manager.add(employeeService.getEmployeeById(i).getFullname());
			}
			//get employee name
				employee_name=employeeService.getEmployeeById(v.getEmployee_id()).getFullname();
			//get project name
				project_name=projectService.getProjectById(v.getProject_id()).getName();
			//get vacation type name
				vacation_type_name=vacationService.getVacationTypeById(v.getVacation_type()).getName();
			v.setProject_name(project_name);
			v.setEmployee_name(employee_name);
			v.setVacation_type_name(vacation_type_name);
			v.setApproved_manager(approved_manager);
			v.setDisapproved_manager(disapproved_manager);
			v.setNext_approve_manager(next_approve_manager);
		}
		return result;
	}
	// approve a request
	@PreAuthorize("hasRole('LEADER_A') OR hasRole('LEADER_B') OR hasRole('LEADER_C')")
	@GetMapping("/vacations/approve")
	public @ResponseBody Payload approveEmployeeRequest(@RequestParam("vacation_id") long vacation_id) {
		Payload message = new Payload();
		Long manager_id = employeeService.getEmployeeIdAuthenticated();
		Vacation v = vacationService.getVacationById(vacation_id);
		List<Long> test = vacationService.getManagerByVacationId(vacation_id);
		for (Long a : test) {
			if (manager_id == a) {
				Vacation_Log v_log = vacationService.getVacationLogByVacationIdAndNextApproveId(vacation_id,manager_id);
				int max = vacationService.getMaxPriority(vacation_id);
				int my_prio = vacationService.getPriority(manager_id, vacation_id);
				if (my_prio < max) {
					v.setStatus(my_prio + 1);
					v.setIs_approved(false);
					v_log.setApproved_id(manager_id);
					vacationService.saveVacationLog(v_log);
					vacationService.saveVacation(v);
				} else if (my_prio == max) {
					v.setStatus(max + 1);
					v.setIs_approved(true);
					vacationService.saveVacation(v);
					v_log.setApproved_id(manager_id);
					vacationService.saveVacationLog(v_log);
				}
				message.setCode("OK");
				message.setStatus("OK");
				message.setData(v);
				message.setMessage("Approve Vacation successfully! ");
				break;
			} else {
				message.setCode("OK");
				message.setStatus("OK");
				message.setMessage("You don't have permission to approve this vacation!");
			}
		}

		return message;
	}

	// disapprove a request
	@PreAuthorize("hasRole('LEADER_A') OR hasRole('LEADER_B') OR hasRole('LEADER_C')")
	@GetMapping("/vacations/disapprove")
	public @ResponseBody Payload disapproveEmployeeRequest(@RequestParam("vacation_id") long vacation_id) {
		Payload message = new Payload();
		Long manager_id = employeeService.getEmployeeIdAuthenticated();
		Vacation v = vacationService.getVacationById(vacation_id);
		List<Long> test = vacationService.getManagerByVacationId(vacation_id);
		for (Long a : test) {
			if (manager_id == a) {
				Vacation_Log v_log = vacationService.getVacationLogByVacationIdAndNextApproveId(vacation_id,manager_id);
				v.setStatus(-1);
				v.setIs_approved(false);
				vacationService.saveVacation(v);
				v_log.setDisapproved_id(manager_id);
				vacationService.saveVacationLog(v_log);
				message.setCode("OK");
				message.setStatus("OK");
				message.setData(v);
				message.setMessage("Disapprove Vacation successfully! ");
				break;
			} else {
				message.setCode("OK");
				message.setStatus("OK");
				message.setMessage("You don't have permission to disapprove this vacation!");
			}
		}
		return message;

	}

	// search page manager/leader
	@PreAuthorize("hasRole('LEADER_A') OR hasRole('LEADER_B') OR hasRole('LEADER_C')")
	@PostMapping("/vacations/searchv1")
	public @ResponseBody Payload searchVacation(@RequestParam("page") int page, @RequestParam("pageSize") int pageSize,
			@RequestParam("sortedColumn") String sortedColumn, @RequestParam("desc") Boolean desc,
			@RequestBody VacationSearch vacationSearch) {
		Payload message = new Payload();
		Long manager_id = employeeService.getEmployeeIdAuthenticated();
		List<Vacation> list = vacationService.searchVacation(manager_id, page, pageSize, sortedColumn, desc,
				vacationSearch);
		if (list.size() > 0) {
			for(Vacation v:list) {
				List<String> approved_manager=new ArrayList<String>();
				String disapproved_manager=null;
				String project_name=null;
				String employee_name=null;
				String vacation_type_name=null;
				String next_approve_manager=null;
				List<Long> e=vacationService.getApprovedIdByVacationId(v.getVacation_id());
				for(Long i:e) {
					if(employeeService.getEmployeeById(i)!=null)
					approved_manager.add(employeeService.getEmployeeById(i).getFullname());
				}
				//get employee name
					employee_name=employeeService.getEmployeeById(v.getEmployee_id()).getFullname();
				//get project name
					project_name=projectService.getProjectById(v.getProject_id()).getName();
				//get vacation type name
					vacation_type_name=vacationService.getVacationTypeById(v.getVacation_type()).getName();
				v.setProject_name(project_name);
				v.setEmployee_name(employee_name);
				v.setVacation_type_name(vacation_type_name);
				v.setApproved_manager(approved_manager);
				v.setDisapproved_manager(disapproved_manager);
				v.setNext_approve_manager(next_approve_manager);
			}
			Long count = vacationService.CountSearchVacation(manager_id, vacationSearch);
			int pages = (int) (count / pageSize);
			if (count % pageSize > 0) {
				pages++;
			}
			message.setPages(pages);
			message.setMessage("Search vacation successfully");
			message.setCode("CODE OK!");
			message.setStatus("OK!");
			message.setData(list);
		}

		else {
			message.setCode("CODE OK!");
			message.setStatus("OK!");
			message.setMessage("No result!");
		}
		return message;
	}

	// search page employee
	@PostMapping("/vacations/searchv2")
	public @ResponseBody Payload searchVacationP2(@RequestParam("page") int page,
			@RequestParam("pageSize") int pageSize, @RequestParam("sortedColumn") String sortedColumn,
			@RequestParam("desc") Boolean desc, @RequestBody VacationSearch vacationSearch) {
		Payload message = new Payload();
		Long employee_id = employeeService.getEmployeeIdAuthenticated();
		List<Vacation> list = vacationService.searchVacationP2(employee_id, page, pageSize, sortedColumn, desc,
				vacationSearch);
		if (list.size() > 0) {
			for(Vacation v:list) {
				List<String> approved_manager=new ArrayList<String>();
				String disapproved_manager=null;
				String project_name=null;
				String vacation_type_name=null;
				String next_approve_manager=null;
				List<Long> e=vacationService.getApprovedIdByVacationId(v.getVacation_id());
				for(Long i:e) {
					if(employeeService.getEmployeeById(i)!=null)
					approved_manager.add(employeeService.getEmployeeById(i).getFullname());
					else break;
				}
				//get disapprove manager name
				if(vacationService.getDisApproveIdByVacationId(v.getVacation_id())!=null) {
					disapproved_manager=employeeService.getEmployeeById(vacationService.getDisApproveIdByVacationId(v.getVacation_id())).getFullname();
				}
				//get project name
				if(projectService.getProjectById(v.getProject_id())!=null) {
					project_name=projectService.getProjectById(v.getProject_id()).getName();
				}
				//get vacation type name
				if(vacationService.getVacationTypeById(v.getVacation_type())!=null) {
					vacation_type_name=vacationService.getVacationTypeById(v.getVacation_type()).getName();
				}
				//get next approve manager name
				if(vacationService.getManagerIdByEmpProAndStatus(employee_id, v.getProject_id(), v.getStatus())!=null) {
					next_approve_manager=employeeService.getEmployeeById(vacationService.getManagerIdByEmpProAndStatus(employee_id, v.getProject_id(), v.getStatus())).getFullname();
				}
				v.setProject_name(project_name);
				v.setVacation_type_name(vacation_type_name);
				v.setApproved_manager(approved_manager);
				v.setDisapproved_manager(disapproved_manager);
				v.setNext_approve_manager(next_approve_manager);
			}
			Long count = vacationService.CountSearchVacationP2(employee_id, vacationSearch);
			int pages = (int) (count / pageSize);
			if (count % pageSize > 0) {
				pages++;
			}
			message.setPages(pages);
			message.setMessage("Search vacation successfully");
			message.setCode("CODE OK!");
			message.setStatus("OK!");
			message.setData(list);
		}

		else {
			message.setCode("CODE OK!");
			message.setStatus("OK!");
			message.setMessage("No result!");
		}
		return message;
	}

	@GetMapping("/vacations/category")
	public ResponseEntity<VacationCategory> getVacationCategory() {
		VacationCategory category = new VacationCategory();
		category.setVacationTypeList(vacationService.getAllVacationType());
		category.setProjectListByEmployee(projectService.getProjectByEmp(employeeService.getEmployeeIdAuthenticated()));
		category.setProjectList(projectService.getAllProject());
		return new ResponseEntity<VacationCategory>(category, HttpStatus.OK);
	}

	/*-----------End Vacation MainRestController--------*/

}
