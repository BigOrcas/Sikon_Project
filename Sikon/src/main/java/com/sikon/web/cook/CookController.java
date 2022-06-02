package com.sikon.web.cook;

import java.util.Map;

import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.domain.Cook;
import com.sikon.service.domain.User;
import com.sikon.service.domain.Heart;

import com.sikon.service.heart.HeartService;
import com.sikon.service.cook.CookService;






@Controller
@RequestMapping("/cook/*")


public class CookController {
	
	
	/// Field
	@Autowired
	@Qualifier("cookServiceImpl")
	private CookService cookService;
	
	/// Field
		@Autowired
		@Qualifier("heartServiceImpl")
		private HeartService heartService;
	

	


	public CookController() {
		System.out.println(this.getClass());
	}


	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;


	@RequestMapping( value="addCook	", method=RequestMethod.GET )
	public String addCook() throws Exception {

		System.out.println("/cook/addCook : GET");

		return "redirect:/cook/addCook.jsp";
	}


	

	@RequestMapping( value="addCook", method=RequestMethod.POST )

	public String addCook(@ModelAttribute("cook") Cook cook,Model model
	,@RequestParam("uploadfile") MultipartFile[] fileArray
			
			) throws Exception {
		
		
	String cookFilename = "";
	//String FILE_SERVER_PATH = "C:\\Users\\bitcamp\\git\\Mini-PJT-Refactoring\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
	String FILE_SERVER_PATH = "C:\\Users\\bitcamp\\git\\Sikon_Project\\Sikon\\src\\main\\webapp\\resources\\images\\uploadFiles";
	//String FILE_SERVER_PATH = "C:\\Users\\sweet\\git\\Sikon_Project\\Sikon\\src\\main\\webapp\\images\\uploadFiles";
		
		for(int i=0; i<fileArray.length;i++) {
		
			if(!fileArray[i].getOriginalFilename().isEmpty()) {
				fileArray[i].transferTo(new File(FILE_SERVER_PATH, fileArray[i].getOriginalFilename()));
				model.addAttribute("msg", "File uploaded successfully.");
				
			}else {
				model.addAttribute("msg", "Please select a valid mediaFile..");
			}
		
			cookFilename+=fileArray[i].getOriginalFilename()+"/";
			
			
		}
		
		//취소는 초기 상태값을 0으로 준다
		
		System.out.println(cook);
		
		cook.setCookFilename(cookFilename);

		
		cookService.addCook(cook);
		model.addAttribute(cook);
				
		return "forward:/cook/readCook.jsp";
	}


	@RequestMapping("getCook")
	public ModelAndView getCook( @RequestParam("cookNo") int cookNo ,
		@CookieValue(value="history", required=false) Cookie cookie,
		HttpServletResponse response) throws Exception {
		
		System.out.println("getCook");
		
		Cook cook = cookService.getCook(cookNo);
		
		
		String history = "/"+cookNo;
		
		
		if(cookie != null) {
			cookie.setValue(cookie.getValue()+history);
		}else {
			cookie = new Cookie("history", history);
		}
		cookie.setPath("/");
		cookie.setMaxAge(3600);
		response.addCookie(cookie);						
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/cook/getCook.jsp");
		modelAndView.addObject("cook", cook);
		return modelAndView;
	}


	
	@RequestMapping( value="updateCook", method=RequestMethod.GET )
	public String updateCook(@RequestParam("cookNo") int cookNo, Model model
			) throws Exception {


		Cook cook = cookService.getCook(cookNo);
		
		
	
		model.addAttribute("cook", cook);

		return "forward:/cook/updateCook.jsp";
	}

	
	@RequestMapping( value="updateCook", method=RequestMethod.POST )
	public String updateProduct(@ModelAttribute("cook") Cook cook, Model model, HttpSession session,
			@RequestParam("uploadfile") MultipartFile[] fileArray  )
			throws Exception {
		
		String cookFilename = "";
		//String FILE_SERVER_PATH = "C:\\Users\\bitcamp\\git\\Mini-PJT-Refactoring\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
		//String FILE_SERVER_PATH = "C:\\workspace(1)\\Sikon-PJT\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
		//String FILE_SERVER_PATH = "C:\\Users\\sweet\\git\\Sikon_Project\\Sikon\\src\\main\\webapp\\images\\uploadFiles";
		String FILE_SERVER_PATH = "C:\\Users\\bitcamp\\git\\Sikon_Project\\Sikon\\src\\main\\webapp\\resources\\images\\uploadFiles";
			for(int i=0; i<fileArray.length;i++) {
			
				if(!fileArray[i].getOriginalFilename().isEmpty()) {
					fileArray[i].transferTo(new File(FILE_SERVER_PATH, fileArray[i].getOriginalFilename()));
					model.addAttribute("msg", "File uploaded successfully.");
					
				}else {
					model.addAttribute("msg", "Please select a valid mediaFile..");
				}
			
				cookFilename+=fileArray[i].getOriginalFilename()+"/";
				
				
			}
			
			

			cook.setCookFilename(cookFilename);
	
		

		cookService.updateCook(cook);

		return "forward:/cook/getCook.jsp?cookNo=" + cook.getCookNo();
	}

	
	@RequestMapping( value="listCook" )
	public String listCook(@ModelAttribute("search") Search search	,
		
			
			@RequestParam("menu") String menu, Model model, HttpServletRequest request)
			throws Exception {

		
	

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
	
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String, Object> map = cookService.getCookList(search);
		
	
				

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		

		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		
		model.addAttribute("list", map.get("list"));
		System.out.println(map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("user",user);
		
	

		return "forward:/cook/listCook.jsp?menu="+menu;
	}
}
