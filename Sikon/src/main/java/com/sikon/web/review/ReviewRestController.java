package com.sikon.web.review;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sikon.service.review.ReviewService;

//==> ȸ������ RestController
@RestController
@RequestMapping("/review/*")
public class ReviewRestController {

	/// Field
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewServiceImpl;
	

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public ReviewRestController() {
		System.out.println(this.getClass());
	}


	@RequestMapping(value = "json/addReview/{reviewNo}", method = RequestMethod.GET)
	public void addReview(@PathVariable int reviewNo) throws Exception {

		System.out.println("/purchase/addPurchase : GET");
		// Business Logic
		
		System.out.println("prodNo="+reviewNo);
		
	}
	
	
//	@RequestMapping(value = "json/uploadSummernoteImageFile")
//
//	 public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
//
//		
//        JsonObject jsonObject = new JsonObject();
//System.out.println("��Ʈ�ѷ�");
//        String fileRoot = "C:\\summernote_image\\";	
//        String originalFileName = multipartFile.getOriginalFilename();	
//        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	
//
//        String savedFileName = UUID.randomUUID() + extension;	
//        System.out.println(savedFileName);
//        File targetFile = new File(fileRoot + savedFileName);
//
//        try {
//        	System.out.println("11");
//            InputStream fileStream = multipartFile.getInputStream();
//            FileUtils.copyInputStreamToFile(fileStream, targetFile);	
//            jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
//            jsonObject.addProperty("responseCode", "success");
//
//        } catch (IOException e) {
//        	System.out.println("22");
//            FileUtils.deleteQuietly(targetFile);	
//            jsonObject.addProperty("responseCode", "error");
//            e.printStackTrace();
//        }
//
//        return jsonObject;
//    }
//	
	@RequestMapping(value = "json/uploadSummernoteImageFile")
	public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		System.out.println("����");
		String fileRoot = "C:\\summernote_image\\";	//����� �ܺ� ���� ���
		String originalFileName = multipartFile.getOriginalFilename();	//�������� ���ϸ�
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
				
		String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��
		System.out.println("savedfilename"+savedFileName);
		File targetFile = new File(fileRoot + savedFileName);	
		Map map=new HashMap();
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			System.out.println("������"+fileStream);
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			map.put("url", "/summernoteImage/"+savedFileName);
			map.put("responseCode", "success");
			map.put("name","yeda");
			
			
		} catch (IOException e) {
			System.out.println("����");
			FileUtils.deleteQuietly(targetFile);	//����� ���� ����
			map.put("responseCode", "error");
			e.printStackTrace();
		}
		
		System.out.println("��"+map);
		return map;
	}
	
	
}