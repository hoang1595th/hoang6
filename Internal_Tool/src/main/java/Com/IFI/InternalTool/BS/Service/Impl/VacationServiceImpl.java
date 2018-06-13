package Com.IFI.InternalTool.BS.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Com.IFI.InternalTool.BS.Service.VacationService;
import Com.IFI.InternalTool.DS.DAO.EmployeeDAO;
import Com.IFI.InternalTool.DS.DAO.VacationDAO;
import Com.IFI.InternalTool.DS.Model.Employee;
import Com.IFI.InternalTool.DS.Model.Vacation;
import Com.IFI.InternalTool.DS.Model.Vacation_Approved;
import Com.IFI.InternalTool.DS.Model.Vacation_Log;
import Com.IFI.InternalTool.DS.Model.Vacation_Type;
import Com.IFI.InternalTool.DS.Model.SearchModel.VacationSearch;
@Service("VacationService")
public class VacationServiceImpl implements VacationService{
	@Autowired
	VacationDAO vacationDAO;
	@Autowired
	EmployeeDAO employeeDAO;
	@Override
	public List<Vacation> getAllVacationByEmp(long employee_id,int page, int pageSize,String sortedColumn,Boolean desc,Boolean is_approved,List<Integer> status) {
		return vacationDAO.getAllVacationByEmp(employee_id, page, pageSize, sortedColumn, desc,is_approved,status);
	}
	@Override
	public boolean saveVacation(Vacation vacation) {
		return vacationDAO.saveVacation(vacation);
	}
	@Override
	public boolean deleteVacation(long vacation_id) {
		return vacationDAO.deleteVacation(vacation_id);
	}
	@Override
	public Vacation getVacationById(long vacation_id) {
		return vacationDAO.getVacationById(vacation_id);
	}
	@Override
	public void saveVacationApproved(Vacation_Approved vacation_approved) {
		vacationDAO.saveVacationApproved(vacation_approved);
	}
	@Override
	public List<Vacation_Type> getAllVacationType() {
		return vacationDAO.getAllVacationType();
	}
	@Override
	public List<Vacation> searchVacationP2(Long employee_id,int page, int pageSize,String sortedColumn,Boolean desc,VacationSearch vacationSearch) {
		return vacationDAO.searchVacationP2(employee_id,page, pageSize, sortedColumn, desc,vacationSearch);
	}
	@Override
	public List<Vacation> searchVacation(Long manager_id,int page, int pageSize,String sortedColumn,Boolean desc,VacationSearch vacationSearch) {
		return vacationDAO.searchVacation(manager_id,page, pageSize, sortedColumn, desc,vacationSearch);
	}
	@Override
	public int getMaxPriority(long vacation_id) {
		return vacationDAO.getMaxPriority(vacation_id);
	}
	@Override
	public int getPriority(long manager_id, long vacation_id) {
		return vacationDAO.getPriority(manager_id, vacation_id);
	}
	@Override
	public List<Vacation> getAllVacationByEmp2(long manager_id,int page, int pageSize,String sortedColumn,Boolean desc) {
		return vacationDAO.getAllVacationByEmp2(manager_id,page,pageSize, sortedColumn, desc);
	
	}
	@Override
	public List<Long> getManagerByVacationId(long vacation_id) {
		return vacationDAO.getManagerByVacationId(vacation_id);
	}
	@Override
	public boolean saveVacationLog(Vacation_Log vacation_log) {
		return vacationDAO.saveVacationLog(vacation_log);
	}

	@Override
	public Vacation_Log getVacationLogByVacationIdAndNextApproveId(long vacation_id, long next_approve_id) {
		return vacationDAO.getVacationLogByVacationIdAndNextApproveId(vacation_id, next_approve_id);
	
	}

	@Override
	public List<Long> getApprovedIdByVacationId(Long vacation_id) {
		return vacationDAO.getApprovedIdByVacationId(vacation_id);
	}
	@Override
	public Long getDisApproveIdByVacationId(Long vacation_id) {
		return vacationDAO.getDisApproveIdByVacationId(vacation_id);
	}
	@Override
	public Long countAllVacationByEmp(List<Integer> status,Boolean is_approved,Long emp_id) {
		return vacationDAO.countAllVacationById(status,is_approved,emp_id);
	}
	@Override
	public List<Long> countVacationByStatusEmp(Long employee_id) {
		return vacationDAO.countVacationByStatus(employee_id);
	}
	@Override
	public List<Long> countVacationByStatusMng(Long manager_id) {
		return vacationDAO.countVacationByStatusMng(manager_id);
	}
	@Override
	public List<Long> getApprovedIdVacationLogByMng(long manager_id,int page, int pageSize) {
		return vacationDAO.getApprovedIdVacationLogByMng(manager_id,page,pageSize);
	}
	@Override
	public List<Long> getDisapproveIdVacationLogByMng(long manager_id,int page, int pageSize) {
		return vacationDAO.getDisapproveIdVacationLogByMng(manager_id,page,pageSize);
	}
	@Override
	public Vacation_Type getVacationTypeById(long vacation_type_id) {
		return vacationDAO.getVacationTypeById(vacation_type_id);
	}
	@Override
	public Long getManagerIdByEmpProAndStatus(long employee_id, long project_id, int status) {
			return vacationDAO.getManagerIdByEmpProAndStatus(employee_id, project_id, status);
		
	}
	@Override
	public Long CountSearchVacation(Long manager_id, VacationSearch vacationSearch) {
		return vacationDAO.CountSearchVacation(manager_id, vacationSearch);
	}
	@Override
	public Long CountSearchVacationP2(Long employee_id, VacationSearch vacationSearch) {
		return vacationDAO.CountSearchVacationP2(employee_id, vacationSearch);
	}
	@Override
	public Long countAllVacationByEmp2(long manager_id) {
		return vacationDAO.countAllVacationByEmp2(manager_id);
	}

}
