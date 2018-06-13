package Com.IFI.InternalTool.DS.DAO;

import java.sql.Date;
import java.util.List;

import Com.IFI.InternalTool.DS.Model.AllocationDetail;

public interface AllocationDetailDAO {

	List<AllocationDetail> getAllocationDetails(final int page, final int pageSize);

	boolean saveAllocationDetail(final AllocationDetail allocation);

	boolean deleteById(final long allocation_detail_id);

	AllocationDetail findById(final long allocation_detail_id);

	List<AllocationDetail> findAllocationDetailFromToDate(final Date from_date, final Date to_date);
}
