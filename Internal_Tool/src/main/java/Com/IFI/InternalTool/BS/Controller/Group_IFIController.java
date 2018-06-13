package Com.IFI.InternalTool.BS.Controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Com.IFI.InternalTool.BS.Service.Impl.Group_IFIServiceImpl;
import Com.IFI.InternalTool.DS.Model.Group_IFI;
import Com.IFI.InternalTool.Payloads.Payload;
import Com.IFI.InternalTool.Utils.AppConstants;

@RestController
@RequestMapping("/api/groups")
public class Group_IFIController {
	@Autowired
	Group_IFIServiceImpl groupService;

	@Autowired
	AuthenticationManager authenticationManager;
	Payload message = new Payload();
	Object data = "";

	private static final Logger logger = LoggerFactory.getLogger(Group_IFIController.class);

	// get all group
	@GetMapping
	// @PreAuthorize("hasRole('USER')")
	public @ResponseBody Payload getGroups(
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {

		try {
			data = groupService.getGroups(page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR:" + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Get Gruops Successfull", true);
		return message;
	}

	@GetMapping("/findGroupNameLike")
	// @RolesAllowed("ROLE_USER")
	public @ResponseBody Payload findGroupNameLike(@RequestParam("name") String name,
			@RequestParam(value = "page", defaultValue = AppConstants.DEFAULT_PAGE_NUMBER) int page,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.DEFAULT_PAGE_SIZE) int pageSize) {
		logger.info("Find Group Name Like ... ");

		try {
			data = groupService.findGroupNameLike(name, page, pageSize);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad("Failed", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR: " + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Find Group Like Name Successfull",
				true);
		return message;

	}

	@GetMapping("/findGroupById/{group_id}")
	// @RolesAllowed("ROLE_USER")
	public @ResponseBody Payload findGroupById(@PathVariable String group_id) {
		logger.info("Find Group By Id ... ");

		try {
			data = groupService.getGroupById(group_id);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e);
			message.setPayLoad(data, AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR:" + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Find Group By ID Successfull",
				true);
		return message;

	}

	// create new Group
	@PostMapping("/create")
	@PreAuthorize("hasRole('ADMIN')")
	public @ResponseBody Payload createGroup(@Valid @RequestBody Group_IFI groupRequest) {
		logger.info("Create Group ... ");

		try {
			groupService.saveGroupIFI(groupRequest);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e.getMessage());
			message.setPayLoad("FAILED", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR:" + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Create group Successfull", true);
		return message;
	}

	@DeleteMapping("deleteGroupById/{group_id}")
	@PreAuthorize("hasRole('ADMIN')")
	public @ResponseBody Payload deleteGroupById(@PathVariable String group_id) {
		logger.info("Create Group ... ");

		try {
			data = groupService.deleteGroupById(group_id);
		} catch (Exception e) {
			logger.error("ERROR: Get connection error", e.getMessage());
			message.setPayLoad("FAILED", AppConstants.STATUS_KO, AppConstants.FAILED_CODE, "ERROR:" + e.getMessage(),
					false);
			return message;
		}
		message.setPayLoad(data, AppConstants.STATUS_OK, AppConstants.SUCCESS_CODE, "Create group Successfull", true);
		return message;
	}

}
