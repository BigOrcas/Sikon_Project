package com.sikon.web.product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

//import com.google.gson.JsonObject;
import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.User;
import com.sikon.service.product.ProductService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping(value="json/listProduct")
	public Map listProduct( @RequestBody Search search) throws Exception{
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("JSON 현재 페이지:"+search.getCurrentPage());
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		Map<String , Object> mapName = productService.getProdNames(search);
		
		
		String names = "";
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		Map map2 = new HashMap();
		map2.put("list", map.get("list"));
		map2.put("resultPage", resultPage);
		map2.put("search", search);
		map2.put("prodNames",mapName.get("list"));
		
		
		return map2;
	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
    public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

		System.out.println("썸머노트");
		System.out.println("1: "+multipartFile);
		
		
        //JsonObject jsonObject = new JsonObject();
        Map map = new HashMap();
		
		
        String fileRoot = "C:\\z.utility\\summernote_image\\";	//저장될 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

        // 랜덤 UUID+확장자로 저장될 savedFileName
        String savedFileName = UUID.randomUUID() + extension;	
        
        System.out.println("2: "+savedFileName);
        
        File targetFile = new File(fileRoot + savedFileName);
        
        System.out.println("3: "+targetFile);

        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream,targetFile);	//파일 저장
            //jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
            map.put("url", "/summernoteImage/"+savedFileName);
            //jsonObject.addProperty("responseCode", "success");
            map.put("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	// 실패시 저장된 파일 삭제
            //jsonObject.addProperty("responseCode", "error");
            map.put("responseCode", "error");
            e.printStackTrace();
        }

        
        
        System.out.println("4: "+map);
        
        return map;
    }
	
}