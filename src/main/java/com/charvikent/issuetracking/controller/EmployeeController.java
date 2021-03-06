package com.charvikent.issuetracking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.charvikent.issuetracking.dao.UserDao;
import com.charvikent.issuetracking.model.User;
import com.charvikent.issuetracking.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class EmployeeController {
	
	
	@Autowired
	private UserService userService;


	@Autowired
	UserDao userDao;

	@Autowired
	HttpSession session;

	
	
	@RequestMapping("/employee")
	public String homeUser(Model model,HttpServletRequest request) {
		List<User> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		model.addAttribute("userForm", new User());
		model.addAttribute("departments", userService.getDepartments());
		model.addAttribute("roles", userService.getRoles());
		model.addAttribute("userNames", userService.getUserName());
		model.addAttribute("reportto",userService.getUserName());
		model.addAttribute("allUsers", userService.getAllUsers());
		
		
		try {
			listOrderBeans = userService.getAllUsers();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		

		return "employee";
	}
	
	@RequestMapping(value = "/employee" ,method = RequestMethod.POST)
	public String saveAdmin(@Valid @ModelAttribute  User user, BindingResult bindingresults, 
			RedirectAttributes redir) throws IOException {
		
		if (bindingresults.hasErrors()) {
			System.out.println("has some errors");
			return "redirect:/";
		}
		
		int id = 0;
		try
		{
			User userBean=null;
			if(user.getId()!=null)
			{
			  userBean= userService.getUserById(user.getId());
			
			}
			int dummyId =0;
			
			if(userBean != null){
				dummyId = userBean.getId();
			}
			
			if(user.getId()==null)
			{
				if(dummyId ==0)
				{
					
					
					user.setEnabled("1");
					
					userService.saveUser(user);

					redir.addFlashAttribute("msg", "Record Inserted Successfully");
					redir.addFlashAttribute("cssMsg", "success");
					
				} else
				{
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
					
				}
				
			
			}
			
			else
			{
				id=user.getId();
				if(id == dummyId || userBean == null)
				{
					userService.updateUser(user);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
					
				} else
				{
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return "redirect:employee";
	}
	
	
	@RequestMapping(value = "/deleteUser")
	public @ResponseBody String deleteEmployee(User  objUser,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		List<User> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objUser.getId() != 0){
 				delete = userService.deleteUser(objUser.getId(),objUser.getStatus());
 				if(delete){
 					jsonObj.put("message", "deleted");
 				}else{
 					jsonObj.put("message", "delete fail");
 				}
 			}

			listOrderBeans = userService.getAllUsers();
			 objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				jsonObj.put("allOrders1", listOrderBeans);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				jsonObj.put("allOrders1", listOrderBeans);
			}
		}catch(Exception e){
			e.printStackTrace();
	System.out.println(e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
	
	
	@RequestMapping("/changePassword")
	public String changePasswordHome(@ModelAttribute("changePassword") User user){

		return "changePassword";

	}
	@RequestMapping(value="/changePassword", method= RequestMethod.POST )
	public String changePassword(@ModelAttribute("changePassword") User user,RedirectAttributes redir,HttpServletRequest request){

		User objuserBean = (User) session.getAttribute("cacheUserBean");

		User users = userService.getUserById(objuserBean.getId());
		if(users.getPassword().equals(user.getPassword())) {

			users.setPassword(user.getCpassword());
			userService.updatePassword(users);
			redir.addFlashAttribute("msg", "Password Updated Successfully");
			redir.addFlashAttribute("cssMsg", "warning");
			return "redirect:/";
		}else {
			request.setAttribute("msg", "You Entered Wrong Password");
			request.setAttribute("cssMsg", "warning");
			return "changePassword";
		}



	}




}
