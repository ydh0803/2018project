package poly.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.service.impl.UserService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * */
	@Resource(name = "UserService")
	private IUserService userService;
	
	@RequestMapping(value="userjoin")
	public String userjoin() throws Exception{
		return "/userjoin";
	}
	
	@RequestMapping(value="loginProc", method=RequestMethod.POST)
	public String loginProc(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		String temp_user_id = (String) request.getParameter("user_id");
		String temp_user_pw = (String) request.getParameter("user_pw");
		System.out.println(temp_user_id);
		System.out.println(temp_user_pw);
		
		UserDTO tempDTO = new UserDTO();
		tempDTO.setUser_id(temp_user_id);
		tempDTO.setUser_pw(temp_user_pw);
		
		UserDTO uDTO = new UserDTO();
		uDTO = userService.getLogin(tempDTO);
		
		try {
			if(uDTO.getUser_no() > 0) {
				model.addAttribute("msg", "로그인 성공");
				model.addAttribute("url", "/main.do");
				
				session.setAttribute("id", temp_user_id);
			}else {
				model.addAttribute("msg", "로그인 실패");
				model.addAttribute("url", "/main.do");
			}
		}catch(Exception e){
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "/main.do");
		}
		
		
		return "/alert";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session, Model model) throws Exception{
		
		session.removeAttribute("id");
		
		System.out.println("logout");
		
		model.addAttribute("msg", "로그아웃 성공");
		model.addAttribute("url", "/main.do");
		
		return "/alert";
	}

	@RequestMapping(value="joinProc")
	public String joinProc(HttpServletRequest req, Model model) throws Exception{
		
		String user_id = CmmUtil.nvl(req.getParameter("user_id"));
		String user_pw = CmmUtil.nvl(req.getParameter("user_pw"));
		String user_name = CmmUtil.nvl( req.getParameter("user_name"));
		String user_email1 = CmmUtil.nvl( req.getParameter("user_email1"));
		String user_email2 = CmmUtil.nvl( req.getParameter("user_email2"));
		System.out.println(user_id);
		
		//변수들을 각각 넘기면 코드도 길고 귀찮으니까 DTO를 사용한다.
		//DTO는 Data Fransfer Object의 약자로 데이터 전송을 위한 객체
		
		
		String idChk = "";
		
		try {
			System.out.println("아이디 중복확인");
			idChk = userService.getIdChk(user_id);
		} catch (Exception e) {
			System.out.println("아이디 중복확인 실패");
			idChk = "";
			System.out.println(e);
		}
		System.out.println("idchk" + idChk);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_name(user_name);
		uDTO.setUser_id(user_id);
		uDTO.setUser_pw(user_pw);
		uDTO.setUser_email1(user_email1);
		uDTO.setUser_email2(user_email2);
		System.out.println(uDTO.getUser_id());
		
		int result = userService.insertUser(uDTO);
		
		if(result != 1){
			//회원가입이 정상적으로 이루어지지 않음
			model.addAttribute("msg", "회원가입에 실패 하셨습니다.");
			model.addAttribute("url", "/join.do");
		}else{
			System.out.println("회원가입 성공");
			
			//회원가입이 정상적으로 이루어짐
			//정상적으로 회원가입이 되면 '회원가입이 되었습니다' alert창 띄우고 main.do로 이동
			model.addAttribute("msg", "회원가입이 되었습니다.");
			model.addAttribute("url", "/main.do");
		}
		
		return "/alert";
	}
}
