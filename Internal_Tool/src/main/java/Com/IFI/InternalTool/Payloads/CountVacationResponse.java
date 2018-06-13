package Com.IFI.InternalTool.Payloads;

public class CountVacationResponse {
	private Long lastest;
	private Long approving;
	private Long approved;
	private Long disapproved;
	
	public Long getLastest() {
		return lastest;
	}

	public void setLastest(Long lastest) {
		this.lastest = lastest;
	}

	public Long getApproving() {
		return approving;
	}

	public void setApproving(Long approving) {
		this.approving = approving;
	}

	public Long getApproved() {
		return approved;
	}

	public void setApproved(Long approved) {
		this.approved = approved;
	}

	public Long getDisapproved() {
		return disapproved;
	}

	public void setDisapproved(Long disapproved) {
		this.disapproved = disapproved;
	}

	public CountVacationResponse() {
		super();
	}
	
	
	
}
