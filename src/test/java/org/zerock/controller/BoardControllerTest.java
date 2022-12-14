package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
	@WebAppConfiguration
	@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
			"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
	
	@Slf4j
	public class BoardControllerTest {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
	}
	
	
	
	@Test
	public void testLine() throws Exception{
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap().toString()
				);
	}
	
	@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "테스트 새글 제목aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
				.param("content","테스트 새클 내용--------------------------")
				.param("writer","user00")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	
	@Test
	public void testGet() throws Exception{
		log.info("/get===================================================================");
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/board/get")
				.param("bno", "30"))
				.andReturn()
				.getModelAndView().getModelMap().toString()
				);
		
				
				
	}
	
	

	
	@Test
	public void testRemove() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "5")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
		
	}
	
	
	@Test
	public void testModify() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "4")
				.param("title", "ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ")
				.param("content", "ssssssssssssssssssssssssss")
				.param("writer","user00"))
			.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
				
	}
	
	@Test
	public void testListPaging() throws Exception {
		log.info("---+--+-+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "2")
				.param("amount","50"))
			.andReturn().getModelAndView().getModelMap().toString());
		
				
			
		
		
	}
		
	

}
