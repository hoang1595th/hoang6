package Com.IFI.InternalTool.BS.Service.Impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Com.IFI.InternalTool.BS.Service.Group_IFIService;
import Com.IFI.InternalTool.DS.DAO.Group_IFIDAO;
import Com.IFI.InternalTool.DS.DAO.Impl.Group_IFIDAOImpl;
import Com.IFI.InternalTool.DS.Model.Group_IFI;
import Com.IFI.InternalTool.Payloads.PagedResponse;
//import Com.IFI.InternalTool.Utils.ModelMapper;

@Service
public class Group_IFIServiceImpl implements Group_IFIService {

	@Autowired
	private Group_IFIDAOImpl groupDAO;

	@Override
	public Group_IFI getGroupById(final String group_id) {
		return groupDAO.findGroupById(group_id);
	}

	@Override
	public Boolean saveGroupIFI(final Group_IFI group) {
		return groupDAO.saveGroup(group);
	}

	@Override
	public Boolean deleteGroupById(final String group_id) {

		return groupDAO.deleteGroupById(group_id);

	}

	@Override
	public List<Group_IFI> findGroupNameLike(final String name, final int page, final int pageSize) {

		return groupDAO.findGroupNameLike(name, page, pageSize);
	}

	@Override
	public List<Group_IFI> getGroups(final int page, final int pageSize) {
		return groupDAO.getGroups(page, pageSize);
	}

}
