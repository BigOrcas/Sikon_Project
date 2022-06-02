package com.sikon.service.bookmark.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sikon.common.Search;
import com.sikon.service.bookmark.BookmarkService;
import com.sikon.service.domain.Bookmark;
import com.sikon.service.domain.Recipe;
import com.sikon.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/*.xml" })
public class BookmarkServiceTest {

	@Autowired
	@Qualifier("bookmarkServiceImpl")
	private BookmarkService bookmarkService;

	// @Test
	public void testAddBookmark() throws Exception {

		Recipe recipe = new Recipe();
		recipe.setCookingTime(30);
		recipe.setRecipeDetail("레시피간략설명");
		recipe.setRecipeDifficulty("100");
		recipe.setRecipeImg("a.jpg");
		recipe.setRecipeName("레시피명");
		recipe.setRecipeOrder("요리조리");
		recipe.setRecipeTheme("KO");
		recipe.setRecipeNo(10014);

		User user = new User();
		user.setUserNickname("fdds");
		recipe.setWriter(user);

		Bookmark bookmark = new Bookmark();
		bookmark.setRecipe(recipe);
		bookmark.setUserId("asdf@naver.com");

		bookmarkService.addBookmark(bookmark);

	}

	//@Test
	public void testGetBookmarkListAll() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);

//		Map<String, Object> map = bookmarkService.getBookmarkList(search, "aa@naver.com");
		Map<String, Object> map = bookmarkService.getBookmarkList(search, "asdf@naver.com");

		List<Object> list = (List<Object>) map.get("list");
//		Assert.assertEquals(3, list.size());
		Assert.assertEquals(1, list.size());

		// ==> console 확인
		System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

	}

	// @Test
	public void testDeleteBookmark() throws Exception {

		bookmarkService.deleteBookmark(10001);

	}

}
