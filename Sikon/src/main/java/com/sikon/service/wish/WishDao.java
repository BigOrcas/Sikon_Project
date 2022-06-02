package com.sikon.service.wish;



import java.util.List;

import com.sikon.service.domain.Wish;



public interface WishDao {
	

	public void addWish(Wish wish) throws Exception ;

	
	public List<Wish> getWish(String userId) throws Exception ;


	public void updateWish(int wishNo, int cookStatus) throws Exception ;
		

	public void deleteWish(int wishNo) throws Exception ;
	
}