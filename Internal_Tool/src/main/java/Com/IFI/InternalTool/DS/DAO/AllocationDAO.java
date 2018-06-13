package Com.IFI.InternalTool.DS.DAO;



import java.sql.Date;
import java.util.List;
import Com.IFI.InternalTool.DS.Model.Allocation;

public interface AllocationDAO {

	List<Allocation> getAllocations(final long employee_id, final int page, final int pageSize);

	List<Allocation> getAllocatedOfManager(final long employee_id, final int page, final int pageSize);

	public Boolean saveAllocation(final Allocation allocation);

	public Boolean updateAllocation(final Allocation allocation);

	public Boolean deleteById(final long allocation_id);

	public Allocation findById(final long allocation_id);

	public Date findMaxEndDate(final long employee_id);

	public List<Allocation> findAllocationByEmployeeID(final long employee_id, final int page, final int pageSize);

	public List<Allocation> searchAllocationWithTime(final int year, final int month, final int page,
			final int pageSize);

	public List<Allocation> findAllocationByProjectID(final long project_id, final int page, final int pageSize);
	//tim kiem allocation tu ngay den ngay
	List<Allocation> findAllocationFromDateToDate(Date fromDate, Date toDate, final int page, final int pageSize);

}


