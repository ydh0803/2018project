package poly.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.NoticeDTO;
import poly.dto.UserDTO;
import poly.dto.UserDTO;
import poly.service.INoticeService;
import poly.service.impl.UserService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * */
	@Resource(name = "NoticeService")
	private INoticeService noticeService;

	private Object nlist;
	
	/*
	 * 함수명 위의 value="notice/NoticeList" => /notice/NoticeList.do로 호출되는 url은 무조건 이 함수가 실행된다.
	 * method=RequestMethod.GET => 폼 전송방법을 지정하는 것으로 get방식은 GET, post방식은 POST이다.
	 * method => 기입안하면 GET, POST 모두 가능하나, 가급적 적어주는 것이 좋다.
	 * */
	
	@RequestMapping(value="main")
	public String main() throws Exception{
		
		System.out.println("main");
		return "/main";
	}
	
	@RequestMapping(value="login")
	public String login() throws Exception{
		
		System.out.println("login");
		return "/login";
	}
	
	@RequestMapping(value="join")
	public String join() throws Exception{
		
		System.out.println("join");
		return "/join";
	}
	
	@RequestMapping(value="arcadeinfo")
	public String arcadeinfo() throws Exception{
		
		System.out.println("arcadeinfo");
		return "/arcadeinfo";
	}
	
	@RequestMapping(value="arcadegame")
	public String arcadegame() throws Exception{
		
		System.out.println("arcadegame");
		return "/arcadegame";
	}
	
	@RequestMapping(value="userrecord")
	public String userrecord(Model model) throws Exception{
		List<NoticeDTO> nDTO = noticeService.getNotice();
		model.addAttribute("NoticeList", nDTO);
		System.out.println("userrecord");
		return "/userrecord";
	}
	
	@RequestMapping(value="write")
	public String write() throws Exception{
		
		System.out.println("write");
		return "/write";
	}
	
	
	@RequestMapping(value="writeProc")
	public String writeProc(HttpServletRequest req, Model model, ServletRequest session) throws Exception{
		
		String post_title = CmmUtil.nvl(req.getParameter("post_title"));
		String post_contents = CmmUtil.nvl(req.getParameter("post_contents"));
		String post_writer = (String) session.getAttribute("user_name");
		System.out.println(post_title);
		System.out.println(post_writer);
		//변수들을 각각 넘기면 코드도 길고 귀찮으니까 DTO를 사용한다.
		//DTO는 Data Fransfer Object의 약자로 데이터 전송을 위한 객체
		
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setPost_title(post_title);
		nDTO.setPost_contents(post_contents);
		nDTO.setPost_writer(post_writer);
		System.out.println(nDTO.getPost_title());
		
		int result = noticeService.insertPost(nDTO);
		
		if(result != 1){
			
			model.addAttribute("msg", "게시글 작성에 실패 하셨습니다.");
			model.addAttribute("url", "/write.do");
		}else{
			System.out.println("작성 성공");
			
			model.addAttribute("msg", "게시글이 작성 되었습니다.");
			model.addAttribute("url", "/userrecord.do");
		}
		
		return "/alert";
	}
}
