package com.sikon.web.heart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.domain.Heart;
import com.sikon.service.domain.User;
import com.sikon.service.domain.Apply;
import com.sikon.service.heart.HeartService;
import com.sikon.service.apply.ApplyService;





@Controller
@RequestMapping("/heart/*")
public class HeartController {
	
	/// Field
	@Autowired
	@Qualifier("heartServiceImpl")
	private HeartService heartService;

	public HeartController() {
		System.out.println(this.getClass());
	}
	
	@ResponseBody
	@RequestMapping( value="updateHeart", method=RequestMethod.POST )
	public int updateHeart(@ModelAttribute("heart") Heart heart,
			@RequestParam("cookNo") int cookNo,
			@RequestParam("userId") String userId
			
			
			) throws Exception {

		int heartCheck = heartService.heartCheck(cookNo, userId);
		if(heartCheck == 0) {
			//���ƿ� ó������
			heartService.insertHeart(cookNo, userId); //heart���̺� ����
			heartService.updateHeart(cookNo);	//���ƿ� +1
			heartService.updateHeartCheck(cookNo, userId);//���ƿ� check 1
			System.out.println("��Ʈ�� �����Ƕ�");
			
		}else if(heartCheck == 1) {
			heartService.updateHeartCheckCancel(cookNo, userId); //heart check0
			heartService.updateHeartCancel(cookNo); //���ƿ� - 1
			heartService.deleteHeart(cookNo, userId); //���ƿ� ����
			System.out.println("��Ʈ�� �����Ƕ�");
		
		}
		return heartCheck;
	
	}
	
	

}
