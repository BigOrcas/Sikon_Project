package com.sikon.service.apply;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Apply;


public interface ApplyService {

	public void addApply(Apply apply) throws Exception;

	public Map<String, Object> getApplyList(Search search,String applierId) throws Exception;

	public Apply getApply(int applyNo) throws Exception;

	
	
	public void updateApplyStatus(Apply apply) throws Exception;
	
	
	
	public void buyCook (int cookStatus, int applyNo ) throws Exception ;
	
	public void  cancel (int cookStatus, int applyNo ) throws Exception ;
	
	
}
