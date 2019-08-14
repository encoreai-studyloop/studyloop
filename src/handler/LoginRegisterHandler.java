package handler;

import java.io.File;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import databean.UserDataBean;
import dbbean.SearchDao;
import dbbean.UserDao;
import login.auth.Authenticate;

@Controller
public class LoginRegisterHandler {
	@Resource
	private UserDao userDao;
	@Resource
	private SearchDao searchDao;
	
	private long logintime;
	private long logouttime;
	private Logger log = Logger.getLogger("studyloop");

	@RequestMapping("/register")
	public ModelAndView registerprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getParameter("invalid") != null) {
			
			req.setAttribute("invalid", 1);
		}
		return new ModelAndView("views/login/register");
	}
	
	@RequestMapping("/authForm")
	public ModelAndView authFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
		if(userDao.getUserinfo(email) != null) {
			resp.sendRedirect("register.do?invalid=1");
			return new ModelAndView("views/login/register");
		}
		else {
			Authenticate auth = new Authenticate();
			String randnum = auth.randnum();
			auth.sendMail(email, randnum);
			
			req.setAttribute("email", email);
			req.setAttribute("randnum", randnum);
			return new ModelAndView("views/login/registerCont");
		}

	}
	@RequestMapping("/delForm")
	public ModelAndView delFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
		req.setAttribute("email", email);
		
		return new ModelAndView("views/login/delete");
	}
	
	@RequestMapping("/delPro")
	public ModelAndView delProprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int result = userDao.deleteUserById(Integer.parseInt(req.getParameter("id")));
		req.setAttribute("result", result);
		return new ModelAndView("views/login/delPro");
	}
	
	@RequestMapping("/modForm")
	public ModelAndView modFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
		req.setAttribute("email", email);
		
		return new ModelAndView("views/login/modify");
	}

	@RequestMapping("/modifyAuthForm")
	public ModelAndView modifyAuthFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		String email = req.getParameter("email");
		Authenticate auth = new Authenticate();
		String randnum = auth.randnum();
		auth.sendMail(email, randnum);
		
		req.setAttribute("email", email);
		req.setAttribute("randnum", randnum);
		UserDataBean userDto = userDao.getUserinfo(email);
		req.setAttribute("userDto", userDto);
		String[] addresslist = userDto.getAddress().split("@");
		
		String address= addresslist[0];
		String saddress = addresslist[1];
		req.setAttribute("address", address);
		req.setAttribute("saddress", saddress);
		
		return new ModelAndView("views/login/modifyCont");
	}
	
	@RequestMapping("/delAuthForm")
	public ModelAndView delAuthFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
		Authenticate auth = new Authenticate();
		String randnum = auth.randnum();
		auth.sendMail(email, randnum);
		
		req.setAttribute("email", email);
		req.setAttribute("randnum", randnum);
		UserDataBean userDto = userDao.getUserinfo(email);
		req.setAttribute("userDto", userDto);
		
		return new ModelAndView("views/login/deleteCont");
	}
	
	@RequestMapping("/login")
	public ModelAndView loginPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		return new ModelAndView("views/login/login");
	}
	
	@RequestMapping("/logout")
	public ModelAndView logoutProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		logouttime = System.currentTimeMillis();
		long millis = (logouttime - logintime);
		long minutes = (millis / 1000)  / 60;
		int seconds = (int)((millis / 1000) % 60);			
		log.debug("로그아웃 까지의 총 접속 시간 : "+ minutes+" 분 "+seconds+" 초");
		return new ModelAndView("views/login/logout");
	}
	
	@RequestMapping("/inputPro")
	public ModelAndView inputProprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.debug("회원가입 시도");
		req.setCharacterEncoding("utf-8");
	
		
		UserDataBean userDto = new UserDataBean();

		userDto.setEmail(req.getParameter("email"));
		userDto.setName(req.getParameter("name"));
		userDto.setNick(req.getParameter("nick"));
		userDto.setPasswd(req.getParameter("passwd"));
		userDto.setGender(req.getParameter("gender"));
		userDto.setPic("pic");
		userDto.setPhone(req.getParameter("phone"));
		
		//address
		String address = req.getParameter("address");
		String saddress =  req.getParameter("saddress");
		String fulladdress = address + "@" + saddress;
		userDto.setZipcode(req.getParameter("zipcode"));
		userDto.setAddress(fulladdress);
		
		//regDate
		userDto.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		//birth
		userDto.setBirth(req.getParameter("birth"));
	
		
		//prime
		userDto.setPrime("0");
		//point
		userDto.setPoint(0);
		
		//rate
		userDto.setRate(0.0);
		
		//설문 추가 
		//int result = userDao.insertUser(userDto);
		//req.setAttribute("result", result);
		req.getSession().setAttribute("tmpuserDto", userDto);
		
		
		return new ModelAndView("views/login/survey");
	}
	
	@RequestMapping("/surveyfinish")
	public ModelAndView surveyFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.debug("설문작성 시도");
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute("tmpuserDto");
		String visit = String.join("@",  req.getParameterValues("visit"));		
		String interest =String.join("@", req.getParameterValues("interest"));
		String goal = String.join("@", req.getParameterValues("goal"));
		String open = req.getParameter("open");
		String part = req.getParameter("part");
		userDto.setVisit(visit);
		userDto.setInterest(interest);
		userDto.setGoal(goal);
		userDto.setOpen(open);
		userDto.setPart(part);
		int result = userDao.insertUser(userDto);
		req.setAttribute("result", result);
		log.debug("회원가입 & 설문작성 완료");
		log.debug("\n회원 정보 :\n이름) " + userDto.getName()+"\n성별) "+userDto.getGender()+"\n주소) "+userDto.getAddress()+"\n가입시간) "+ userDto.getRegdate()
		+"\n생일) "+userDto.getBirth() +"\n설문 결과 :\n");
		return new ModelAndView("views/login/inputPro");
	}
	
	
	
	//로그인 처리하는 부분
	@RequestMapping("/loginPro")
	public ModelAndView loginProprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		String email = req.getParameter("email");
		String passwd = req.getParameter("passwd");
	
		int result = userDao.checkIdPs(email, passwd); //0 - 아이디 없음, -1 - 비밀번호 불일치, 1 - 비밀번호 일치
		if(result == 1) {
			UserDataBean userDto = new UserDataBean();
			userDto = userDao.getUserinfo(email);
			req.setAttribute("userDto", userDto);
			log.debug(userDto.getEmail()+" 회원 로그인\n이름 : "+ userDto.getName()+ "\n생년월일 : "+ userDto.getBirth() + "\n성별 : "+ userDto.getGender());
			logintime = System.currentTimeMillis();
		}
		req.setAttribute("email", email);
		req.setAttribute("result", result);
		
	
		if(!req.getParameter("lat").equals(null) && !req.getParameter("lat").equals("")) {
			req.getSession().setAttribute("lat", Double.parseDouble(req.getParameter("lat")));
			req.getSession().setAttribute("long", Double.parseDouble(req.getParameter("long")));
		}
		return new ModelAndView("views/login/loginPro");
	}
	
	@RequestMapping("/primecheck")
	public ModelAndView primeCheckprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		log.debug("프리미엄 구매 페이지 들어옴");
		return new ModelAndView("views/login/prime");
	}
	
	
	@RequestMapping("/test")
	public ModelAndView testprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return new ModelAndView("views/notice/test");
	}
	

}
