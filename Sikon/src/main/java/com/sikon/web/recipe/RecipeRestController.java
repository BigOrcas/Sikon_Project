//package com.sikon.web.recipe;
//
//import java.io.File;
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.UUID;
//
//import org.apache.commons.io.FileUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.sikon.common.Page;
//import com.sikon.common.Search;
//import com.sikon.service.domain.Ingredient;
//import com.sikon.service.domain.Product;
//import com.sikon.service.product.ProductService;
//
////==> 회원관리 RestController
//@RestController
//@RequestMapping("/recipe/*")
//public class RecipeRestController {
//
//	/// Field
//	
//	@Autowired
//	@Qualifier("productServiceImpl")
//	private ProductService productService;
//	
//
//
//	@Value("#{commonProperties['pageUnit']}")
//	int pageUnit;
//	@Value("#{commonProperties['pageSize']}")
//	int pageSize;
//
//	public RecipeRestController() {
//		System.out.println(this.getClass());
//	}
//
//
//	@RequestMapping(value = "json/addIngredient", method = RequestMethod.POST)
//	public Map addIngredient(@RequestBody Ingredient ingredient) throws Exception {
//
//		System.out.println("/왜왜왱ㅇ");
//		// Business Logic
//
//		
//		Map map=new HashMap();
//		
//		return map;
//	}
//
//	
//	@RequestMapping(value = "json/getProduct/{prodNo}", method = RequestMethod.GET)
//	public Product getProduct(@PathVariable int prodNo) throws Exception {
//
//		System.out.println("/product/json/getProduct : GET");
//
//		// Business Logic
//		return productService.getProduct(prodNo);
//	}
//	
//	@RequestMapping(value = "json/updateProduct", method = RequestMethod.POST)
//	public Product updateProduct(@RequestBody Product product) throws Exception {
//
//		System.out.println("/product/updateProduct : POST");
//		
//		// Business Logic
//		
//		System.out.println(product);
//		System.out.println("시작"+product.getProdName());
//		System.out.println(product.getManuDate());
//		product.setManuDate(product.getManuDate().replace("-", ""));
//
//		productService.updateProduct(product);
//		
//		System.out.println("끝"+product.getProdName());
//		return productService.getProduct(product.getProdNo());
//	}
//	
//	@RequestMapping(value = "json/listProduct", method = RequestMethod.POST)
//	public Map listProduct(@RequestBody Search search) throws Exception {
//
//		System.out.println("/product/json/listProduct : POST");
//		// Business Logic
//		System.out.println(pageUnit);
//		System.out.println(pageSize);
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//
//		
//		Map<String, Object> map = productService.getProductList(search);
//		//Map<String , Object> mapName = productService.getProdNames(search);
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);
//
//		Map map2 = new HashMap();
//		map2.put("list", map.get("list"));
//		map2.put("resultPage", map);
//		map2.put("search", search);
//		//map2.put("prodNames",mapName.get("list"));
//
//		System.out.println("map" + map);
//		return map2;
//	}
//	
//	@RequestMapping(value = "json/uploadSummernoteImageFile")
//	public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
//		System.out.println("들어옴");
//		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
//		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
//				
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//		System.out.println("savedfilename"+savedFileName);
//		File targetFile = new File(fileRoot + savedFileName);	
//		Map map=new HashMap();
//		
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			System.out.println("오나욘"+fileStream);
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);
//			map.put("url", "/summernoteImage/"+savedFileName);
//			map.put("responseCode", "success");
//			map.put("name","yeda");
//			
//			
//		} catch (IOException e) {
//			System.out.println("에러");
//			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//			map.put("responseCode", "error");
//			e.printStackTrace();
//		}
//		
//		System.out.println("맵"+map);
//		return map;
//	}
//	
//}