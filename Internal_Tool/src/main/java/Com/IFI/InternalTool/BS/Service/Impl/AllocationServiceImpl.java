package Com.IFI.InternalTool.BS.Service.Impl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import Com.IFI.InternalTool.BS.Service.AllocationService;
import Com.IFI.InternalTool.DS.DAO.AllocationDAO;
import Com.IFI.InternalTool.DS.DAO.ProjectManagerDAO;
import Com.IFI.InternalTool.DS.DAO.Impl.AllocationDetailDAOImpl;
import Com.IFI.InternalTool.DS.DAO.Impl.EmployeeDAOImpl;
import Com.IFI.InternalTool.DS.DAO.Impl.ProjectDAOImpl;
import Com.IFI.InternalTool.DS.Model.Allocation;
import Com.IFI.InternalTool.DS.Model.AllocationDetail;
import Com.IFI.InternalTool.Security.UserPrincipal;
import Com.IFI.InternalTool.Utils.Business;

@Service
public class AllocationServiceImpl implements AllocationService {

	@Autowired
	private AllocationDAO allocationDAO;

	@Autowired
	private AllocationDetailDAOImpl allocationDetailDAO;

	@Autowired
	private EmployeeDAOImpl employeeDAO;

	@Autowired
	private ProjectDAOImpl projectDAO;

	private static final Logger logger = LoggerFactory.getLogger(AllocationServiceImpl.class);

	@Override
	public boolean createAllocation(Allocation allocation) {
		LocalDate start_date = allocation.getStart_date().toLocalDate();
		LocalDate end_date = allocation.getEnd_date().toLocalDate();

		// end_date must be > start_date
		if (start_date.isAfter(end_date)) {
			return false;
		}

		// get maxEndDate Allocation in History
		Date maxEndDate = allocationDAO.findMaxEndDate(allocation.getEmployee_id());
		logger.info(maxEndDate + " max end_date in history");

		if (maxEndDate != null) {
			if (start_date.isBefore(maxEndDate.toLocalDate()) || start_date.isEqual(maxEndDate.toLocalDate())) {
				return false;
			}
		}
		// check start_date with maxEndDate

		// get month , get year
		int month = start_date.getMonthValue();
		int year = start_date.getYear();

		// get distance Time between start_date vs end_date not set Weekends;
		int distanceTime = Business.getDistanceTime(start_date, end_date);
		logger.info("distance Time: " + distanceTime);

		// get number days of month // get nums days weekend of month
		int numDaysOfMonth = start_date.lengthOfMonth();
		int numDaysWeekOfMonth = Business.numberWeekendOfMonth(month, year);

		// set allocation_plan
		double allocation_plan = Business.getAllocation_Plan(numDaysOfMonth, numDaysWeekOfMonth, distanceTime);
		logger.info("Allocation_Plan: " + allocation_plan);
		allocation.setAllocation_plan(allocation_plan);

		allocation.setMonth(start_date.getMonthValue());
		allocation.setYear(start_date.getYear());
		if (allocationDAO.saveAllocation(allocation)) {
			return true;
		} else {

			return false;
		}

	}

	@Override
	public List<Allocation> getAllocations(final long employee_id, int page, int pageSize) {
		List<Allocation> list = allocationDAO.getAllocations(employee_id, page, pageSize);
		for (Allocation item : list) {
			item.setEmployee_Name(employeeDAO.getEmployeeById(item.getEmployee_id()).getFullname());
			item.setProject_Name(projectDAO.getProjectById(item.getProject_id()).getName());
		}
		return list;
	}

	@Override
	public List<Allocation> getAllocatedofManager(final long employee_id, int page, int pageSize) {
		return allocationDAO.getAllocatedOfManager(employee_id, page, pageSize);

	}

	@Override
	public Allocation findById(long allocation_id) {
		Allocation a = allocationDAO.findById(allocation_id);
		a.setEmployee_Name(employeeDAO.getEmployeeById(a.getEmployee_id()).getFullname());
		a.setProject_Name(projectDAO.getProjectById(a.getProject_id()).getName());
		return a;
	}

	@Override
	public boolean deleteByID(Long allocation_id) {
		if (allocationDAO.deleteById(allocation_id)) {
			return true;
		}
		return false;
	}

	@Override
	public List<Allocation> SearchAllocationWithTime(int year, int month, int page, int pageSize) {

		return allocationDAO.searchAllocationWithTime(year, month, page, pageSize);
	}

	@Override
	public List<Allocation> findAllocationByEmployeeID(long employee_id, int page, int pageSize) {

		return allocationDAO.findAllocationByEmployeeID(employee_id, page, pageSize);
	}

	@Override
	public List<Allocation> findAllocationByProjectID(long project_id, int page, int pageSize) {
		return allocationDAO.findAllocationByProjectID(project_id, page, pageSize);
	}

	@Override
	public boolean saveAllocationDetail(AllocationDetail allocationDetail) {

		return allocationDetailDAO.saveAllocationDetail(allocationDetail);

	}

	@Override
	public List<Allocation> findAllocationFromDateToDate(Date fromDate, Date toDate, int page, int pageSize) {

		return allocationDAO.findAllocationFromDateToDate(fromDate, toDate, page, pageSize);
	}

}
