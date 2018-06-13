package Com.IFI.InternalTool.Payloads;

public class CountVacationResponseMng {
	private Long need_approve;
	private Long approved;
	private Long disapproved;
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

	public Long getNeed_approve() {
		return need_approve;
	}

	public void setNeed_approve(Long need_approve) {
		this.need_approve = need_approve;
	}

	public CountVacationResponseMng() {
		super();
	}
	
}
